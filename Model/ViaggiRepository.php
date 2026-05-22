<?php

namespace Model;

use Util\Connection;

class ViaggiRepository
{
    public static function findAll()
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('SELECT idViaggio as id, cittaPartenza as partenza, cittaDestinazione as destinazione, CONCAT(data, " ", ora) as data_ora FROM viaggio');
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public static function find($id)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('SELECT idViaggio as id, cittaPartenza as partenza, cittaDestinazione as destinazione, CONCAT(data, " ", ora) as data_ora, contributoEconomico as prezzo, idAutista FROM viaggio WHERE idViaggio = :id');
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(\PDO::FETCH_ASSOC);
    }

    public static function create(array $data)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('INSERT INTO viaggio (cittaPartenza, cittaDestinazione, data, ora, idAutista) VALUES (:partenza, :destinazione, :data, :ora, :autista_id)');
        return $stmt->execute([
            'partenza' => $data['partenza'],
            'destinazione' => $data['destinazione'],
            'data' => $data['data'],
            'ora' => $data['ora'],
            'autista_id' => $data['autista_id']
        ]);
    }

    public static function update($id, array $data)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('UPDATE viaggio SET cittaPartenza = :partenza, cittaDestinazione = :destinazione WHERE idViaggio = :id');
        return $stmt->execute([
            'id' => $id,
            'partenza' => $data['partenza'],
            'destinazione' => $data['destinazione']
        ]);
    }

    public static function delete($id)
    {
        $pdo = Connection::getInstance();
        $pdo->beginTransaction();
        try {
            $stmt = $pdo->prepare('SELECT idAutista FROM viaggio WHERE idViaggio = :id');
            $stmt->execute(['id' => $id]);
            $idAutista = $stmt->fetchColumn();

            $stmt = $pdo->prepare('DELETE FROM richiesta WHERE idViaggio = :id');
            $stmt->execute(['id' => $id]);

            if ($idAutista !== false) {
                $stmt = $pdo->prepare('DELETE f FROM feedbackaut f JOIN richiesta r ON r.idPasseggero = f.idPasseggero WHERE r.idViaggio = :id AND f.idAutista = :idAutista');
                $stmt->execute(['id' => $id, 'idAutista' => $idAutista]);

                $stmt = $pdo->prepare('DELETE f FROM feedbackpas f JOIN richiesta r ON r.idPasseggero = f.idPasseggero WHERE r.idViaggio = :id AND f.idAutista = :idAutista');
                $stmt->execute(['id' => $id, 'idAutista' => $idAutista]);
            }

            $stmt = $pdo->prepare('DELETE FROM viaggio WHERE idViaggio = :id');
            $stmt->execute(['id' => $id]);

            $pdo->commit();
            return true;
        } catch (\Throwable $e) {
            $pdo->rollBack();
            return false;
        }
    }

    public static function search(string $q)
    {
        $pdo = Connection::getInstance();
        $q = trim($q);
        if ($q === '') {
            return self::findAll();
        }

        $like = '%' . $q . '%';
        $stmt = $pdo->prepare(
            'SELECT idViaggio as id, cittaPartenza as partenza, cittaDestinazione as destinazione, CONCAT(data, " ", ora) as data_ora
             FROM viaggio
             WHERE CAST(idViaggio AS CHAR) LIKE :q
                OR cittaPartenza LIKE :q
                OR cittaDestinazione LIKE :q
                OR CAST(idAutista AS CHAR) LIKE :q
                OR CAST(data AS CHAR) LIKE :q
                OR CAST(ora AS CHAR) LIKE :q'
        );
        $stmt->execute(['q' => $like]);
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }
}

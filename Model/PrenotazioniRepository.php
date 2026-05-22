<?php

namespace Model;

use Util\Connection;

class PrenotazioniRepository
{
    public static function findAll()
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('SELECT idRichiesta as id, idViaggio as viaggio_id, idPasseggero as passeggero_id, accettata as status FROM richiesta');
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public static function find($id)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('SELECT idRichiesta as id, idViaggio as viaggio_id, idPasseggero as passeggero_id, accettata as status FROM richiesta WHERE idRichiesta = :id');
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(\PDO::FETCH_ASSOC);
    }

    public static function create(array $data)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('INSERT INTO richiesta (idViaggio, idPasseggero, accettata) VALUES (:viaggio_id, :passeggero_id, :status)');
        return $stmt->execute([
            'viaggio_id' => $data['viaggio_id'],
            'passeggero_id' => $data['passeggero_id'],
            'status' => $data['status']
        ]);
    }

    public static function update($id, array $data)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('UPDATE richiesta SET accettata = :status WHERE idRichiesta = :id');
        return $stmt->execute([
            'id' => $id,
            'status' => $data['status']
        ]);
    }

    public static function delete($id)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('DELETE FROM richiesta WHERE idRichiesta = :id');
        return $stmt->execute(['id' => $id]);
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
            'SELECT idRichiesta as id, idViaggio as viaggio_id, idPasseggero as passeggero_id, accettata as status
             FROM richiesta
             WHERE CAST(idRichiesta AS CHAR) LIKE :q
                OR CAST(idViaggio AS CHAR) LIKE :q
                OR CAST(idPasseggero AS CHAR) LIKE :q
                OR CAST(accettata AS CHAR) LIKE :q'
        );
        $stmt->execute(['q' => $like]);
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }
}

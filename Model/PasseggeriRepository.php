<?php

namespace Model;

use Util\Connection;

class passeggeriRepository
{
    public static function findAll()
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('SELECT idPasseggero as id, nome, cognome, nTelefono as telefono, email FROM passeggero');
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public static function find($id)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('SELECT idPasseggero as id, nome, cognome, nTelefono as telefono, email, nDocumento FROM passeggero WHERE idPasseggero = :id');
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(\PDO::FETCH_ASSOC);
    }

    public static function create(array $data)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('INSERT INTO passeggero (nome, cognome, email, nTelefono) VALUES (:nome, :cognome, :email, :telefono)');
        return $stmt->execute([
            'nome' => $data['nome'],
            'cognome' => $data['cognome'],
            'email' => $data['email'],
            'telefono' => $data['telefono']
        ]);
    }

    public static function update($id, array $data)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('UPDATE passeggero SET nome = :nome, cognome = :cognome, email = :email, nTelefono = :telefono WHERE idPasseggero = :id');
        return $stmt->execute([
            'id' => $id,
            'nome' => $data['nome'],
            'cognome' => $data['cognome'],
            'email' => $data['email'],
            'telefono' => $data['telefono']
        ]);
    }

    public static function delete($id)
    {
        $pdo = Connection::getInstance();

        $stmt = $pdo->prepare('SELECT COUNT(*) FROM richiesta WHERE idPasseggero = :id');
        $stmt->execute(['id' => $id]);
        if ((int)$stmt->fetchColumn() > 0) {
            throw new \RuntimeException('Impossibile eliminare: passeggero associato a prenotazioni.');
        }

        $stmt = $pdo->prepare('DELETE FROM feedbackpas WHERE idPasseggero = :id');
        $stmt->execute(['id' => $id]);

        $stmt = $pdo->prepare('DELETE FROM passeggero WHERE idPasseggero = :id');
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
            'SELECT idPasseggero as id, nome, cognome, nTelefono as telefono, email
             FROM passeggero
             WHERE CAST(idPasseggero AS CHAR) LIKE :q
                OR nome LIKE :q
                OR cognome LIKE :q
                OR nTelefono LIKE :q
                OR email LIKE :q'
        );
        $stmt->execute(['q' => $like]);
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }
}

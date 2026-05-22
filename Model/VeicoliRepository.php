<?php

namespace Model;

use Util\Connection;

class VeicoliRepository
{
    public static function findAll()
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('SELECT idAutista as id, targa, modello FROM autista');
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public static function find($id)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('SELECT idAutista as id, targa, modello, modello FROM autista WHERE idAutista = :id');
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(\PDO::FETCH_ASSOC);
    }

    public static function create(array $data)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('INSERT INTO autista (targa, modello) VALUES (:targa, :modello)');
        return $stmt->execute([
            'targa' => $data['targa'],
            'modello' => $data['modello']
        ]);
    }

    public static function update($id, array $data)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('UPDATE autista SET targa = :targa, modello = :modello WHERE idAutista = :id');
        return $stmt->execute([
            'id' => $id,
            'targa' => $data['targa'],
            'modello' => $data['modello']
        ]);
    }

    public static function delete($id)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('DELETE FROM autista WHERE idAutista = :id');
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
            'SELECT idAutista as id, targa, modello
             FROM autista
             WHERE CAST(idAutista AS CHAR) LIKE :q
                OR targa LIKE :q
                OR modello LIKE :q'
        );
        $stmt->execute(['q' => $like]);
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }
}

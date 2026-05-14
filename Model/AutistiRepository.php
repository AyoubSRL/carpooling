<?php

namespace Model;

use Util\Connection;

class AutistiRepository
{
    public static function findAll()
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('SELECT idAutista as id, nome, cognome, nTelefono as telefono, email FROM autista');
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public static function find($id)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('SELECT idAutista as id, nome, cognome, nTelefono as telefono, email, modello, targa FROM autista WHERE idAutista = :id');
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(\PDO::FETCH_ASSOC);
    }

    public static function create(array $data)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('INSERT INTO autista (nome, cognome, email, nTelefono) VALUES (:nome, :cognome, :email, :telefono)');
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
        $stmt = $pdo->prepare('UPDATE autista SET nome = :nome, cognome = :cognome, email = :email, nTelefono = :telefono WHERE idAutista = :id');
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
        $stmt = $pdo->prepare('DELETE FROM autista WHERE idAutista = :id');
        return $stmt->execute(['id' => $id]);
    }
}

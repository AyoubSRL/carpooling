<?php

namespace Model;

use Util\Connection;

class FeedbackRespositoryaut
{
    public static function findAll()
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('SELECT idFeedback as id, voto as valutazione, recensione as commento, idAutista as autista_id FROM feedbackaut');
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public static function find($id)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('SELECT idFeedback as id, voto as valutazione, recensione as commento, idAutista as autista_id FROM feedbackaut WHERE idFeedback = :id');
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(\PDO::FETCH_ASSOC);
    }

    public static function create(array $data)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('INSERT INTO feedbackaut (voto, recensione, idAutista) VALUES (:valutazione, :commento, :autista_id)');
        return $stmt->execute([
            'valutazione' => $data['valutazione'],
            'commento' => $data['commento'],
            'autista_id' => $data['autista_id']
        ]);
    }

    public static function update($id, array $data)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('UPDATE feedbackaut SET voto = :valutazione, recensione = :commento WHERE idFeedback = :id');
        return $stmt->execute([
            'id' => $id,
            'valutazione' => $data['valutazione'],
            'commento' => $data['commento']
        ]);
    }

    public static function delete($id)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('DELETE FROM feedbackaut WHERE idFeedback = :id');
        return $stmt->execute(['id' => $id]);
    }
}

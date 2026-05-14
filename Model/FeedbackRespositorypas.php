<?php

namespace Model;

use Util\Connection;

class FeedbackRespositorypas
{
    public static function findAll()
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('SELECT idFeedback as id, voto as valutazione, recensione as commento, idPasseggero as passeggero_id FROM feedbackpas');
        $stmt->execute();
        return $stmt->fetchAll(\PDO::FETCH_ASSOC);
    }

    public static function find($id)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('SELECT idFeedback as id, voto as valutazione, recensione as commento, idPasseggero as passeggero_id FROM feedbackpas WHERE idFeedback = :id');
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(\PDO::FETCH_ASSOC);
    }

    public static function create(array $data)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('INSERT INTO feedbackpas (voto, recensione, idPasseggero) VALUES (:valutazione, :commento, :passeggero_id)');
        return $stmt->execute([
            'valutazione' => $data['valutazione'],
            'commento' => $data['commento'],
            'passeggero_id' => $data['passeggero_id']
        ]);
    }

    public static function update($id, array $data)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('UPDATE feedbackpas SET voto = :valutazione, recensione = :commento WHERE idFeedback = :id');
        return $stmt->execute([
            'id' => $id,
            'valutazione' => $data['valutazione'],
            'commento' => $data['commento']
        ]);
    }

    public static function delete($id)
    {
        $pdo = Connection::getInstance();
        $stmt = $pdo->prepare('DELETE FROM feedbackpas WHERE idFeedback = :id');
        return $stmt->execute(['id' => $id]);
    }
}

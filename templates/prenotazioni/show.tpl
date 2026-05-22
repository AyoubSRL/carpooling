<?php $this->layout('layout', ['title' => 'Prenotazione', 'base_path' => $base_path]) ?>
<h1>Prenotazione</h1>
<p>Viaggio ID: <?= $this->e($prenotazione['viaggio_id']) ?></p>
<p>Passeggero ID: <?= $this->e($prenotazione['passeggero_id']) ?></p>
<p>Status: <?= $this->e($prenotazione['status']) ?></p>

<p>
    <a href="<?= $this->e($base_path) ?>/prenotazioni/<?= $this->e($prenotazione['id']) ?>/edit">Modifica</a>
    <a href="<?= $this->e($base_path) ?>/prenotazioni/<?= $this->e($prenotazione['id']) ?>/delete" onclick="return confirm('Sei sicuro?')">Elimina</a>
</p>

<a href="<?= $this->e($base_path) ?>/prenotazioni">Indietro</a>

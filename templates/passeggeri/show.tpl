<?php $this->layout('layout', ['title' => 'Passeggero', 'base_path' => $base_path]) ?>
<h1><?= $this->e($passeggero['nome']) ?> <?= $this->e($passeggero['cognome']) ?></h1>
<p>Email: <?= $this->e($passeggero['email']) ?></p>
<p>Telefono: <?= $this->e($passeggero['telefono']) ?></p>

<p>
    <a href="<?= $this->e($base_path) ?>/passeggeri/<?= $this->e($passeggero['id']) ?>/edit">Modifica</a>
    <a href="<?= $this->e($base_path) ?>/passeggeri/<?= $this->e($passeggero['id']) ?>/delete" onclick="return confirm('Sei sicuro?')">Elimina</a>
</p>

<a href="<?= $this->e($base_path) ?>/passeggeri">Indietro</a>

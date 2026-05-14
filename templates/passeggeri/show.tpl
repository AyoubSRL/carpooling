<?php $this->layout('layout', ['title' => 'Passeggero', 'base_path' => $base_path]) ?>
<h1><?= $this->e($passeggero['nome']) ?> <?= $this->e($passeggero['cognome']) ?></h1>
<p>Email: <?= $this->e($passeggero['email']) ?></p>
<p>Telefono: <?= $this->e($passeggero['telefono']) ?></p>
<a href="<?= $this->e($base_path) ?>/passeggeri">Indietro</a>

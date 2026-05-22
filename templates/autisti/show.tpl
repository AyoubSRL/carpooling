<?php $this->layout('layout', ['title' => 'Autista', 'base_path' => $base_path]) ?>
<h1><?= $this->e($autista['nome']) ?> <?= $this->e($autista['cognome']) ?></h1>
<p>Email: <?= $this->e($autista['email']) ?></p>
<p>Telefono: <?= $this->e($autista['telefono']) ?></p>

<p>
    <a href="<?= $this->e($base_path) ?>/autisti/<?= $this->e($autista['id']) ?>/edit">Modifica</a>
    <a href="<?= $this->e($base_path) ?>/autisti/<?= $this->e($autista['id']) ?>/delete" onclick="return confirm('Sei sicuro?')">Elimina</a>
</p>

<a href="<?= $this->e($base_path) ?>/autisti">Indietro</a>

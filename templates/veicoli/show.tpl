<?php $this->layout('layout', ['title' => 'Veicolo', 'base_path' => $base_path]) ?>
<h1><?= $this->e($veicolo['modello']) ?></h1>
<p>Targa: <?= $this->e($veicolo['targa']) ?></p>

<p>
    <a href="<?= $this->e($base_path) ?>/veicoli/<?= $this->e($veicolo['id']) ?>/edit">Modifica</a>
    <a href="<?= $this->e($base_path) ?>/veicoli/<?= $this->e($veicolo['id']) ?>/delete" onclick="return confirm('Sei sicuro?')">Elimina</a>
</p>

<a href="<?= $this->e($base_path) ?>/veicoli">Indietro</a>

<?php $this->layout('layout', ['title' => 'Viaggio', 'base_path' => $base_path]) ?>
<h1>Viaggio</h1>
<p>Partenza: <?= $this->e($viaggio['partenza']) ?></p>
<p>Destinazione: <?= $this->e($viaggio['destinazione']) ?></p>
<p>Data: <?= $this->e($viaggio['data_ora']) ?></p>
<a href="<?= $this->e($base_path) ?>/viaggi">Indietro</a>

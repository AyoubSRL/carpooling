<?php $this->layout('layout', ['title' => 'Modifica Viaggio', 'base_path' => $base_path]) ?>
<h1>Modifica Viaggio</h1>
<form method="POST" action="<?= $this->e($base_path) ?>/viaggi/<?= $this->e($viaggio['id']) ?>">
<div><label for="partenza">Città di Partenza</label><input type="text" id="partenza" name="partenza" value="<?= $this->e($viaggio['partenza']) ?>" required></div>
<div><label for="destinazione">Città di Destinazione</label><input type="text" id="destinazione" name="destinazione" value="<?= $this->e($viaggio['destinazione']) ?>" required></div>
<button type="submit">Salva</button>
<a href="<?= $this->e($base_path) ?>/viaggi">Annulla</a>
</form>

<?php $this->layout('layout', ['title' => 'Nuovo Viaggio', 'base_path' => $base_path]) ?>
<h1>Nuovo Viaggio</h1>
<form method="POST" action="<?= $this->e($base_path) ?>/viaggi">
<div><label for="partenza">Città di Partenza</label><input type="text" id="partenza" name="partenza" required></div>
<div><label for="destinazione">Città di Destinazione</label><input type="text" id="destinazione" name="destinazione" required></div>
<div><label for="data">Data</label><input type="date" id="data" name="data" required></div>
<div><label for="ora">Ora</label><input type="time" id="ora" name="ora" required></div>
<div><label for="autista_id">ID Autista</label><input type="number" id="autista_id" name="autista_id" required></div>
<button type="submit">Salva</button>
<a href="<?= $this->e($base_path) ?>/viaggi">Annulla</a>
</form>

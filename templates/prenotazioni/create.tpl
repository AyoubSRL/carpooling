<?php $this->layout('layout', ['title' => 'Nuova Prenotazione', 'base_path' => $base_path]) ?>
<h1>Nuova Prenotazione</h1>
<form method="POST" action="<?= $this->e($base_path) ?>/prenotazioni">
<div><label for="viaggio_id">ID Viaggio</label><input type="number" id="viaggio_id" name="viaggio_id" required></div>
<div><label for="passeggero_id">ID Passeggero</label><input type="number" id="passeggero_id" name="passeggero_id" required></div>
<div><label for="status">Stato</label>
<select id="status" name="status">
<option value="0">In attesa</option>
<option value="1">Accettata</option>
</select></div>
<button type="submit">Salva</button>
<a href="<?= $this->e($base_path) ?>/prenotazioni">Annulla</a>
</form>

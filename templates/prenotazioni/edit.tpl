<?php $this->layout('layout', ['title' => 'Modifica Prenotazione', 'base_path' => $base_path]) ?>
<h1>Modifica Prenotazione</h1>
<form method="POST" action="<?= $this->e($base_path) ?>/prenotazioni/<?= $this->e($prenotazione['id']) ?>">
<div><label for="status">Stato</label>
<select id="status" name="status">
<option value="0" <?= $prenotazione['status'] == 0 ? 'selected' : '' ?>>In attesa</option>
<option value="1" <?= $prenotazione['status'] == 1 ? 'selected' : '' ?>>Accettata</option>
</select></div>
<button type="submit">Salva</button>
<a href="<?= $this->e($base_path) ?>/prenotazioni">Annulla</a>
</form>

<?php $this->layout('layout', ['title' => 'Nuovo Veicolo', 'base_path' => $base_path]) ?>
<h1>Nuovo Veicolo</h1>
<form method="POST" action="<?= $this->e($base_path) ?>/veicoli">
<div><label for="targa">Targa</label><input type="text" id="targa" name="targa" required></div>
<div><label for="modello">Modello</label><input type="text" id="modello" name="modello" required></div>
<button type="submit">Salva</button>
<a href="<?= $this->e($base_path) ?>/veicoli">Annulla</a>
</form>

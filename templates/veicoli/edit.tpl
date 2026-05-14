<?php $this->layout('layout', ['title' => 'Modifica Veicolo', 'base_path' => $base_path]) ?>
<h1>Modifica Veicolo</h1>
<form method="POST" action="<?= $this->e($base_path) ?>/veicoli/<?= $this->e($veicolo['id']) ?>">
<div><label for="targa">Targa</label><input type="text" id="targa" name="targa" value="<?= $this->e($veicolo['targa']) ?>" required></div>
<div><label for="modello">Modello</label><input type="text" id="modello" name="modello" value="<?= $this->e($veicolo['modello']) ?>" required></div>
<button type="submit">Salva</button>
<a href="<?= $this->e($base_path) ?>/veicoli">Annulla</a>
</form>

<?php $this->layout('layout', ['title' => 'Modifica Passeggero', 'base_path' => $base_path]) ?>
<h1>Modifica Passeggero</h1>
<form method="POST" action="<?= $this->e($base_path) ?>/passeggeri/<?= $this->e($passeggero['id']) ?>">
<div><label for="nome">Nome</label><input type="text" id="nome" name="nome" value="<?= $this->e($passeggero['nome']) ?>" required></div>
<div><label for="cognome">Cognome</label><input type="text" id="cognome" name="cognome" value="<?= $this->e($passeggero['cognome']) ?>" required></div>
<div><label for="email">Email</label><input type="email" id="email" name="email" value="<?= $this->e($passeggero['email']) ?>" required></div>
<div><label for="telefono">Telefono</label><input type="text" id="telefono" name="telefono" value="<?= $this->e($passeggero['telefono']) ?>" required></div>
<button type="submit">Salva</button>
</form>

<?php $this->layout('layout', ['title' => 'Modifica Autista', 'base_path' => $base_path]) ?>
<h1>Modifica Autista</h1>
<form method="POST" action="<?= $this->e($base_path) ?>/autisti/<?= $this->e($autista['id']) ?>">
<div><label for="nome">Nome</label><input type="text" id="nome" name="nome" value="<?= $this->e($autista['nome']) ?>" required></div>
<div><label for="cognome">Cognome</label><input type="text" id="cognome" name="cognome" value="<?= $this->e($autista['cognome']) ?>" required></div>
<div><label for="email">Email</label><input type="email" id="email" name="email" value="<?= $this->e($autista['email']) ?>" required></div>
<div><label for="telefono">Telefono</label><input type="text" id="telefono" name="telefono" value="<?= $this->e($autista['telefono']) ?>" required></div>
<button type="submit">Salva</button>
</form>

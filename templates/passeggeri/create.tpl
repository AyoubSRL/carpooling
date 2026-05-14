<?php $this->layout('layout', ['title' => 'Nuovo Passeggero', 'base_path' => $base_path]) ?>
<h1>Nuovo Passeggero</h1>
<form method="POST" action="<?= $this->e($base_path) ?>/passeggeri">
<div><label for="nome">Nome</label><input type="text" id="nome" name="nome" required></div>
<div><label for="cognome">Cognome</label><input type="text" id="cognome" name="cognome" required></div>
<div><label for="email">Email</label><input type="email" id="email" name="email" required></div>
<div><label for="telefono">Telefono</label><input type="text" id="telefono" name="telefono" required></div>
<button type="submit">Salva</button>
</form>

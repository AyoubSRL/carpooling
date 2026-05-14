<?php $this->layout('layout', ['title' => 'Passeggeri', 'base_path' => $base_path]) ?>

<h1>Passeggeri</h1>
<a href="<?= $this->e($base_path) ?>/passeggeri/create">Nuovo Passeggero</a>

<table>
<thead><tr><th>ID</th><th>Nome</th><th>Cognome</th><th>Email</th><th>Telefono</th><th>Azioni</th></tr></thead>
<tbody>
<?php if(isset($passeggeri) && count($passeggeri) > 0): ?>
<?php foreach ($passeggeri as $p): ?>
<tr><td><?= $this->e($p['id']) ?></td><td><?= $this->e($p['nome']) ?></td><td><?= $this->e($p['cognome']) ?></td><td><?= $this->e($p['email']) ?></td><td><?= $this->e($p['telefono']) ?></td>
<td><a href="<?= $this->e($base_path) ?>/passeggeri/<?= $this->e($p['id']) ?>">Visualizza</a></td></tr>
<?php endforeach; ?>
<?php else: ?>
<tr><td colspan="6">Nessun passeggero trovato</td></tr>
<?php endif; ?>
</tbody></table>

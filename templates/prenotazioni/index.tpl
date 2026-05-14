<?php $this->layout('layout', ['title' => 'Prenotazioni', 'base_path' => $base_path]) ?>
<h1>Prenotazioni</h1>
<a href="<?= $this->e($base_path) ?>/prenotazioni/create">Nuova Prenotazione</a>
<table>
<thead><tr><th>ID</th><th>Viaggio</th><th>Passeggero</th><th>Status</th><th>Azioni</th></tr></thead>
<tbody>
<?php if(isset($prenotazioni) && count($prenotazioni) > 0): ?>
<?php foreach ($prenotazioni as $p): ?>
<tr><td><?= $this->e($p['id']) ?></td><td><?= $this->e($p['viaggio_id']) ?></td><td><?= $this->e($p['passeggero_id']) ?></td><td><?= $this->e($p['status']) ?></td>
<td><a href="<?= $this->e($base_path) ?>/prenotazioni/<?= $this->e($p['id']) ?>">Visualizza</a></td></tr>
<?php endforeach; ?>
<?php else: ?>
<tr><td colspan="5">Nessuna prenotazione trovata</td></tr>
<?php endif; ?>
</tbody></table>

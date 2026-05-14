<?php $this->layout('layout', ['title' => 'Feedback', 'base_path' => $base_path]) ?>
<h1>Feedback <?= ucfirst($this->e($type)) ?></h1>
<a href="<?= $this->e($base_path) ?>/feedback/<?= $this->e($type) ?>/create">Nuovo Feedback</a>
<table>
<thead><tr><th>ID</th><th>Valutazione</th><th>Commento</th><th>Azioni</th></tr></thead>
<tbody>
<?php if(isset($feedback) && count($feedback) > 0): ?>
<?php foreach ($feedback as $f): ?>
<tr><td><?= $this->e($f['id']) ?></td><td><?= $this->e($f['valutazione']) ?></td><td><?= substr($this->e($f['commento']), 0, 50) ?></td>
<td><a href="<?= $this->e($base_path) ?>/feedback/<?= $this->e($type) ?>/<?= $this->e($f['id']) ?>">Visualizza</a></td></tr>
<?php endforeach; ?>
<?php else: ?>
<tr><td colspan="4">Nessun feedback trovato</td></tr>
<?php endif; ?>
</tbody></table>

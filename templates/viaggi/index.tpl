<?php $this->layout('layout', ['title' => 'Viaggi', 'base_path' => $base_path]) ?>

<h1>Viaggi</h1>
<a href="<?= $this->e($base_path) ?>/viaggi/create">Nuovo Viaggio</a>

<table>
<thead><tr><th>ID</th><th>Partenza</th><th>Destinazione</th><th>Data</th><th>Azioni</th></tr></thead>
<tbody>
<?php if(isset($viaggi) && count($viaggi) > 0): ?>
<?php foreach ($viaggi as $v): ?>
<tr><td><?= $this->e($v['id']) ?></td><td><?= $this->e($v['partenza']) ?></td><td><?= $this->e($v['destinazione']) ?></td><td><?= $this->e($v['data_ora']) ?></td>
<td><a href="<?= $this->e($base_path) ?>/viaggi/<?= $this->e($v['id']) ?>">Visualizza</a></td></tr>
<?php endforeach; ?>
<?php else: ?>
<tr><td colspan="5">Nessun viaggio trovato</td></tr>
<?php endif; ?>
</tbody></table>

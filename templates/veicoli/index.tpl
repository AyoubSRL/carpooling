<?php $this->layout('layout', ['title' => 'Veicoli', 'base_path' => $base_path]) ?>
<h1>Veicoli</h1>
<a href="<?= $this->e($base_path) ?>/veicoli/create">Nuovo Veicolo</a>
<table>
<thead><tr><th>ID</th><th>Targa</th><th>Modello</th><th>Azioni</th></tr></thead>
<tbody>
<?php if(isset($veicoli) && count($veicoli) > 0): ?>
<?php foreach ($veicoli as $v): ?>
<tr><td><?= $this->e($v['id']) ?></td><td><?= $this->e($v['targa']) ?></td><td><?= $this->e($v['modello']) ?></td>
<td><a href="<?= $this->e($base_path) ?>/veicoli/<?= $this->e($v['id']) ?>">Visualizza</a></td></tr>
<?php endforeach; ?>
<?php else: ?>
<tr><td colspan="5">Nessun veicolo trovato</td></tr>
<?php endif; ?>
</tbody></table>

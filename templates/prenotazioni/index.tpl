<?php $this->layout('layout', ['title' => 'Prenotazioni', 'base_path' => $base_path]) ?>
<h1>Prenotazioni</h1>
<a href="<?= $this->e($base_path) ?>/prenotazioni/create">Nuova Prenotazione</a>

<form method="get" action="<?= $this->e($base_path) ?>/prenotazioni" style="margin: 12px 0;">
    <input type="text" name="q" value="<?= $this->e($q ?? '') ?>" placeholder="Cerca..." />
    <button type="submit">Cerca</button>
    <?php if (isset($q) && trim((string)$q) !== ''): ?>
        <a href="<?= $this->e($base_path) ?>/prenotazioni">Reset</a>
    <?php endif; ?>
</form>

<table>
<thead><tr><th>ID</th><th>Viaggio</th><th>Passeggero</th><th>Status</th><th>Azioni</th></tr></thead>
<tbody>
<?php if(isset($prenotazioni) && count($prenotazioni) > 0): ?>
<?php foreach ($prenotazioni as $p): ?>
<tr><td><?= $this->e($p['id']) ?></td><td><?= $this->e($p['viaggio_id']) ?></td><td><?= $this->e($p['passeggero_id']) ?></td><td><?= $this->e($p['status']) ?></td>
<td>
    <a href="<?= $this->e($base_path) ?>/prenotazioni/<?= $this->e($p['id']) ?>">Visualizza</a>
    <a href="<?= $this->e($base_path) ?>/prenotazioni/<?= $this->e($p['id']) ?>/edit">Modifica</a>
    <a href="<?= $this->e($base_path) ?>/prenotazioni/<?= $this->e($p['id']) ?>/delete" onclick="return confirm('Sei sicuro?')">Elimina</a>
</td></tr>
<?php endforeach; ?>
<?php else: ?>
<tr><td colspan="5">Nessuna prenotazione trovata</td></tr>
<?php endif; ?>
</tbody></table>

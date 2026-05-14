<?php $this->layout('layout', ['title' => 'Nuovo Feedback', 'base_path' => $base_path]) ?>
<h1>Nuovo Feedback</h1>
<form method="POST" action="<?= $this->e($base_path) ?>/feedback/<?= $this->e($type ?? 'autisti') ?>">
<div><label for="valutazione">Valutazione (1-5)</label><input type="number" id="valutazione" name="valutazione" min="1" max="5" required></div>
<div><label for="commento">Commento</label><textarea id="commento" name="commento" required></textarea></div>
<?php if(($type ?? '') === 'autisti'): ?>
<div><label for="autista_id">ID Autista</label><input type="number" id="autista_id" name="autista_id" required></div>
<?php else: ?>
<div><label for="passeggero_id">ID Passeggero</label><input type="number" id="passeggero_id" name="passeggero_id" required></div>
<?php endif; ?>
<button type="submit">Salva</button>
<a href="<?= $this->e($base_path) ?>/feedback/<?= $this->e($type ?? 'autisti') ?>">Annulla</a>
</form>

<?php $this->layout('layout', ['title' => 'Modifica Feedback', 'base_path' => $base_path]) ?>
<h1>Modifica Feedback</h1>
<form method="POST" action="<?= $this->e($base_path) ?>/feedback/autisti/<?= $this->e($item['id']) ?>">
<div><label for="valutazione">Valutazione (1-5)</label><input type="number" id="valutazione" name="valutazione" min="1" max="5" value="<?= $this->e($item['valutazione']) ?>" required></div>
<div><label for="commento">Commento</label><textarea id="commento" name="commento" required><?= $this->e($item['commento']) ?></textarea></div>
<button type="submit">Salva</button>
</form>

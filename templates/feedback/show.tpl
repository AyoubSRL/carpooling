<?php $this->layout('layout', ['title' => 'Feedback', 'base_path' => $base_path]) ?>
<h1>Feedback</h1>
<p>Valutazione: <?= $this->e($item['valutazione']) ?>/5</p>
<p>Commento:</p>
<p><?= nl2br($this->e($item['commento'])) ?></p>
<a href="javascript:history.back()">Indietro</a>

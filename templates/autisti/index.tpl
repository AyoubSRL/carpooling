<?php $this->layout('layout', ['title' => 'Autisti', 'base_path' => $base_path]) ?>

<h1>Autisti</h1>
<a href="<?= $this->e($base_path) ?>/autisti/create">Nuovo Autista</a>

<div>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Cognome</th>
                <th>Email</th>
                <th>Telefono</th>
                <th>Azioni</th>
            </tr>
        </thead>
        <tbody>
            <?php if(isset($autisti) && count($autisti) > 0): ?>
            <?php foreach ($autisti as $autista): ?>
            <tr>
                <td><?= $this->e($autista['id']) ?></td>
                <td><?= $this->e($autista['nome']) ?></td>
                <td><?= $this->e($autista['cognome']) ?></td>
                <td><?= $this->e($autista['email']) ?></td>
                <td><?= $this->e($autista['telefono']) ?></td>
                <td>
                    <a href="<?= $this->e($base_path) ?>/autisti/<?= $this->e($autista['id']) ?>">Visualizza</a>
                    <a href="<?= $this->e($base_path) ?>/autisti/<?= $this->e($autista['id']) ?>/edit">Modifica</a>
                    <a href="<?= $this->e($base_path) ?>/autisti/<?= $this->e($autista['id']) ?>/delete" onclick="return confirm('Sei sicuro?')">Elimina</a>
                </td>
            </tr>
            <?php endforeach; ?>
            <?php else: ?>
            <tr><td colspan="6">Nessun autista trovato</td></tr>
            <?php endif; ?>
        </tbody>
    </table>
</div>

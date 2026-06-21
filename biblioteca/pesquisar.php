<?php
include 'includes/conexao.php';
include 'includes/functions.php';
include 'includes/header.php';
include 'includes/menu.php';

$busca = $_GET['busca'] ?? '';
$resultado = null;

if(!empty($busca)){
    $buscaTratada = mysqli_real_escape_string($conexao, $busca);

    $sql = "
        SELECT * 
        FROM livro
        WHERE titulo LIKE '%$buscaTratada%'
        ORDER BY titulo
    ";

    $resultado = mysqli_query($conexao, $sql);
}
?>

<div class="container mt-4">
    <h2 class="mb-4">Pesquisar Livros</h2>

    <div class="card mb-4">
        <div class="card-body">
            <form method="GET">
                <div class="row">
                    <div class="col-md-10">
                        <input type="text" name="busca" class="form-control" placeholder="Digite o título..." value="<?php echo htmlspecialchars($busca); ?>">
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-primary w-100">Pesquisar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <?php if(!empty($busca)): ?>
        <div class="card">
            <div class="card-header">Resultado da pesquisa</div>
            <div class="card-body">
                <table class="table table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Título</th>
                            <th>ISBN</th>
                            <th>Ano</th>
                            <th>Quantidade</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if($resultado && mysqli_num_rows($resultado) > 0): ?>
                            <?php while($livro = mysqli_fetch_assoc($resultado)): ?>
                                <tr>
                                    <td><?php echo $livro['id_livro']; ?></td>
                                    <td><?php echo $livro['titulo']; ?></td>
                                    <td><?php echo $livro['isbn']; ?></td>
                                    <td><?php echo $livro['ano']; ?></td>
                                    <td><?php echo $livro['quantidade']; ?></td>
                                </tr>
                            <?php endwhile; ?>
                        <?php else: ?>
                            <tr>
                                <td colspan="5">Nenhum livro encontrado.</td>
                            </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    <?php endif; ?>
</div>

<?php include 'includes/footer.php'; ?>
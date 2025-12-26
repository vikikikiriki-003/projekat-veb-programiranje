<?php
require_once '../app/config/config.php';
require_once '../app/classes/User.php';
require_once '../app/classes/Product.php';

$user = new User();

if ($user->is_logged() && $user->is_admin()) : 

$products = new Product();
$products = $products->fetch_all();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body class="bg-secondary-subtle">
    
    <div class="container">
        <a href="../index.php" class="btn btn-secondary">Home</a>
        <a href="add_product.php" class="btn btn-secondary">Add product</a>
        <a href="../logout.php" class="btn btn-secondary">Logout</a>
        
        <table class="table tabel-striped">
            <thead>
                <tr>
                    <th scope="col">Product ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Size</th>
                    <th scope="col">Image</th>
                    <th scope="col">Created at</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($products as $product): ?>
                    <tr>
                        <th scope="row"><?php echo $product['product_id']; ?></th>
                        <td><?php echo $product['name']; ?></td>
                        <td><?php echo $product['price']; ?>€</td>
                        <td><?php echo $product['size']; ?></td>
                        <td><?php echo $product['image']; ?></td>
                        <td><?php echo $product['created_at']; ?></td>
                        <td>
                            <a href="edit_product.php?id=<?php echo $product['product_id']; ?>" class="btn btn-secondary">Edit</a>
                            <a href="delete_product.php?id=<?php echo $product['product_id']; ?>" class="btn btn-secondary">Delete</a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

<?php endif; ?>
<?php
    require_once "includes/header.php";
    require_once "app/classes/Product.php";
    $products = new Product();
    $products = $products->fetch_all();
?>

<div class="row">
    <?php foreach ($products as $product): ?>
        <div class="col-md-4">
            <div class="card">
                <img src="public/product_images/<?php echo $product['image'] ?>" class="card-img-top" alt="<?php echo $product['name'] ?>">
                <div class="card-body">
                    <h5 class="card-title"><?php echo $product['name'] ?></h5>
                    <p class="card-text">Size: <?php echo $product['size'] ?></p>
                    <p class="card-text">Price: <?php echo $product['price'] ?>€</p>
                    <a href="product.php?product_id=<?php echo $product['product_id'] ?>" class="btn btn-secondary">View Product</a>
                </div>
            </div>
        </div>
    <?php endforeach; ?>
</div>

<?php
    require_once "includes/footer.php";
?>
<?php

require_once "app/config/config.php";
require_once "app/classes/User.php";
$user = new User();

?>
<!DOCTYPE html>
<html>
<head>
    <title>Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">   
</head>
<body class="bg-secondary-subtle">
    <nav class="navbar navbar-expand-lg navbar-light bg-dark-subtle mb-5">
        <div class="container">
            <a class="navbar-brand" href="#">Shop</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target>
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.php">Home</a>
                    </li>
                    <?php if(!$user->is_logged()) : ?>
                    <li class="nav-item">
                        <a class="nav-link" href="register.php">Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.php">Login</a>
                    </li>
                    <?php else : ?>
                    <li class="nav-item">
                        <a class="nav-link" href="orders.php">My orders</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.php">Logout</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cart.php">
                            Cart
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M10 19.5c0 .829-.672 1.5-1.5 1.5s-1.5-.671-1.5-1.5c0-.828.672-1.5 1.5-1.5s1.5.672 1.5 1.5zm3.5-1.5c-.828 0-1.5.671-1.5 1.5s.672 1.5 1.5 1.5 1.5-.671 1.5-1.5c0-.828-.672-1.5-1.5-1.5zm1.336-5l1.977-7h-16.813l2.938 7h11.898zm4.969-10l-3.432 12h-12.597l.839 2h13.239l3.474-12h1.929l.743-2h-4.195z"/>
                            </svg> 
                        </a>
                    </li>
                    <?php if($user->is_admin()) : ?>
                        <li class="nav-item">
                            <a class="nav-link" href="admin/index.php">Admin</a>
                        </li>
                    <?php endif; ?>
                    <?php endif; ?>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">

<?php if(isset($_SESSION['message'])) : ?>
    <div class="alert alert-<?php echo $_SESSION['message']['type']; ?> alert dismissible fade show" role="alert">
        <?php
            echo $_SESSION['message']['text'];
            unset($_SESSION['message']);
        ?>
    </div>
<?php endif; ?>
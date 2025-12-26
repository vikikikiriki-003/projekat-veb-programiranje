<?php
require_once '../app/config/config.php';
require_once '../app/classes/User.php';
require_once '../app/classes/Product.php';

$user = new User();

if ($user->is_logged() && $user->is_admin()) :
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $product = new Product();

        $name = $_POST['name'];
        $price = $_POST['price'];
        $size = $_POST['size'];
        $image = $_POST['photo_path'];

        $product->create($name, $price, $size, $image);

        header('Location: index.php');
    }
endif;

?>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">   
<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css">
<body class="bg-secondary-subtle">
<div class="container">
        <form action="" method="post">
            <input type="text" name="name" placeholder="Product Name">
            <input type="text" name="price" step="0.01" placeholder="Product Price">
            <input type="text" name="size" placeholder="Product Size">
            <input type="hidden" name="photo_path" id="photoPathInput">
            <div id="dropzone-upload" class="dropzone"></div>
            <button type="submit" class="btn btn-secondary">Add product</button>
        </form>
</div>
<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>

<script>
    Dropzone.options.dropzoneUpload = {
        url: "upload_photo.php",
        paramName: "photo",
        maxFilesize: 20,
        acceptedFiles: "image/*",
        init: function () {
            this.on("success", function (file, response){
                const jsonResponse = JSON.parse(response);

                if (jsonResponse.success) {
                    document.getElementById('photoPathInput').value = jsonResponse.photo_path;
                } else {
                    console.error(jsonResponse.error);
                }
            });
        }
    };
</script>
</body>
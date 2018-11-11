<!DOCTYPE html>
<html>
<body>
<div>
<?php
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
    list($scriptPath) = get_included_files();
    echo "Successfully uploaded to ".
        dirname($scriptPath) . "/" . $target_dir .
        basename( $_FILES["fileToUpload"]["name"]);
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
?>
</div>
<br>
<div>
<button onclick="history.go(-1);">Back </button>
</div>
</body>
</html>

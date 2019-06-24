<!doctype html>
<html>
    <head>
    </head>
    <body>
    <?php
        // Problematic code snippet:
        // begin
        if ( isset( $_GET['language'] ) ) {
        include( $_GET['language'] . '.php' );
        }
        if ( isset( $_GET['page'] ) ) {
            include( $_GET['page']);
        }
        // end 
    ?>
    <div>
        <form method="get">
           Set language of page:
		   <select name="language">
			  <option value="english">English</option>
			  <option value="melay">French</option>
		   </select>
		   <input type="submit">
        </form>
    </div>
    <br/>
    <div>
        <form action="upload.php" method="post" enctype="multipart/form-data">
            Select File to upload:
            <input type="file" name="fileToUpload" id="fileToUpload">
            <input type="submit" value="Upload File" name="submit">
        </form>
    </div>
    <br/>
    <div>
        <form method="get">
            Show help:
            <select name="page">
                <option value="introduction.md">Introduction</option>
                <option value="secondchapter.md">Second Chapter</option>
            </select>
            <input type="submit">
        </form>
    </div>
    </body>
</html>

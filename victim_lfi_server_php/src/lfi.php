<!doctype html>
<html>
    <head>
    </head>
    <body>
    <?php
        if ( isset( $_GET['language'] ) ) {
            echo 'Included with <pre style="display:inline">include</pre>';
            echo '<pre>';
            // Problematic code snippet:
            // Example: include statement + adding of file extension 
            // begin
            include( $_GET['language'] . '.php' );
            // end
            echo '</pre>';
        }
        if ( isset( $_GET['page'] ) ) {
            echo 'Included with <pre style="display:inline">include</pre>';
            echo '<pre>';
            // Problematic code snippet:
            // Example: include statement wo any obstacles
            // begin               
            include( $_GET['page'] );
            // end
            echo '</pre>';
        }
        if ( isset( $_GET['require'] ) ) {
            echo 'Included with <pre style="display:inline">require</pre>';
            echo '<pre>';
            // Problematic code snippet:
            // Example: require statement
            // begin
            require( $_GET['require'] );
            // end
            echo '</pre>';
        }
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

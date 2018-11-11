<%@ page import = "java.io.*,java.util.*, java.util.regex.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>

<%
    File file;
    int maxFileSize = Integer.MAX_VALUE;
    int maxMemSize = Integer.MAX_VALUE;

   ServletContext context = pageContext.getServletContext();
   String filePath = context.getInitParameter("file-upload");

   // Verify the content type
   String contentType = request.getContentType();

   if ((contentType.indexOf("multipart/form-data") >= 0)) {
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // maximum file size to be uploaded
        upload.setSizeMax( maxFileSize );

         try {
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            Iterator i = fileItems.iterator();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>JSP File upload</title>");
            out.println("</head>");
            out.println("<body>");

            while ( i.hasNext () ) {
                FileItem fi = (FileItem)i.next();
                if ( !fi.isFormField () ) {
                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();

                    // Write the file
                    if( fileName.lastIndexOf(Pattern.quote(File.separator)) >= 0 ) {
                        file = new File( filePath +
                        fileName.substring( fileName.lastIndexOf(Pattern.quote(File.separator)))) ;
                    } else {
                        file = new File( filePath +
                        fileName.substring(fileName.lastIndexOf(Pattern.quote(File.separator))+1)) ;
                    }
                    fi.write( file ) ;
                    out.println("File upload to:<br>");
                    out.println(filePath + fileName + "<br>");
                }
            }
            out.println("<br>");
            out.println("<button type=\"button\" name=\"back\" onclick=\"history.back()\">back</button>");
            out.println("</body>");
            out.println("</html>");
         } catch(Exception ex) {
            System.out.println(ex);
         }
   }

%>

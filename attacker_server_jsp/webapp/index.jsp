<!doctype html>
<head>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <title>File Upload Form</title>
</head>
<h3>File Upload</h3>
Select a file to upload: <br>
<br>

<form action = "UploadFile.jsp" method = "post" enctype = "multipart/form-data">
    <input type = "file" name = "file" size = "50" />
    <br />
    <input type = "submit" value = "Upload File" />
</form>

<br>
<br>

<h3>Introduction</h3>
<form>
    <input type="hidden" name="help" value="introduction">
    <input type = "submit" value = "Show" />
</form>


<c:if test="${not empty param.help}">
    <pre><c:import    url = "<%= request.getParameter(\"help\")%>"/> </pre>
</c:if>

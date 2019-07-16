<!doctype html>
<head>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <title>File Upload Form</title>
</head>
<body>
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
    <br>
    Included with <pre style="display:inline">c:import</pre>
    <pre>
      <%-- Problematic code snippet: --%>
      <%-- Example: c:import statement wo any obstacles --%>
      <%-- begin --%>
      <c:import url = "<%= request.getParameter(\"help\")%>" />
      <%-- end --%>
    </pre>
</c:if>

<c:if test="${not empty param.cimportfileending}">
    <br>
    Included with <pre style="display:inline">c:import</pre> + adding of jsp file extension
    <pre>
      <%-- Problematic code snippet: --%>
      <%-- Example: c:import statement + separation of sink and source + adding of jsp file extension --%>
      <%-- begin --%>
      <c:set var = "fileending" value = ".jsp" />
      <c:set var = "codeurl" value = "<%= request.getParameter(\"cimportfileending\")%>" />
      <c:import var = "data" url = "${codeurl}${fileending}" />
      ${data} 
      <%-- end --%>
    </pre>
</c:if>

<c:if test="${not empty param.jspinclude}">
    <br>
    Included with <pre style="display:inline">jsp:include</pre>
   <pre> 
      <%-- Problematic code snippet: --%>
      <%-- Example: jsp:include statement --%>
      <%-- begin --%>
      <jsp:include page="<%= request.getParameter(\"jspinclude\")%>" />
      <%-- end --%>
    </pre>
</c:if>
</body>

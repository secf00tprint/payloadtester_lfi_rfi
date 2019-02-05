<body>
	<h1>Hello
<% 
String name = request.getParameter("name");
if(name != null && name.length() > 0) {
	out.println(name);	
} else {
	out.println("World");	
}	
%>	
	from a JSP!</h1>
</body>

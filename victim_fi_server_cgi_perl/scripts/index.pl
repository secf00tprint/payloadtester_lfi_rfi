#!/usr/bin/perl
use LWP::Simple;

#Example code based on https://labs.detectify.com/2012/11/16/local-file-inclusions-in-perlcgi/
$query = $ENV{'QUERY_STRING'};
#Do we have any parameters?
if (length ($query) > 0) {

    #Separate the parameters as a collection of key-value pairs.
    @pairs = split(/&/, $query); 
    foreach $pair (@pairs) {
        ($key, $value) = split(/=/, $pair); 
        $key_value_pair{$key} = $value; 
    }
    $file = $key_value_pair{'file'};

    $content = '';
    
    if ($file =~ /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)/) {
        $content = get($file);
    } else {
         #Try to read the file.
        open(my $fh ,$file)
            or print "Could not open file '$file' ";
        {
            local $/;
            $content = <$fh>;
        }
        close($fh);
    }

    $length = length($content);
    #Generate the HTTP response.
    print "Content-Type: text/html\n"; 
    print "Content-Length: $length\n";
    print "\n";
    print $a;
    print $content; 
} else {
    #No parameters? Weird. Redirect to the index page.
    print "Location: index2.pl?file=index.html\n\n";
}

#Finalize execution.
exit 0;

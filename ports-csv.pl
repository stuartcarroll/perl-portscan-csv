#!/usr/bin/perl

use IO::Socket;
use warnings;

# Perl Port Checker - stuart@stuartc.net
# To run: perl ports.pl <CSV>
# CSV format: SourceIP,Port,DestinationIP

sub main 
{
    # Note: this could be a full file path
    my $filename = $ARGV[0] or die "Need to get CSV file on the command line. Example: perl ports-csv.pl hosts.csv\n";
    
    open(INPUT, $filename) or die "Cannot open $filename";
    
    # Read the lines one by one.
    while($line = <INPUT>)
    {
        chomp($line);
    
        my ($sourceip, $port, $destinationip) = split(',', $line);
    

$socket = IO::Socket::INET->new(LocalAddr => $sourceip , PeerAddr => $destinationip , PeerPort => $port , Proto => 'tcp' , Timeout => 1);

if( $socket )
{
    print "From $sourceip to $destinationip on TCP $port is open.\n";
}
else
{
    print "From $sourceip to $destinationip on TCP $port is closed.\n";
}

    }
    
    close(INPUT);
}

main();


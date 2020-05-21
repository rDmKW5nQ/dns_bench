#!/usr/bin/perl

use strict;
use warnings;
use Net::DNS;
use Time::HiRes;

my $host = 'www.google.com';

my %servers = (
	'OpenDNS_1' => '208.67.222.222',
	'OpenDNS_2' => '208.67.220.220',
	'DNSPrivacy' => '94.130.110.185',
	'L3?' => '209.244.0.3',
	'L3?' => '209.244.0.4',
	'Verisign' => '64.6.64.6',
	'Google_1' => '8.8.8.8',
	'Google_2' => '8.8.4.4',
	'Quad9_1' => '9.9.9.9',
	'CloudFlare' => '1.1.1.1',
	'Quad9_2' => '149.112.112.112',
	'DNS.com?' => '8.26.56.26', 
	'DNS.com?' => '8.20.247.20',
	'DNSINC_1' => '216.146.35.35', 
	'DNSINC_2' => '216.146.36.36', 
	'EMERION?' => '37.235.1.174', 
	'EMERION?' => '37.235.1.177', 
	'CensurFriDNS' => '89.233.43.71', 
	'DNSWatch_1' => '84.200.69.80', 
	'DNSWatch_2' => '84.200.70.40', 
	'Hurricane Electric' => '74.82.42.42', 
	'guifi-net?' => '109.69.8.51',
	'OpenNIC' => '94.247.43.254'
	);

while (my ($name, $ip) = each(%servers))
{
	my $res = Net::DNS::Resolver->new(nameservers => [$ip]);
	$res->udp_timeout(2);
	$res->retry(1);
	my $start = Time::HiRes::gettimeofday();
	my $query = $res->search($host);
	my $end = Time::HiRes::gettimeofday();

	if ($query) 
	{
		foreach my $rr ($query->answer) 
		{
			next unless $rr->type eq "A";
			#print $rr->address, "\n";
		}
	
		printf("%-20s %-15s %.10f\n", $name, $ip, $end - $start);
	}
	else 
	{
		printf("%-10s %-15s failed: %s \n", $name, $ip, $res->errorstring);
	}
}

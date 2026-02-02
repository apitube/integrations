#!/usr/bin/perl
use strict;
use warnings;
use LWP::UserAgent;
use JSON;

my $ua = LWP::UserAgent->new;
$ua->timeout(30);

my $url = 'https://api.apitube.io/v1/news/everything?limit=50&api_key=YOUR_API_KEY';

my $response = $ua->get($url);

if ($response->is_success) {
    my $data = decode_json($response->decoded_content);
    print JSON->new->pretty->encode($data);
} else {
    print "HTTP Request Error: " . $response->status_line . "\n";
}

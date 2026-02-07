#!/usr/bin/perl
use strict;
use warnings;
use HTTP::Tiny;
use JSON;

my $http = HTTP::Tiny->new(timeout => 30);

my $url = 'https://api.apitube.io/v1/news/everything?per_page=50&api_key=YOUR_API_KEY';

my $response = $http->get($url);

if ($response->{success}) {
    my $data = decode_json($response->{content});
    print JSON->new->pretty->encode($data);
} else {
    print "HTTP Request Error: $response->{status} $response->{reason}\n";
}

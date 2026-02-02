#!/usr/bin/perl
use strict;
use warnings;
use Mojo::UserAgent;
use Mojo::JSON qw(encode_json);

my $ua = Mojo::UserAgent->new;
$ua->connect_timeout(30);

my $url = 'https://api.apitube.io/v1/news/everything';

my $tx = $ua->get($url => form => {
    limit   => 50,
    api_key => 'YOUR_API_KEY'
});

if (my $res = $tx->result) {
    if ($res->is_success) {
        my $data = $res->json;
        print $res->body;
    } else {
        print "HTTP Request Error: " . $res->code . "\n";
    }
} else {
    my $err = $tx->error;
    print "Connection error: $err->{message}\n";
}

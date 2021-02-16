#!/usr/bin/env perl
use strict;
use warnings;
use App::MigrateToTest2V0;
use PPI;

process($_) for @ARGV;

sub process {
    my $filename = shift;
    die "$filename not found" unless -e $filename;

    my $doc = PPI::Document->new($filename);
    App::MigrateToTest2V0->apply($doc);
}

1;

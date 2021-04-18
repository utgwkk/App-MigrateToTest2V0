package Test2::Plugin::Wrap2ndArgumentOfFailedCompareTestWithString;
use strict;
use warnings;
use PPIx::Utils qw(parse_arg_list);
use PPI;
use Test2::API qw(
    test2_add_callback_post_load
    test2_stack
);

my $loaded = 0;

sub import {
    my ($class) = @_;

    return if $loaded++;

    test2_add_callback_post_load(sub {
        my $hub = test2_stack()->top;

        $hub->listen(\&listener, inherit => 1);
    });
}

sub listener {
    my ($hub, $event) = @_;

    return unless $event->causes_fail;

    my $trace = $event->trace;
    my $file = $trace->file;
    my $line = $trace->line;

    my $doc = PPI::Document->new($file);
    my $stmt = $doc->find_first(sub {
        my (undef, $elem) = @_;
        return $elem->isa('PPI::Statement') && $elem->line_number == $line;
    });
    return unless $stmt;

    my $second_arg = (parse_arg_list($stmt->first_token))[1]->[0];
    return unless $second_arg;

    # A -> string(A)
    $second_arg->insert_before(PPI::Token::Word->new('string'));
    $second_arg->insert_before(PPI::Token::Structure->new('('));
    $second_arg->insert_after(PPI::Token::Structure->new(')'));

    $doc->save($file);
}

1;

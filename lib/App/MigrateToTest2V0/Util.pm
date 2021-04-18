package App::MigrateToTest2V0::Util;
use strict;
use warnings;

# func(0, 1, ...);
# func 0, 1, ...;
sub get_argument_of_stmt {
    my ($stmt, $nth) = @_;

    # func(...);
    my $maybe_paren = $stmt->schild(1);
    return undef unless $maybe_paren;

    if ($maybe_paren->isa('PPI::Structure::List')) {
        return get_element_of_list($maybe_paren, $nth);
    }

    # $maybe_paren is not a paren, 0th argument
    # func ...;
    my $elem = $maybe_paren;
    while ($nth > 0) {
        until ($elem->content eq ',' || $elem->content eq ';') {
            $elem = $elem->snext_sibling;
        }
        $elem = $elem->snext_sibling; # argument
        return undef unless $elem;

        $nth--;
    }
    return $elem;
}

sub get_element_of_list {
    my ($list, $nth) = @_;

    my $elem = $list->schild(0)->first_token;
    while ($nth > 0) {
        until ($elem->content eq ',' || $elem->content eq ')') {
            $elem = $elem->snext_sibling;
        }
        $elem = $elem->snext_sibling; # element
        return undef unless $elem;

        $nth--;
    }
    return $elem;
}

1;

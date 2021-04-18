package App::MigrateToTest2V0::Util;
use strict;
use warnings;

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

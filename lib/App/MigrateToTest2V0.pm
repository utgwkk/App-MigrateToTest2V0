package App::MigrateToTest2V0;
use 5.008001;
use strict;
use warnings;

our $VERSION = "0.02";

our @rules = qw(
    App::MigrateToTest2V0::Rule::ReplaceUseTestMoreToUseTest2V0
    App::MigrateToTest2V0::Rule::ReplaceIsDeeplyToIs
    App::MigrateToTest2V0::Rule::ReplaceIsaOkHASHOrArrayToRefOk
    App::MigrateToTest2V0::Rule::Translate2ndArgumentOfIsaOkWithArrayRef
    App::MigrateToTest2V0::Rule::AvoidNameConflictWithTestDeep
);

sub apply {
    my ($class, $doc) = @_;

    for my $rule_class (@rules) {
        eval "require $rule_class";
        $rule_class->apply($doc);
    }

    return $doc;
}

1;
__END__

=encoding utf-8

=head1 NAME

App::MigrateToTest2V0 - Backend of migrate-to-test2-v0

=head1 SYNOPSIS

    use App::MigrateToTest2V0;
    use PPI;
    
    my $doc = PPI::Document->new('foo.t');
    App::MigrateToTest2V0->process($doc);
    $doc->save($doc->filename);

=head1 DESCRIPTION

App::MigrateToTest2V0 is a backend module of L<migrate-to-test2-v0>.

=head1 LICENSE

Copyright (C) utgwkk.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

utgwkk E<lt>utagawakiki@gmail.comE<gt>

=cut


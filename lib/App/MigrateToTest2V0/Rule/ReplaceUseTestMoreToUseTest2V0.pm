package App::MigrateToTest2V0::Rule::ReplaceUseTestMoreToUseTest2V0;
use strict;
use warnings;
use parent 'App::MigrateToTest2V0::Rule';

sub apply {
    my ($class, $doc) = @_;

    my $uses = $doc->find(sub {
        my (undef, $elem) = @_;
        return $elem->isa('PPI::Statement::Include') && $elem->module eq 'Test::More';
    });
    return unless $uses;

    for my $use (@$uses) {
        my $module_name_token = $use->schild(1);
        $module_name_token->set_content('Test2::V0');
    }
}

1;

use strict;
use warnings;
use Test::More;

use App::MigrateToTest2V0;
use File::Temp ();
use FindBin;
use PPI;

# prepare test script
my $fh = File::Temp->new;
my $test_content = do {
    open my $test_fh, "$FindBin::Bin/../share/stringify.t" or BAIL_OUT $!;
    local $/;
    my $content = <$test_fh>;
    close $test_fh;
    $content;
};
$fh->print($test_content);

# migrate to Test2::V0
system("$FindBin::Bin/../script/migrate-to-test2-v0", $fh->filename);

{
    local $ENV{PERL5OPT} = '-MTest2::Plugin::Wrap2ndArgumentOfFailedCompareTestWithString';
    isnt system('prove', $fh->filename), 0;
}
is system('prove', $fh->filename), 0;

done_testing;

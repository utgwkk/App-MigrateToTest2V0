use strict;
use warnings;
use File::Temp;
use FindBin;
use Test::More;

# prepare test script
my $fh = File::Temp->new;
my $test_content = do {
    open my $test_fh, "$FindBin::Bin/../share/test.t" or BAIL_OUT $!;
    local $/;
    my $content = <$test_fh>;
    close $test_fh;
    $content;
};
$fh->print($test_content);

is system("$FindBin::Bin/../script/migrate-to-test2-v0", $fh->filename), 0;

done_testing;

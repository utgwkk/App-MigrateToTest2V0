use strict;
use warnings;
use FindBin;
use Test::More;

is system("$FindBin::Bin/../script/migrate-to-test2-v0", "$FindBin::Bin/../share/test.t"), 0;

done_testing;

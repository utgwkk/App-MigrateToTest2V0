requires 'perl', '5.008001';
requires 'Carp';
requires 'PPI';
requires 'Test::Deep';

on 'test' => sub {
    requires 'Test::More', '0.98';
};


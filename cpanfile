requires 'perl', '5.008001';
requires 'Carp';
requires 'PPI';
requires 'Test::Deep';
requires 'Test2::API';
requires 'List::Util';

on 'test' => sub {
    requires 'Test::More', '0.98';
};


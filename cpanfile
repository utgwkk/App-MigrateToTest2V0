requires 'perl', '5.008001';
requires 'Carp';
requires 'List::Util';
requires 'PPI';
requires 'PPIx::Utils';
requires 'Test::Deep';
requires 'Test2::API';

on 'test' => sub {
    requires 'Test::More', '0.98';
};


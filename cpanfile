requires 'perl', '5.008001';
requires 'Carp';
requires 'PPI';
requires 'PPIx::Utils';
requires 'Test::Deep';
requires 'Test2::API';
requires 'List::Util';

on 'test' => sub {
    requires 'FindBin';
    requires 'Test::More', '0.98';
    requires 'Test::Base::Less';
};


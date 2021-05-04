requires 'perl', '5.008001';
requires 'parent';
requires 'Carp';
requires 'File::Temp';
requires 'List::Util';
requires 'PPI';
requires 'PPIx::Utils';
requires 'Test::Deep';
requires 'Test2::API';

on 'test' => sub {
    requires 'App::Prove';
    requires 'FindBin';
    requires 'Test::Base::Less';
    requires 'Test::More', '0.98';
    requires 'Test2::V0';
};


requires 'perl', '5.008001';
requires 'JSON';
requires 'HTTP::Request';
requires 'HTTP::Headers';
requires 'LWP::UserAgent';
requires 'LWP::Protocol::https';
requires 'URI';
requires 'Try::Tiny';
requires 'Carp';
requires 'Data::Dumper';

on 'test' => sub {
    requires 'Test::More', '0.98';
};


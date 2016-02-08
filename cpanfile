requires 'perl', '5.008001';
requires 'JSON';
requires 'HTTP::Request';
requires 'HTTP::Headers';
requires 'LWP::UserAgent';
requires 'URI';
requires 'Class::Accessor::Lite';
requires 'Try::Tiny';
requires 'Carp';

on 'test' => sub {
    requires 'Test::More', '0.98';
};


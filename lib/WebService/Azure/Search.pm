package WebService::Azure::Search;
use 5.008001;
use strict;
use warnings;

use Class::Accessor::Lite (
  new => 1,
  rw => [qw/_init update delete/]
  ro => [qw/select/]
);

use JSON:
use HTTP::Request;
use HTTP::Headers;
use URI;

our $VERSION = "0.01";

sub new {
  my ($class, %opts) = @_;
  my $self = bless {%opts}, $class;
  $self->_init($self);
}

sub _init {
}

sub _query {}

sub select {}

sub update {}

sub delete {}

1;
__END__

=encoding utf-8

=head1 NAME

WebService::Azure::Search - It's new $module

=head1 SYNOPSIS

    use WebService::Azure::Search;

=head1 DESCRIPTION

WebService::Azure::Search is ...

=head1 LICENSE

Copyright (C) sys_cat.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

sys_cat E<lt>systemcat91@gmail.comE<gt>

=cut


package WebService::Azure::Search;
use 5.008001;
use strict;
use warnings;

use Class::Accessor::Lite (
  new => 0,
  rw => [qw/_init query/]
);

use JSON:
use HTTP::Request;
use HTTP::Headers;
use URI;
use Try::Tiny;
use Carp;

our $VERSION = "0.01";

sub new {
  my ($class, %opts) = @_;
  my $self = bless {%opts}, $class;
  $self->_init($self);
}

sub _init {
  my ($self) = @_;
  $self->{setting}{base} = undef;
  if ($self->{service}) {
    $self->{setting}{base} = sprintf("https://%s.search.windows.net/", $self->{service});
  }

  $self->{setting}{index} = undef;
  if ($self->{index}) {
    $self->{setting}{index} = $self->{index};
  }

  $self->{setting}{api} = undef;
  if ($self->{api}) {
    $self->{setting}{api} = $self->{api};
  }

  $self->{setting}{admin} = undef;
  if ($self->{admin}) {
    $self->{setting}{admin} = $self->{admin};
  }

  try {
    $self->{params}{url} = sprintf(
      "%s/indexes/%s/docs/index?api-version=%s",
      $self->{setting}{base},
      $self->{setting}{index},
      $self->{setting}{api}
    );
  } catch {
    carp "can't create request url.detail : $_";
  };
}
# select, insert, update, delete　のメソッドはパラメーターを作るだけ
# 最終的なリクエストは run に任せる
# run はHTTPリクエストして返すだけ
sub query {
}

1;
__END__

=encoding utf-8

=head1 NAME

WebService::Azure::Search - It's new $module

=head1 SYNOPSIS

    use WebService::Azure::Search;
    my $azure = WebServise::Azure::Search->new({});

=head1 DESCRIPTION

WebService::Azure::Search is ...

=head1 LICENSE

Copyright (C) sys_cat.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

sys_cat E<lt>systemcat91@gmail.comE<gt>

=cut


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
our $SELECT = "select";
our $INPUT = "input";
our $UPDATE = "update";
our $DELETE = "delete";

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

  $self->{params}{accept} = "application/json";

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
sub select {
  my ($self, %params) = @_;
  my $params = bless {%params};

  $self->{params}{url} = undef;
  try {
    # Create URL for SELECT
    $self->{params}{url} = sprintf(
      "%s/indexes/%s/docs/search?api-version=%s",
      $self->{setting}{base},
      $self->{setting}{index},
      $self->{setting}{api}
    );
  } catch {
    carp "cant't create request url for SELECT. detail : $_";
  }

  # Set value
  $self->{params}{query}{search} = undef;
  if ($params->{search}) {
    $self->{params}{query}{search} = $params->{search};
  }
  $self->{params}{query}{searchMode} = "any"; # default is 'any'
  if ($params->{searchMode}) {
    $self->{params}{query}{searchMode} = $params->{searchMode};
  }
  $self->{params}{query}{searchFields} = undef;
  if ($params->{searchFields}) {
    $self->{params}{query}{searchFields} = join($params->{searchFields}, ",");
  }
  $self->{params}{query}{count} = "false";
  if ($params->{count}) {
    $self->{params}{query}{count} = $params->{count};
  }
  $self->{params}{query}{api} = $self->{setting}{api};
}

sub insert {
  my ($self, @params) = @_;
  $self->{params}{query}{value} = @params;
  $self->{params}{query}{api} = $self->{setting}{api};
}

sub update {
  my ($self, @params) = @_;
  $self->{params}{query}{value} = @params;
  $self->{params}{query}{api} = $self->{setting}{api};
}

sub delete {
  my ($self, @params) = @_;
  $self->{params}{query}{value} = @params;
  $self->{params}{query}{api} = $self->{setting}{api};
}

# 最終的なリクエストは run に任せる
# run はHTTPリクエストして返すだけ
sub run {
  my ($self) = @_;
  my $uri = URI->new($self->{params}{url});
  $uri->query_form($self->{params}{query});
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


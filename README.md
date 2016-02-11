# NAME

WebService::Azure::Search - It's new $module

# SYNOPSIS

    use WebService::Azure::Search;
    # new Azure::Search
    my $azure = WebServise::Azure::Search->new(
      service => 'SERVICENAME',
      index   => 'INDEXNAME',
      api     => 'APIKEY',
      admin   => 'ADMINKEY',
    );
    # Select AzureSearch
    my $select = $azure->select(
      search        => 'SEARCHSTRING',
      searchMode    => 'any',
      searchFields  => 'FIELDNAME',
      count         => 'BOOL',
    );
    $select->run; # run Select Statement. return to hash reference.
    # Insert or Update or Delete
    my $insert = $azure->insert(@values);
    $insert->run;

# DESCRIPTION

WebService::Azure::Search is perform DML against AzureSearch.

# LICENSE

Copyright (C) sys\_cat.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

sys\_cat &lt;systemcat91@gmail.com>

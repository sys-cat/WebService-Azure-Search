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
    # Select AzureSearch.Support 'search', 'searchMode', 'searchFields', 'count' contexts.
    my $select = $azure->select(
      search        => 'SEARCHSTRING',
      searchMode    => 'any',
      searchFields  => 'FIELDNAME',
      count         => 'BOOL',
    );
    $select->run; # run Select Statement. return to hash reference.
    # Run Insert request
    my $insert = $azure->insert(@values); # '@search.action' statement is 'upload'.
    my $insert_result = $insert->run; # return hash reference.
    # Run Update request
    my $update = $azure->update(@values); # '@search.action' statement is 'merge'.
    my $update_result = $update->run; # return hash reference.
    # Run Delete request
    my $delete = $azure->delete(@values); # '@search.action' statement is 'delete'.
    my $delete_result = $delete->run; # return hash reference.

# DESCRIPTION

WebService::Azure::Search is perform DML against AzureSearch.

# LICENSE

Copyright (C) sys\_cat.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

sys\_cat &lt;systemcat91@gmail.com>

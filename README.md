# NAME

WebService::Azure::Search - It's new $module    
\[!\[Coverage Status\](https://coveralls.io/repos/github/sys-cat/WebService-Azure-Search/badge.svg?branch=master)\](https://coveralls.io/github/sys-cat/WebService-Azure-Search?branch=master)

# SYNOPSIS

    use WebService::Azure::Search;
    # new Azure::Search
    my $a_select = WebServise::Azure::Search->new(
      service => 'SERVICENAME',
      index   => 'INDEXNAME',
      api     => 'APIKEY',
      admin   => 'ADMINKEY',
    );
    # Select AzureSearch.Support 'search', 'searchMode', 'searchFields', 'count' contexts.
    my $select = $a_select->select(
      search        => 'SEARCHSTRING',
      searchMode    => 'any',
      searchFields  => 'FIELDNAME',
      count         => 'BOOL',
    );
    $select->run; # run Select Statement. return to hash reference.
    # Run Insert request
    my $a_insert = WebService::Azure::Search->new(.....);
    my $insert = $a_insert->insert(@values); # '@search.action' statement is 'upload'.
    my $insert_result = $insert->run; # return hash reference.
    # Run Update request
    my $a_update = WebService::Azure::Search->new(.....);
    my $update = $a_update->update(@values); # '@search.action' statement is 'merge'.
    my $update_result = $update->run; # return hash reference.
    # Run Delete request
    my $a_delete = WebService::Azure::Search->new(.....);
    my $delete = $a_delete->delete(@values); # '@search.action' statement is 'delete'.
    my $delete_result = $delete->run; # return hash reference.

# DESCRIPTION

WebService::Azure::Search is perform DML against AzureSearch.

# LICENSE

Copyright (C) sys\_cat.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

sys\_cat &lt;systemcat91@gmail.com>

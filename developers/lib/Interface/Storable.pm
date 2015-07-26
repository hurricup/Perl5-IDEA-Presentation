package Interface::Storable;
use strict;
use warnings FATAL => 'all';

# interface represents possibility to store/retrive entry from and to database

# below are methods declarations, which should be implemented in subclasses
# these methods would be use for implement method popup (NYI)

#@method we need to annotate this, because no other way to distinct method from static sub
sub db_store;      # stores entity to database
#@method
sub db_fetch;      # fetches entity form database

1;
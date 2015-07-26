package Interface::Serializable;
use strict;
use warnings FATAL => 'all';

# interface provides serialization method for JSON::XS

sub TO_JSON
{
    my ($self) = @_;
    return {%$self};
}


1;
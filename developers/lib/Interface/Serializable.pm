package Interface::Serializable;
use strict;
use warnings FATAL => 'all';
use Exporter;

# interface provides serialization method for JSON::XS

our @EXPORT = qw/TO_JSON/;

sub TO_JSON
{
    my ($self) = @_;
    return {%$self};
}


1;
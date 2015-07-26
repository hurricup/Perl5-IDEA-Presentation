package Models::Position;
use parent qw/Interface::Serializable Interface::Storable/;
use strict;
use warnings FATAL => 'all';

# represents abstract job position
sub new
{
    my ($proto, $position_name, %kwargs) = @_;
    return bless {
        name => $position_name,
        id => $kwargs{id}
    }, $proto;
}

sub get_name
{
    my ($self) = @_;
    return $self->{name};
}

sub get_id
{
    my ($self) = @_;
    return $self->{id};
}

#@override  # this annotation marks that sub is overriding something from the parent class, will help IDEA to keep your code consistent (NYI)
#@method
sub db_store    # method overrides one from Interface::Storable
{
    ...; # database writing should be here
}

#@override
#@method
sub db_fetch    # method overrides one from Interface::Storable
{
    ...; # database reading should be here
}


1;
package Models::Base;
use parent qw/Interface::Serializable Interface::Storable/;
use strict;
use warnings FATAL => 'all';

# base model. Every entity has id and name
# every entity may be JSONed and stored into db

sub get_id
{
    my ($self) = @_;
    return $self->{id};
}

sub set_id
{
    my ($self, $new_id)  = @_;
    $self->{id} = $new_id;
    return $self;
}

sub get_name
{
    my ($self) = @_;
    return $self->{name};
}

sub set_name
{
    my ($self, $new_name) = @_;
    $self->{name} = $new_name;
    return $self;
}

1;
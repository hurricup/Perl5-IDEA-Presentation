package Models::Employee;
use strict;
use warnings FATAL => 'all';
use parent qw/Models::Base/;

use Exception;                  # you can navigate to imported modules by ctrl+click

# class represents abstract employee

sub new
{
    my ($proto, $name, %kwargs) = @_;
    return {
        id => $kwargs{id},
        name => $name,
        position => $kwargs{position}
    }, $proto;
}

#@returns Models::Position      # return value annotation used to resolve methods and autocompletion
sub get_position
{
    my ($self) = @_;
    return $self->{position};
}

#@returns Models::Employee
sub set_position
{
    my ($self, $new_position, $unused_field) = @_;  # unused field is annotated as unused

    # mesage highlighting and search coming with IDEA
    # fixme should be wrapped into kind of assert condition [, message]
    die Exception->new("Position must be an instance of Models::Position class")
        if not UNIVERSAL::isa($new_position, 'Models::Position');   # string content works can be ctrl-clicked

    $self->{position} = $new_position;

    return $self;
}

#@deprecated    deprectaed annotation strikes out deprected methods in all the project
sub some_deprecated_method
{
    my ($self) = @_;
    ...;        # Ellipsis statement is the same as to-do or fix-me
}

sub get_salary
{
    my ($self) = @_;
    return $self->{salary};
}

#@returns Models::Employee
sub set_salary
{
    my ($self, $new_salary) = @_;
    $self->{salary} = $new_salary;
    return $self;
}

#@override  # this annotation marks that sub is overriding something from the parent class, will help IDEA to keep your code consistent (NYI)
#@method
sub db_store    # method overrides one from Interface::Storable
{
    ...; # database writing should be here
}

#@override
#@method
#@returns Models::Employee
sub db_fetch    # method overrides one from Interface::Storable
{
    my ($proto, $id) = @_;
    ...; # database reading should be here
}

1;
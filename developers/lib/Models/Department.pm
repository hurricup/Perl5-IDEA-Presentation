package Models::Department;
use parent qw/Interface::Serializable Interface::Storable/;
use strict;
use warnings FATAL => 'all';

# represents company department
sub new
{
    my ($proto, $department_name, %kwargs) = @_;
    return bless {
        name => $department_name,
        employees => [],
        head => undef,
        id => $kwargs{id}
    }, $proto;
}

sub get_id
{
    my ($self) = @_;
    return $self->{id};
}

sub set_id
{
    my ($self, $new_id) = @_;
    $self->{id} = $new_id;
    return $self;
}

#@returns Models::Employee  # return value type
sub get_head
{
    my ($self) = @_;
    return $self->{head};
}

sub set_head
{
    my ($self, $employee) = @_;

    $self->add_employee($employee)
        if not $self->contains_employee($employee);

    $self->{head} = $employee;
    return $self;
}

# here should be NYI annotation like: #@returns [Models::Employee]
sub get_employees_list
{
    my ($self) = @_;
    return $self->{employees};
}

sub contains_employee
{
    my $self = shift;
    my Models::Employee $employee_in_question = shift;  # explicit type allows IDEA to know what object is in

    foreach my Models::Employee $employee (@{$self->get_employees_list}) # NYI: heuristic should understand what is employee if getter been annotated as #@returns [Models::Employee]
    {
        return 1 if $employee->get_id == $employee_in_question->get_id;
    }

    return 0;
}

sub add_employee
{
    my ($self, $employee) = @_;

    push @{$self->get_employees_list}, $employee
        if not $self->contains_employee($employee);

    return $self;
}

sub remove_employee
{
    my $self = shift;
    my Models::Employee $employee_to_remove = shift;

    my $index = 0;
    foreach my Models::Employee $employee (@{$self->get_employees_list})
    {
        if( $employee->get_id == $employee_to_remove->get_id )
        {
            splice @{$self->get_employees_list}, $index, 1;
            return;
        }
        $index++;
    }
    return;
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
package Exception;
use strict;
use warnings FATAL => 'all';
use Carp qw/longmess/;

# default exception class

sub new
{
    my ($proto, $message) = @_;
    return bless {
        message => $message,
        trace => longmess       # imports resolution is not yet implemented
    }
}

sub get_message
{
    my ($self) = @_;
    return $self->{message};
}

sub get_trace
{
    my ($self) = @_;
    return $self->{trace};
}

sub as_string
{
    my ($self) = @_;
    return sprintf <<'TEXT', $self->get_message, $self->get_trace;
Error message: %s
  Stack trace: %s
TEXT
}

1;
package Models::Position::Developer::Perl5;
use parent qw/Models::Position::Developer/;
use strict;
use warnings FATAL => 'all';

sub get_language
{
    my $self = shift;   # unused variable is annotated
    return 'Perl5';
}
1;
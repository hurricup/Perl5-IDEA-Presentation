package Controllers::Example;
use strict;
use warnings FATAL => 'all';
use v5.10;

use Models::Department;
use Models::Employee;
use Models::Position::Developer::Perl5;

sub dispatch
{
    my ($self, $request) = @_;  # unused methods are annotated

    my Models::Department $department = Models::Department->db_fetch('web_department');
    my Models::Employee $employee = Models::Employee->db_fetch('John Doe');

    say "Department name is: ".$department->get_name;   # method resolved and auto-completed from Models::Base
    say "Department head name is: ".$department->get_head->get_name; # both method resolved and auto-completed from different parent classes
    say sprintf "Department has %s employees", scalar @{$department->get_employees_list};

    $employee->some_deprecated_method();

    my Models::Employee $new_employee = Models::Employee->new("Default Name")->set_name("some other name"); # NYI heuristic should understand that $new_employee is Models::Employee
    $new_employee->set_salary(100_000)->set_position(
        Models::Position::Developer::Perl5->new()
    );

    # multiple languages support in heredoc
    my $just_html = <<'HTML';
<body><html>
Heredoc markers mean something!
</html></body>
HTML

    $department->add_employee($new_employee)->set_head($new_employee);

    # multiple declaration annotations
    say $department->TO_JSON;
}

1;
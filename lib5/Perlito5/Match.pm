# Do not edit this file - Generated by Perlito5 8.0
use v5;
use Perlito5::Perl5::Runtime;
our $MATCH = {};
package main;
use v5;
package Perlito5::Match;
sub Perlito5::Match::new {
    ((my  $class) = shift());
    return ({@_})
};
sub Perlito5::Match::flat {
    ((my  $self) = $_[0]);
    (defined($self->{'capture'}) ? $self->{'capture'} : substr($self->{'str'}, $self->{'from'}, (($self->{'to'} - $self->{'from'}))))
};
1;

1;

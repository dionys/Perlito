# Do not edit this file - Generated by Perlito5 8.0
use v5;
use Perlito5::Perl5::Runtime;
package main;
use v5;
package Perlito5::AST::CompUnit;
sub Perlito5::AST::CompUnit::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::CompUnit::name {
    $_[0]->{'name'}
};
sub Perlito5::AST::CompUnit::body {
    $_[0]->{'body'}
};
package Perlito5::AST::Val::Int;
sub Perlito5::AST::Val::Int::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::Val::Int::int {
    $_[0]->{'int'}
};
package Perlito5::AST::Val::Num;
sub Perlito5::AST::Val::Num::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::Val::Num::num {
    $_[0]->{'num'}
};
package Perlito5::AST::Val::Buf;
sub Perlito5::AST::Val::Buf::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::Val::Buf::buf {
    $_[0]->{'buf'}
};
package Perlito5::AST::Lit::Block;
sub Perlito5::AST::Lit::Block::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::Lit::Block::sig {
    $_[0]->{'sig'}
};
sub Perlito5::AST::Lit::Block::stmts {
    $_[0]->{'stmts'}
};
package Perlito5::AST::Index;
sub Perlito5::AST::Index::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::Index::obj {
    $_[0]->{'obj'}
};
sub Perlito5::AST::Index::index_exp {
    $_[0]->{'index_exp'}
};
package Perlito5::AST::Lookup;
sub Perlito5::AST::Lookup::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::Lookup::obj {
    $_[0]->{'obj'}
};
sub Perlito5::AST::Lookup::index_exp {
    $_[0]->{'index_exp'}
};
package Perlito5::AST::Var;
sub Perlito5::AST::Var::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::Var::sigil {
    $_[0]->{'sigil'}
};
sub Perlito5::AST::Var::namespace {
    $_[0]->{'namespace'}
};
sub Perlito5::AST::Var::name {
    $_[0]->{'name'}
};
sub Perlito5::AST::Var::plain_name {
    ((my  $self) = shift());
    if ($self->namespace()) {
        return (($self->namespace() . '::' . $self->name()))
    };
    return ($self->name())
};
package Perlito5::AST::Proto;
sub Perlito5::AST::Proto::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::Proto::name {
    $_[0]->{'name'}
};
package Perlito5::AST::Call;
sub Perlito5::AST::Call::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::Call::invocant {
    $_[0]->{'invocant'}
};
sub Perlito5::AST::Call::method {
    $_[0]->{'method'}
};
sub Perlito5::AST::Call::arguments {
    $_[0]->{'arguments'}
};
package Perlito5::AST::Apply;
sub Perlito5::AST::Apply::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::Apply::code {
    $_[0]->{'code'}
};
sub Perlito5::AST::Apply::arguments {
    $_[0]->{'arguments'}
};
sub Perlito5::AST::Apply::namespace {
    $_[0]->{'namespace'}
};
package Perlito5::AST::If;
sub Perlito5::AST::If::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::If::cond {
    $_[0]->{'cond'}
};
sub Perlito5::AST::If::body {
    $_[0]->{'body'}
};
sub Perlito5::AST::If::otherwise {
    $_[0]->{'otherwise'}
};
package Perlito5::AST::While;
sub Perlito5::AST::While::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::While::init {
    $_[0]->{'init'}
};
sub Perlito5::AST::While::cond {
    $_[0]->{'cond'}
};
sub Perlito5::AST::While::continue {
    $_[0]->{'continue'}
};
sub Perlito5::AST::While::body {
    $_[0]->{'body'}
};
package Perlito5::AST::For;
sub Perlito5::AST::For::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::For::cond {
    $_[0]->{'cond'}
};
sub Perlito5::AST::For::body {
    $_[0]->{'body'}
};
package Perlito5::AST::Decl;
sub Perlito5::AST::Decl::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::Decl::decl {
    $_[0]->{'decl'}
};
sub Perlito5::AST::Decl::type {
    $_[0]->{'type'}
};
sub Perlito5::AST::Decl::var {
    $_[0]->{'var'}
};
package Perlito5::AST::Sig;
sub Perlito5::AST::Sig::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::Sig::positional {
    $_[0]->{'positional'}
};
package Perlito5::AST::Sub;
sub Perlito5::AST::Sub::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::Sub::name {
    $_[0]->{'name'}
};
sub Perlito5::AST::Sub::sig {
    $_[0]->{'sig'}
};
sub Perlito5::AST::Sub::block {
    $_[0]->{'block'}
};
package Perlito5::AST::Do;
sub Perlito5::AST::Do::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::Do::block {
    $_[0]->{'block'}
};
package Perlito5::AST::Use;
sub Perlito5::AST::Use::new {
    ((my  $class) = shift());
    bless({@_}, $class)
};
sub Perlito5::AST::Use::mod {
    $_[0]->{'mod'}
};
sub Perlito5::AST::Use::code {
    $_[0]->{'code'}
};

1;

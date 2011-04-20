# Do not edit this file - Generated by Perlito 6.0
use v5;
use utf8;
use strict;
use warnings;
no warnings ('redefine', 'once', 'void', 'uninitialized', 'misc', 'recursion');
use Perlito::Perl5::Runtime;
use Perlito::Perl5::Prelude;
our $MATCH = Perlito::Match->new();
{
package GLOBAL;
sub new { shift; bless { @_ }, "GLOBAL" }

# use v6 
;
{
package Python;
sub new { shift; bless { @_ }, "Python" }
sub tab { my $level = $_[0]; ((my  $s = undef) = ''); ((my  $count = undef) = $level); for ( ; Main::bool(($count > 0));  ) { ($s = $s . '    '); ($count = ($count - 1)) }; return scalar ($s) }
}

;
{
package Perlito::Python::AnonSub;
sub new { shift; bless { @_ }, "Perlito::Python::AnonSub" }
sub name { $_[0]->{name} };
sub sig { $_[0]->{sig} };
sub block { $_[0]->{block} };
sub handles_return_exception { $_[0]->{handles_return_exception} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; ((my  $sig = undef) = $self->{sig}); ((my  $pos = undef) = $sig->positional()); ((my  $args = undef) = do { (my  $List_a = []); (my  $List_v = []); $List_a }); for my $field ( @{($pos || []) || []} ) { push( @{$args}, $field->emit_python_name() ) }; ((my  $block = undef) = Perlito::Python::LexicalBlock->new(('block' => $self->{block}), ('needs_return' => 1))); (my  $List_s = []); push( @{$List_s}, Python::tab($level) . 'def f_' . $self->{name} . '(' . Main::join($args, ', ') . '):' ); if (Main::bool($self->{handles_return_exception})) { push( @{$List_s}, Python::tab(($level + 1)) . 'try:' ); push( @{$List_s}, $block->emit_python_indented(($level + 2)) ); push( @{$List_s}, Python::tab(($level + 1)) . 'except mp6_Return, r:' ); push( @{$List_s}, Python::tab(($level + 2)) . 'return r.value' ) } else { push( @{$List_s}, $block->emit_python_indented(($level + 1)) ) }; return scalar (Main::join($List_s, '
')) }
}

;
{
package Perlito::Python::LexicalBlock;
sub new { shift; bless { @_ }, "Perlito::Python::LexicalBlock" }
sub block { $_[0]->{block} };
sub needs_return { $_[0]->{needs_return} };
sub top_level { $_[0]->{top_level} };
(my  $ident = undef);
(my  $List_anon_block = []);
sub push_stmt_python { my $block = $_[0]; push( @{$List_anon_block}, $block ) };
sub get_ident_python { ($ident = ($ident + 1)); return scalar ($ident) };
sub has_my_decl { my $self = $_[0]; for my $decl ( @{$self->{block} || []} ) { if (Main::bool((Main::isa($decl, 'Decl') && (($decl->decl() eq 'my'))))) { return scalar (1) } ; if (Main::bool((((Main::isa($decl, 'Apply') && ($decl->code() eq 'infix:<=>')) && Main::isa($decl->arguments()->[0], 'Decl')) && ($decl->arguments()->[0]->decl() eq 'my')))) { return scalar (1) }  }; return scalar (0) };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; (my  $List_block = []); for ( @{$self->{block} || []} ) { if (Main::bool(defined($_))) { push( @{$List_block}, $_ ) }  }; if (Main::bool(!Main::bool(($List_block)))) { push( @{$List_block}, Apply->new(('code' => 'Mu')) ) } ; (my  $List_s = []); (my  $List_tmp = []); for my $stmt ( @{$List_anon_block || []} ) { push( @{$List_tmp}, $stmt ) }; ((my  $has_decl = undef) = do { (my  $List_a = []); (my  $List_v = []); $List_a }); ((my  $block = undef) = do { (my  $List_a = []); (my  $List_v = []); $List_a }); for my $decl ( @{$List_block || []} ) { if (Main::bool((Main::isa($decl, 'Decl') && (($decl->decl() eq 'has'))))) { push( @{$has_decl}, $decl ) } else { if (Main::bool((((Main::isa($decl, 'Apply') && ($decl->code() eq 'infix:<=>')) && Main::isa($decl->arguments()->[0], 'Decl')) && ($decl->arguments()->[0]->decl() eq 'has')))) { push( @{$has_decl}, $decl ) } else { push( @{(($block) || [])}, $decl ) } } }; if (Main::bool((($has_decl) || []))) { for my $decl ( @{(($has_decl) || []) || []} ) { if (Main::bool((Main::isa($decl, 'Decl') && (($decl->decl() eq 'has'))))) { ((my  $label = undef) = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); push( @{$List_s}, Python::tab($level) . 'def f_' . $label . '(v_self):' ); push( @{$List_s}, Python::tab(($level + 1)) . 'return v_self.v_' . ($decl->var())->name() ); push( @{$List_s}, Python::tab($level) . 'self.__dict__.update(' . '{' . '\'f_' . $decl->var()->name() . '\':f_' . $label . '})' ) } ; if (Main::bool((((Main::isa($decl, 'Apply') && ($decl->code() eq 'infix:<=>')) && Main::isa($decl->arguments()->[0], 'Decl')) && ($decl->arguments()->[0]->decl() eq 'has')))) { ((my  $label = undef) = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); push( @{$List_s}, Python::tab($level) . 'def f_' . $label . '(v_self):' ); push( @{$List_s}, Python::tab(($level + 1)) . 'return v_self.v_' . $decl->arguments()->[0]->var()->name() ); push( @{$List_s}, Python::tab($level) . 'self.__dict__.update(' . '{' . '\'f_' . $decl->arguments()->[0]->var()->name() . '\':f_' . $label . '})' ) }  } } ; for my $decl ( @{(($block) || []) || []} ) { if (Main::bool((Main::isa($decl, 'Decl') && (($decl->decl() eq 'my'))))) { push( @{$List_s}, Python::tab($level) . ($decl->var())->emit_python_name() . ' = ' . $decl->emit_python_init() . '' ) } else { if (Main::bool((((Main::isa($decl, 'Apply') && ($decl->code() eq 'infix:<=>')) && Main::isa($decl->arguments()->[0], 'Decl')) && ($decl->arguments()->[0]->decl() eq 'my')))) { push( @{$List_s}, Python::tab($level) . $decl->arguments()->[0]->var()->emit_python_name() . ' = ' . $decl->arguments()->[0]->emit_python_init() . '' ) }  } }; (my  $last_statement = undef); if (Main::bool($self->{needs_return})) { ($last_statement = pop( @{(($block) || [])} )) } ; for my $stmt ( @{(($block) || []) || []} ) { ($List_anon_block = do { (my  $List_a = []); (my  $List_v = []); $List_a }); ((my  $s2 = undef) = $stmt->emit_python_indented($level)); for my $stmt ( @{$List_anon_block || []} ) { push( @{$List_s}, $stmt->emit_python_indented($level) ) }; push( @{$List_s}, $s2 ) }; if (Main::bool(($self->{needs_return} && $last_statement))) { ($List_anon_block = do { (my  $List_a = []); (my  $List_v = []); $List_a }); (my  $s2 = undef); if (Main::bool(Main::isa($last_statement, 'If'))) { ((my  $cond = undef) = $last_statement->cond()); ((my  $has_otherwise = undef) = (Main::bool($last_statement->otherwise()) ? 1 : 0)); ($s2 = Python::tab($level) . 'if mp6_to_bool(' . $cond->emit_python() . '):' . '
'); ((my  $body_block = undef) = Perlito::Python::LexicalBlock->new(('block' => ($last_statement->body()->stmts())), ('needs_return' => 1))); if (Main::bool($body_block->has_my_decl())) { ($body_block = Do->new(('block' => ($last_statement->body())))); ($s2 = $s2 . Python::tab(($level + 1)) . 'return ' . $body_block->emit_python()) } else { ($s2 = $s2 . $body_block->emit_python_indented(($level + 1))) }; if (Main::bool(($has_otherwise))) { ($s2 = $s2 . '
' . Python::tab($level) . 'else:' . '
'); ((my  $otherwise_block = undef) = Perlito::Python::LexicalBlock->new(('block' => ($last_statement->otherwise()->stmts())), ('needs_return' => 1))); if (Main::bool($otherwise_block->has_my_decl())) { ($otherwise_block = Do->new(('block' => ($last_statement->otherwise())))); ($s2 = $s2 . Python::tab(($level + 1)) . 'return ' . $otherwise_block->emit_python()) } else { ($s2 = $s2 . $otherwise_block->emit_python_indented(($level + 1))) } }  } else { if (Main::bool((Main::isa($last_statement, 'Apply') && ($last_statement->code() eq 'infix:<=>')))) { ($s2 = $last_statement->emit_python_indented($level)); ($s2 = $s2 . '
' . Python::tab($level) . 'return ' . $last_statement->arguments()->[0]->emit_python()) } else { if (Main::bool(((Main::isa($last_statement, 'Apply') && ($last_statement->code() eq 'return')) || Main::isa($last_statement, 'For')))) { ($s2 = $last_statement->emit_python_indented($level)) } else { ($s2 = Python::tab($level) . 'return ' . $last_statement->emit_python()) } } }; for my $stmt ( @{$List_anon_block || []} ) { push( @{$List_s}, $stmt->emit_python_indented($level) ) }; push( @{$List_s}, $s2 ) } ; ($List_anon_block = $List_tmp); return scalar (Main::join($List_s, '
')) }
}

;
{
package CompUnit;
sub new { shift; bless { @_ }, "CompUnit" }
sub name { $_[0]->{name} };
sub attributes { $_[0]->{attributes} };
sub methods { $_[0]->{methods} };
sub body { $_[0]->{body} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; (my  $List_s = []); ((my  $block = undef) = Perlito::Python::LexicalBlock->new(('block' => $self->{body}))); ((my  $label = undef) = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); ((my  $name = undef) = Main::to_go_namespace($self->{name})); for my $decl ( @{$self->{body} || []} ) { if (Main::bool(Main::isa($decl, 'Use'))) { if (Main::bool(($decl->mod() ne 'v6'))) { push( @{$List_s}, Python::tab($level) . 'import ' . Main::to_go_namespace($decl->mod()) ) }  }  }; push( @{$List_s}, Python::tab($level) . 'try:' ); push( @{$List_s}, Python::tab(($level + 1)) . 'type(' . $name . ')' ); push( @{$List_s}, Python::tab($level) . 'except NameError:' ); push( @{$List_s}, Python::tab(($level + 1)) . 'class ' . $name . ':' ); push( @{$List_s}, Python::tab(($level + 2)) . 'def __init__(self, **arg):' ); push( @{$List_s}, Python::tab(($level + 3)) . 'for k in arg:' ); push( @{$List_s}, Python::tab(($level + 4)) . 'self.__dict__[k] = mp6_Scalar()' ); push( @{$List_s}, Python::tab(($level + 4)) . 'self.__dict__[k].f_set(arg[k])' ); push( @{$List_s}, Python::tab(($level + 2)) . 'def f__setattr__(self, k, v):' ); push( @{$List_s}, Python::tab(($level + 3)) . 'return self.__dict__[k].f_set(v)' ); push( @{$List_s}, Python::tab(($level + 2)) . 'def f_isa(self, name):' ); push( @{$List_s}, Python::tab(($level + 3)) . 'return name == \'' . $self->{name} . '\'' ); push( @{$List_s}, Python::tab(($level + 2)) . 'def f_bool(self):' ); push( @{$List_s}, Python::tab(($level + 3)) . 'return 1' ); push( @{$List_s}, Python::tab(($level + 2)) . 'def __getattr__(self, attr):' ); push( @{$List_s}, Python::tab(($level + 3)) . 'if attr[0:2] == \'v_\':' ); push( @{$List_s}, Python::tab(($level + 4)) . 'self.__dict__[attr] = mp6_Scalar()' ); push( @{$List_s}, Python::tab(($level + 4)) . 'return self.__dict__[attr]' ); push( @{$List_s}, Python::tab(($level + 3)) . 'raise AttributeError(attr)' ); push( @{$List_s}, Python::tab(($level + 1)) . $name . '_proto = ' . $name . '()' ); push( @{$List_s}, Python::tab(($level + 1)) . '__builtin__.' . $name . ' = ' . $name . '' ); push( @{$List_s}, Python::tab(($level + 1)) . '__builtin__.' . $name . '_proto = ' . $name . '_proto' ); if (Main::bool(($name eq 'GLOBAL'))) { push( @{$List_s}, Python::tab($level) . 'self = ' . $name ); push( @{$List_s}, $block->emit_python_indented($level) ) } else { push( @{$List_s}, Python::tab($level) . 'def ' . $label . '():' ); push( @{$List_s}, Python::tab(($level + 1)) . 'self = ' . $name ); push( @{$List_s}, $block->emit_python_indented(($level + 1)) ); push( @{$List_s}, Python::tab($level) . $label . '()' ) }; return scalar (Main::join($List_s, '
')) }
}

;
{
package Val::Int;
sub new { shift; bless { @_ }, "Val::Int" }
sub int { $_[0]->{int} };
sub emit_python { my $self = $_[0]; $self->{int} };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . $self->{int} }
}

;
{
package Val::Bit;
sub new { shift; bless { @_ }, "Val::Bit" }
sub bit { $_[0]->{bit} };
sub emit_python { my $self = $_[0]; $self->{bit} };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . $self->{bit} }
}

;
{
package Val::Num;
sub new { shift; bless { @_ }, "Val::Num" }
sub num { $_[0]->{num} };
sub emit_python { my $self = $_[0]; $self->{num} };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . $self->{num} }
}

;
{
package Val::Buf;
sub new { shift; bless { @_ }, "Val::Buf" }
sub buf { $_[0]->{buf} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . '"' . Main::javascript_escape_string($self->{buf}) . '"' }
}

;
{
package Lit::Array;
sub new { shift; bless { @_ }, "Lit::Array" }
sub array1 { $_[0]->{array1} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; ((my  $ast = undef) = $self->expand_interpolation()); return scalar ($ast->emit_python_indented($level)) }
}

;
{
package Lit::Hash;
sub new { shift; bless { @_ }, "Lit::Hash" }
sub hash1 { $_[0]->{hash1} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; ((my  $ast = undef) = $self->expand_interpolation()); return scalar ($ast->emit_python_indented($level)) }
}

;
{
package Index;
sub new { shift; bless { @_ }, "Index" }
sub obj { $_[0]->{obj} };
sub index_exp { $_[0]->{index_exp} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . $self->{obj}->emit_python() . '.f_index(' . $self->{index_exp}->emit_python() . ')' }
}

;
{
package Lookup;
sub new { shift; bless { @_ }, "Lookup" }
sub obj { $_[0]->{obj} };
sub index_exp { $_[0]->{index_exp} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . $self->{obj}->emit_python() . '.f_lookup(' . $self->{index_exp}->emit_python() . ')' }
}

;
{
package Var;
sub new { shift; bless { @_ }, "Var" }
sub sigil { $_[0]->{sigil} };
sub twigil { $_[0]->{twigil} };
sub name { $_[0]->{name} };
((my  $table = undef) = do { (my  $Hash_a = {}); ($Hash_a->{'$'} = 'v_'); ($Hash_a->{'@'} = 'List_'); ($Hash_a->{'%'} = 'Hash_'); ($Hash_a->{'&'} = 'Code_'); $Hash_a });
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; return scalar (Python::tab($level) . ((Main::bool((($self->{twigil} eq '.'))) ? ('v_self.v_' . $self->{name} . '') : ((Main::bool((($self->{name} eq '/'))) ? ($table->{$self->{sigil}} . 'MATCH') : ($table->{$self->{sigil}} . $self->{name} . '')))))) };
sub emit_python_name { my $self = $_[0]; return scalar (((Main::bool((($self->{twigil} eq '.'))) ? ('v_self.v_' . $self->{name}) : ((Main::bool((($self->{name} eq '/'))) ? ($table->{$self->{sigil}} . 'MATCH') : ($table->{$self->{sigil}} . $self->{name})))))) }
}

;
{
package Proto;
sub new { shift; bless { @_ }, "Proto" }
sub name { $_[0]->{name} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; if (Main::bool(($self->{name} eq 'self'))) { return scalar (Python::tab($level) . 'v_self') } ; Python::tab($level) . Main::to_go_namespace($self->{name}) . '_proto' }
}

;
{
package Call;
sub new { shift; bless { @_ }, "Call" }
sub invocant { $_[0]->{invocant} };
sub hyper { $_[0]->{hyper} };
sub method { $_[0]->{method} };
sub arguments { $_[0]->{arguments} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; ((my  $invocant = undef) = $self->{invocant}->emit_python()); if (Main::bool(($self->{method} eq 'new'))) { (my  $List_str = []); for my $field ( @{$self->{arguments} || []} ) { if (Main::bool((Main::isa($field, 'Apply') && ($field->code() eq 'infix:<=>>')))) { push( @{$List_str}, 'v_' . $field->arguments()->[0]->buf() . '=' . $field->arguments()->[1]->emit_python() ) } else { die('Error in constructor, field: ', Main::perl($field, )) } }; return scalar (Python::tab($level) . '__builtin__.' . Main::to_go_namespace($self->{invocant}->name()) . '(' . Main::join($List_str, ', ') . ')') } ; if (Main::bool(((((($self->{method} eq 'id')) || (($self->{method} eq 'yaml'))) || (($self->{method} eq 'join'))) || (($self->{method} eq 'isa'))))) { if (Main::bool(($self->{hyper}))) { return scalar (Python::tab($level) . 'f_map(' . $invocant . ', lambda x: Main.' . $self->{method} . '(x, ' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ', ') . '))') } else { return scalar (Python::tab($level) . 'mp6_' . $self->{method} . '(' . $invocant . ', ' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ', ') . ')') } } ; ((my  $meth = undef) = $self->{method}); if (Main::bool(($meth eq 'postcircumfix:<( )>'))) { return scalar (Python::tab($level) . $invocant . '(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ', ') . ')') } ; if (Main::bool(((($meth eq 'values')) || (($meth eq 'keys'))))) { return scalar (Python::tab($level) . $invocant . '.' . $meth . '(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ', ') . ')') } ; if (Main::bool(($meth eq 'chars'))) { return scalar (Python::tab($level) . 'len(' . $invocant . ')') } ; ((my  $call = undef) = 'f_' . $meth . '(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ', ') . ')'); if (Main::bool(($self->{hyper}))) { return scalar (Python::tab($level) . 'f_map(' . $invocant . ', lambda x: x.' . $call . ')') } else { return scalar (Python::tab($level) . $invocant . '.' . $call) } }
}

;
{
package Apply;
sub new { shift; bless { @_ }, "Apply" }
sub code { $_[0]->{code} };
sub arguments { $_[0]->{arguments} };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . $self->emit_python() };
sub emit_python { my $self = $_[0]; ((my  $code = undef) = $self->{code}); if (Main::bool(Main::isa(($self->{arguments}->[0]), 'Apply'))) { ((my  $args2 = undef) = $self->{arguments}->[0]->arguments()); if (Main::bool((Main::isa(($args2->[0]), 'Apply') && ((($args2->[0]->code() eq 'infix:<or>') || ($args2->[0]->code() eq 'infix:<||>')))))) { ($args2->[0] = Do->new(('block' => $args2->[0]))) }  } ; if (Main::bool(Main::isa(($self->{arguments}->[0]), 'Apply'))) { ((my  $args2 = undef) = $self->{arguments}->[0]->arguments()); if (Main::bool((Main::isa(($args2->[1]), 'Apply') && ($args2->[1]->code() ne 'infix:<=>>')))) { ($args2->[1] = Do->new(('block' => $args2->[1]))) }  } ; if (Main::bool(Main::isa(($self->{arguments}->[1]), 'Apply'))) { ((my  $args2 = undef) = $self->{arguments}->[1]->arguments()); if (Main::bool((Main::isa(($args2->[1]), 'Apply') && ($args2->[1]->code() ne 'infix:<=>>')))) { ($args2->[1] = Do->new(('block' => $args2->[1]))) }  } ; if (Main::bool(Main::isa($code, 'Str'))) {  } else { return scalar ('(' . $self->{code}->emit_python() . ').(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ', ') . ')') }; if (Main::bool(($code eq 'self'))) { return scalar ('v_self') } ; if (Main::bool(($code eq 'Mu'))) { return scalar ('mp6_Mu()') } ; if (Main::bool(($code eq 'make'))) { return scalar ('v_MATCH.f__setattr__(\'v_capture\', ' . ($self->{arguments}->[0])->emit_python() . ')') } ; if (Main::bool(($code eq 'False'))) { return scalar ('False') } ; if (Main::bool(($code eq 'True'))) { return scalar ('True') } ; if (Main::bool(($code eq 'array'))) { return scalar ('[' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ' ') . ']') } ; if (Main::bool(($code eq 'Int'))) { return scalar ('mp6_to_num(' . ($self->{arguments}->[0])->emit_python(("" . ')'))) } ; if (Main::bool(($code eq 'Num'))) { return scalar ('mp6_to_num(' . ($self->{arguments}->[0])->emit_python(("" . ')'))) } ; if (Main::bool(($code eq 'prefix:<~>'))) { return scalar ('str(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ' ') . ')') } ; if (Main::bool(($code eq 'prefix:<!>'))) { return scalar ('not mp6_to_bool(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ' ') . ')') } ; if (Main::bool(($code eq 'prefix:<?>'))) { return scalar ('not (not mp6_to_bool(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ' ') . '))') } ; if (Main::bool(($code eq 'prefix:<$>'))) { return scalar ('mp6_to_scalar(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ' ') . ')') } ; if (Main::bool(($code eq 'prefix:<@>'))) { return scalar ('(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ' ') . ')') } ; if (Main::bool(($code eq 'prefix:<%>'))) { return scalar ('%{' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ' ') . '}') } ; if (Main::bool(($code eq 'list:<~>'))) { return scalar ('(str(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ') + str(') . '))') } ; if (Main::bool(($code eq 'infix:<+>'))) { return scalar ('(mp6_to_num(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ') + mp6_to_num(') . '))') } ; if (Main::bool(($code eq 'infix:<->'))) { return scalar ('(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ' - ') . ')') } ; if (Main::bool(($code eq 'infix:<*>'))) { return scalar ('(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ' * ') . ')') } ; if (Main::bool(($code eq 'infix:</>'))) { return scalar ('(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ' / ') . ')') } ; if (Main::bool((($code eq 'infix:<&&>') || ($code eq 'infix:<and>')))) { return scalar ('mp6_and(' . ($self->{arguments}->[0])->emit_python() . ', lambda: ' . ($self->{arguments}->[1])->emit_python() . ')') } ; if (Main::bool((($code eq 'infix:<||>') || ($code eq 'infix:<or>')))) { return scalar ('mp6_or(' . ($self->{arguments}->[0])->emit_python() . ', lambda: ' . ($self->{arguments}->[1])->emit_python() . ')') } ; if (Main::bool(($code eq 'infix:<//>'))) { return scalar ('mp6_defined_or(' . ($self->{arguments}->[0])->emit_python() . ', lambda: ' . ($self->{arguments}->[1])->emit_python() . ')') } ; if (Main::bool(($code eq 'infix:<eq>'))) { return scalar ('(str(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ') == str(') . '))') } ; if (Main::bool(($code eq 'infix:<ne>'))) { return scalar ('(str(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ') != str(') . '))') } ; if (Main::bool(($code eq 'infix:<ge>'))) { return scalar ('(str(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ') >= str(') . '))') } ; if (Main::bool(($code eq 'infix:<le>'))) { return scalar ('(str(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ') <= str(') . '))') } ; if (Main::bool(($code eq 'infix:<==>'))) { return scalar ('(mp6_to_num(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ') == mp6_to_num(') . '))') } ; if (Main::bool(($code eq 'infix:<!=>'))) { return scalar ('(mp6_to_num(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ') != mp6_to_num(') . '))') } ; if (Main::bool(($code eq 'infix:<<>'))) { return scalar ('(mp6_to_num(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ') < mp6_to_num(') . '))') } ; if (Main::bool(($code eq 'infix:<>>'))) { return scalar ('(mp6_to_num(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ') > mp6_to_num(') . '))') } ; if (Main::bool(($code eq 'infix:<<=>'))) { return scalar ('(mp6_to_num(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ') <= mp6_to_num(') . '))') } ; if (Main::bool(($code eq 'infix:<>=>'))) { return scalar ('(mp6_to_num(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ') >= mp6_to_num(') . '))') } ; if (Main::bool(($code eq 'infix:<..>'))) { return scalar ('range(' . ($self->{arguments}->[0])->emit_python() . ', 1 + ' . ($self->{arguments}->[1])->emit_python() . ')') } ; if (Main::bool(($code eq 'infix:<===>'))) { return scalar ('(mp6_id(' . ($self->{arguments}->[0])->emit_python() . ') == mp6_id(' . ($self->{arguments}->[1])->emit_python() . '))') } ; if (Main::bool(($code eq 'exists'))) { ((my  $arg = undef) = $self->{arguments}->[0]); if (Main::bool(Main::isa($arg, 'Lookup'))) { return scalar ('(' . ($arg->obj())->emit_python() . ').has_key(' . ($arg->index_exp())->emit_python() . ')') }  } ; if (Main::bool(($code eq 'ternary:<?? !!>'))) { ((my  $ast = undef) = Do->new(('block' => If->new(('cond' => ($self->{arguments}->[0])), ('body' => Lit::Block->new(('stmts' => do { (my  $List_a = []); (my  $List_v = []); push( @{$List_a}, $self->{arguments}->[1] ); $List_a }))), ('otherwise' => Lit::Block->new(('stmts' => do { (my  $List_a = []); (my  $List_v = []); push( @{$List_a}, $self->{arguments}->[2] ); $List_a }))))))); return scalar ($ast->emit_python()) } ; if (Main::bool(($code eq 'circumfix:<( )>'))) { return scalar ('(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ', ') . ')') } ; if (Main::bool(($code eq 'infix:<=>'))) { return scalar (emit_python_bind($self->{arguments}->[0], $self->{arguments}->[1])) } ; if (Main::bool(($code eq 'return'))) { return scalar ('raise mp6_Return(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ', ') . ')') } ; if (Main::bool(($code eq 'substr'))) { return scalar (($self->{arguments}->[0])->emit_python() . '[' . 'mp6_to_num(' . ($self->{arguments}->[1])->emit_python() . ')' . ':' . 'mp6_to_num(' . ($self->{arguments}->[1])->emit_python() . ') ' . '+ mp6_to_num(' . ($self->{arguments}->[2])->emit_python() . ')' . ']') } ; if (Main::bool(($code eq 'index'))) { return scalar ('mp6_index(' . ($self->{arguments}->[0])->emit_python() . ', ' . ($self->{arguments}->[1])->emit_python() . ')') } ; if (Main::bool(($code eq 'defined'))) { return scalar ('not mp6_isa(' . ($self->{arguments}->[0])->emit_python() . ',\'Mu\')') } ; if (Main::bool(($code eq 'shift'))) { return scalar (($self->{arguments}->[0])->emit_python() . '.f_shift()') } ; if (Main::bool(($code eq 'pop'))) { return scalar (($self->{arguments}->[0])->emit_python() . '.f_pop()') } ; if (Main::bool(($code eq 'push'))) { return scalar (($self->{arguments}->[0])->emit_python() . '.f_push(' . ($self->{arguments}->[1])->emit_python() . ')') } ; if (Main::bool(($code eq 'unshift'))) { return scalar (($self->{arguments}->[0])->emit_python() . '.f_unshift(' . ($self->{arguments}->[1])->emit_python() . ')') } ; if (Main::bool($self->{namespace})) { return scalar (Main::to_go_namespace($self->{namespace}) . '_proto.f_' . $self->{code} . '(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ', ') . ')') } ; 'f_' . $self->{code} . '(' . Main::join(([ map { $_->emit_python() } @{( $self->{arguments} )} ]), ', ') . ')' };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; Python::tab($level) . $self->emit_python() };
sub emit_python_bind { my $parameters = $_[0]; my $arguments = $_[1]; if (Main::bool(Main::isa($parameters, 'Call'))) { return scalar (($parameters->invocant())->emit_python() . '.f__setattr__(\'v_' . $parameters->method() . '\', ' . $arguments->emit_python() . ')') } ; if (Main::bool(((Main::isa($parameters, 'Var') && ($parameters->sigil() eq '@')) || (Main::isa($parameters, 'Decl') && ($parameters->var()->sigil() eq '@'))))) { ($arguments = Lit::Array->new(('array1' => do { (my  $List_a = []); (my  $List_v = []); push( @{$List_a}, $arguments ); $List_a }))) } else { if (Main::bool(((Main::isa($parameters, 'Var') && ($parameters->sigil() eq '%')) || (Main::isa($parameters, 'Decl') && ($parameters->var()->sigil() eq '%'))))) { ($arguments = Lit::Hash->new(('hash1' => do { (my  $List_a = []); (my  $List_v = []); push( @{$List_a}, $arguments ); $List_a }))) }  }; return scalar ($parameters->emit_python() . '.f_set(' . $arguments->emit_python() . ')') }
}

;
{
package If;
sub new { shift; bless { @_ }, "If" }
sub cond { $_[0]->{cond} };
sub body { $_[0]->{body} };
sub otherwise { $_[0]->{otherwise} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; ((my  $has_body = undef) = (Main::bool(($self->{body} || [])) ? 1 : 0)); ((my  $has_otherwise = undef) = (Main::bool(($self->{otherwise} || [])) ? 1 : 0)); ((my  $body_block = undef) = Perlito::Python::LexicalBlock->new(('block' => $self->{body}->stmts()))); if (Main::bool($body_block->has_my_decl())) { ($body_block = Do->new(('block' => $self->{body}))) } ; ((my  $s = undef) = Python::tab($level) . 'if mp6_to_bool(' . $self->{cond}->emit_python() . '):' . '
' . $body_block->emit_python_indented(($level + 1))); if (Main::bool(($has_otherwise))) { ((my  $otherwise_block = undef) = Perlito::Python::LexicalBlock->new(('block' => $self->{otherwise}->stmts()))); if (Main::bool($otherwise_block->has_my_decl())) { ($otherwise_block = Do->new(('block' => $self->{otherwise}))) } ; ($s = $s . '
' . Python::tab($level) . 'else:' . '
' . $otherwise_block->emit_python_indented(($level + 1))) } ; return scalar ($s) }
}

;
{
package While;
sub new { shift; bless { @_ }, "While" }
sub init { $_[0]->{init} };
sub cond { $_[0]->{cond} };
sub continue { $_[0]->{continue} };
sub body { $_[0]->{body} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; ((my  $body_block = undef) = Perlito::Python::LexicalBlock->new(('block' => $self->{body}->stmts()))); if (Main::bool($body_block->has_my_decl())) { ($body_block = Do->new(('block' => $self->{body}))) } ; if (Main::bool(($self->{init} && $self->{continue}))) { die('not implemented (While)') } ; Python::tab($level) . 'while mp6_to_bool(' . $self->{cond}->emit_python() . '):' . '
' . $body_block->emit_python_indented(($level + 1)) }
}

;
{
package For;
sub new { shift; bless { @_ }, "For" }
sub cond { $_[0]->{cond} };
sub body { $_[0]->{body} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; ((my  $body_block = undef) = Perlito::Python::LexicalBlock->new(('block' => $self->{body}->stmts()))); ((my  $sig = undef) = 'v__'); if (Main::bool($self->{body}->sig())) { ($sig = $self->{body}->sig()->emit_python_name()) } ; if (Main::bool($body_block->has_my_decl())) { ((my  $label = undef) = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); ((my  $anon_var = undef) = ($self->{body}->sig() || Var->new(('name' => '_'), ('namespace' => ''), ('sigil' => '$'), ('twigil' => '')))); ((my  $anon_sig = undef) = Sig->new(('invocant' => undef), ('positional' => do { (my  $List_a = []); (my  $List_v = []); push( @{$List_a}, $anon_var ); $List_a }), ('named' => do { (my  $Hash_a = {}); $Hash_a }))); Perlito::Python::LexicalBlock::push_stmt_python(Perlito::Python::AnonSub->new(('name' => $label), ('block' => $self->{body}->stmts()), ('sig' => $anon_sig), ('handles_return_exception' => 0))); return scalar (Python::tab($level) . 'for ' . $sig . ' in ' . $self->{cond}->emit_python() . ':' . '
' . Python::tab(($level + 1)) . 'f_' . $label . '(' . $sig . ')') } ; Python::tab($level) . 'for ' . $sig . ' in ' . $self->{cond}->emit_python() . ':' . '
' . $body_block->emit_python_indented(($level + 1)) }
}

;
{
package Decl;
sub new { shift; bless { @_ }, "Decl" }
sub decl { $_[0]->{decl} };
sub type { $_[0]->{type} };
sub var { $_[0]->{var} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; ((my  $decl = undef) = $self->{decl}); ((my  $name = undef) = $self->{var}->name()); Python::tab($level) . ((Main::bool((($decl eq 'has'))) ? ('') : $self->{var}->emit_python())) };
sub emit_python_init { my $self = $_[0]; if (Main::bool((($self->{var})->sigil() eq '%'))) { return scalar ('mp6_Hash({})') } else { if (Main::bool((($self->{var})->sigil() eq '@'))) { return scalar ('mp6_Array([])') } else { return scalar ('mp6_Scalar()') } }; return scalar ('') }
}

;
{
package Sig;
sub new { shift; bless { @_ }, "Sig" }
sub invocant { $_[0]->{invocant} };
sub positional { $_[0]->{positional} };
sub named { $_[0]->{named} };
sub emit_python { my $self = $_[0]; ' print \'Signature - TODO\'; die \'Signature - TODO\'; ' }
}

;
{
package Method;
sub new { shift; bless { @_ }, "Method" }
sub name { $_[0]->{name} };
sub sig { $_[0]->{sig} };
sub block { $_[0]->{block} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; ((my  $sig = undef) = $self->{sig}); ((my  $invocant = undef) = $sig->invocant()); ((my  $pos = undef) = $sig->positional()); ((my  $args = undef) = do { (my  $List_a = []); (my  $List_v = []); $List_a }); ((my  $default_args = undef) = do { (my  $List_a = []); (my  $List_v = []); $List_a }); ((my  $meth_args = undef) = do { (my  $List_a = []); (my  $List_v = []); $List_a }); push( @{$meth_args}, $invocant->emit_python_name() ); for my $field ( @{($pos || []) || []} ) { ((my  $arg = undef) = $field->emit_python_name()); push( @{$args}, $arg ); push( @{$default_args}, $arg . '=mp6_Scalar()' ); push( @{$meth_args}, $arg . '=mp6_Scalar()' ) }; ((my  $label = undef) = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); ((my  $block = undef) = Perlito::Python::LexicalBlock->new(('block' => $self->{block}), ('needs_return' => 1))); (my  $List_s = []); push( @{$List_s}, Python::tab($level) . 'def f_' . $label . '(' . Main::join($meth_args, ', ') . '):' ); push( @{$List_s}, Python::tab(($level + 1)) . 'try:' ); push( @{$List_s}, $block->emit_python_indented(($level + 2)) ); push( @{$List_s}, Python::tab(($level + 1)) . 'except mp6_Return, r:' ); push( @{$List_s}, Python::tab(($level + 2)) . 'return r.value' ); push( @{$List_s}, Python::tab($level) . 'self.__dict__.update(' . '{' . '\'f_' . $self->{name} . '\':f_' . $label . '})' ); return scalar (Main::join($List_s, '
')) }
}

;
{
package Sub;
sub new { shift; bless { @_ }, "Sub" }
sub name { $_[0]->{name} };
sub sig { $_[0]->{sig} };
sub block { $_[0]->{block} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; ((my  $label = undef) = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); if (Main::bool((($self->{name} eq '')))) { Perlito::Python::LexicalBlock::push_stmt_python(Perlito::Python::AnonSub->new(('name' => $label), ('block' => $self->{block}), ('sig' => $self->{sig}), ('handles_return_exception' => 1))); return scalar (Python::tab($level) . 'f_' . $label) } ; ((my  $sig = undef) = $self->{sig}); ((my  $pos = undef) = $sig->positional()); ((my  $args = undef) = do { (my  $List_a = []); (my  $List_v = []); $List_a }); ((my  $default_args = undef) = do { (my  $List_a = []); (my  $List_v = []); $List_a }); ((my  $meth_args = undef) = do { (my  $List_a = []); (my  $List_v = []); push( @{$List_a}, 'self' ); $List_a }); for my $field ( @{($pos || []) || []} ) { ((my  $arg = undef) = $field->emit_python_name()); push( @{$args}, $arg ); push( @{$default_args}, $arg . '=mp6_Scalar()' ); push( @{$meth_args}, $arg . '=mp6_Scalar()' ) }; ((my  $block = undef) = Perlito::Python::LexicalBlock->new(('block' => $self->{block}), ('needs_return' => 1))); ((my  $label2 = undef) = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); (my  $List_s = []); push( @{$List_s}, Python::tab($level) . 'def f_' . $self->{name} . '(' . Main::join($default_args, ', ') . '):' ); push( @{$List_s}, Python::tab(($level + 1)) . 'try:' ); push( @{$List_s}, $block->emit_python_indented(($level + 2)) ); push( @{$List_s}, Python::tab(($level + 1)) . 'except mp6_Return, r:' ); push( @{$List_s}, Python::tab(($level + 2)) . 'return r.value' ); push( @{$List_s}, Python::tab($level) . 'global ' . $label2 ); push( @{$List_s}, Python::tab($level) . $label2 . ' = f_' . $self->{name} ); push( @{$List_s}, Python::tab($level) . 'def f_' . $label . '(' . Main::join($meth_args, ', ') . '):' ); push( @{$List_s}, Python::tab(($level + 1)) . 'return ' . $label2 . '(' . Main::join($args, ', ') . ')' ); push( @{$List_s}, Python::tab($level) . 'self.__dict__.update(' . '{' . '\'f_' . $self->{name} . '\':f_' . $label . '})' ); return scalar (Main::join($List_s, '
')) }
}

;
{
package Do;
sub new { shift; bless { @_ }, "Do" }
sub block { $_[0]->{block} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; ((my  $label = undef) = '_anon_' . Perlito::Python::LexicalBlock::get_ident_python()); ((my  $block = undef) = $self->simplify()->block()); Perlito::Python::LexicalBlock::push_stmt_python(Perlito::Python::AnonSub->new(('name' => $label), ('block' => $block), ('sig' => Sig->new(('invocant' => undef), ('positional' => do { (my  $List_a = []); (my  $List_v = []); $List_a }), ('named' => do { (my  $Hash_a = {}); $Hash_a }))), ('handles_return_exception' => 0))); return scalar (Python::tab($level) . 'f_' . $label . '()') }
}

;
{
package Use;
sub new { shift; bless { @_ }, "Use" }
sub mod { $_[0]->{mod} };
sub emit_python { my $self = $_[0]; $self->emit_python_indented(0) };
sub emit_python_indented { my $self = $_[0]; my $level = $_[1]; return scalar ('') }
}


}

1;

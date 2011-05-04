# Do not edit this file - Generated by Perlito 7.0
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
    package Perlito::Grammar;
        sub new { shift; bless { @_ }, "Perlito::Grammar" }
        sub unless {
            my $grammar = $_[0];
            my $str = $_[1];
            my $pos = $_[2];
            (my  $MATCH);
            ($MATCH = Perlito::Match->new(('str' => $str), ('from' => $pos), ('to' => $pos), ('bool' => 1)));
            (($MATCH)->{bool} = ((do {
    ((my  $pos1) = $MATCH->to());
    (do {
    ((((((((((('u' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to()))))) && ((('n' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('l' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('e' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('s' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('s' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && (do {
    ((my  $m2) = $grammar->ws($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        1
    }
    else {
        0
    }
})) && (do {
    ((my  $m2) = $grammar->exp($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        ($MATCH->{'exp'} = $m2);
        1
    }
    else {
        0
    }
})) && (((do {
    ((my  $body) = (${$MATCH->{'exp'}})->{'end_block'});
    if (!((defined($body)))) {
        die('Missing code block in ' . chr(39) . 'unless' . chr(39))
    };
    ($MATCH->{capture} = (If->new(('cond' => (${$MATCH->{'exp'}})->{'exp'}), ('body' => Lit::Block->new(('stmts' => do {
    (my  $List_a = bless [], 'ARRAY');
    (my  $List_v = bless [], 'ARRAY');
    $List_a
}))), ('otherwise' => $body))))
}) || 1)))
})
})));
            $MATCH
        };
        sub if {
            my $grammar = $_[0];
            my $str = $_[1];
            my $pos = $_[2];
            (my  $MATCH);
            ($MATCH = Perlito::Match->new(('str' => $str), ('from' => $pos), ('to' => $pos), ('bool' => 1)));
            (($MATCH)->{bool} = ((do {
    ((my  $pos1) = $MATCH->to());
    (do {
    ((((((('i' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to()))))) && ((('f' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && (do {
    ((my  $m2) = $grammar->ws($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        1
    }
    else {
        0
    }
})) && (do {
    ((my  $m2) = $grammar->exp($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        ($MATCH->{'exp'} = $m2);
        1
    }
    else {
        0
    }
})) && (do {
    ((my  $pos1) = $MATCH->to());
    (((do {
    (((((((do {
    ((my  $m2) = $grammar->opt_ws($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        1
    }
    else {
        0
    }
}) && ((('e' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('l' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('s' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('e' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && (do {
    ((my  $m2) = $grammar->exp2($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        ($MATCH->{'exp2'} = $m2);
        1
    }
    else {
        0
    }
})) && (((do {
    ((my  $body) = (${$MATCH->{'exp'}})->{'end_block'});
    ((my  $otherwise) = (${$MATCH->{'exp2'}})->{'exp'});
    if (!((defined($body)))) {
        die('Missing code block in ' . chr(39) . 'if' . chr(39))
    };
    if (!((defined($otherwise)))) {
        die('Missing code block in ' . chr(39) . 'else' . chr(39))
    };
    if (Main::isa($otherwise, 'Lit::Hash')) {
        ($otherwise = Lit::Block->new(('stmts' => $otherwise->hash1())))
    };
    ($MATCH->{capture} = (If->new(('cond' => (${$MATCH->{'exp'}})->{'exp'}), ('body' => $body), ('otherwise' => $otherwise))))
}) || 1)))
}) || (do {
    (($MATCH)->{to} = $pos1);
    (((((((do {
    ((my  $m2) = $grammar->opt_ws($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        1
    }
    else {
        0
    }
}) && ((('e' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('l' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('s' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && (do {
    ((my  $m2) = $grammar->if($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        ($MATCH->{'if'} = $m2);
        1
    }
    else {
        0
    }
})) && (((do {
    ((my  $body) = (${$MATCH->{'exp'}})->{'end_block'});
    if (!((defined($body)))) {
        die('Missing code block in ' . chr(39) . 'if' . chr(39))
    };
    ($MATCH->{capture} = (If->new(('cond' => (${$MATCH->{'exp'}})->{'exp'}), ('body' => $body), ('otherwise' => Lit::Block->new(('stmts' => do {
    (my  $List_a = bless [], 'ARRAY');
    (my  $List_v = bless [], 'ARRAY');
    push( @{$List_a}, ${$MATCH->{'if'}} );
    $List_a
}))))))
}) || 1))))
})) || (do {
    (($MATCH)->{to} = $pos1);
    ((((do {
    ((my  $body) = (${$MATCH->{'exp'}})->{'end_block'});
    if (!((defined($body)))) {
        die('Missing code block in ' . chr(39) . 'if' . chr(39))
    };
    ($MATCH->{capture} = (If->new(('cond' => (${$MATCH->{'exp'}})->{'exp'}), ('body' => $body), ('otherwise' => Lit::Block->new(('stmts' => do {
    (my  $List_a = bless [], 'ARRAY');
    (my  $List_v = bless [], 'ARRAY');
    $List_a
}))))))
}) || 1)))
}))
}))
})
})));
            $MATCH
        };
        sub when {
            my $grammar = $_[0];
            my $str = $_[1];
            my $pos = $_[2];
            (my  $MATCH);
            ($MATCH = Perlito::Match->new(('str' => $str), ('from' => $pos), ('to' => $pos), ('bool' => 1)));
            (($MATCH)->{bool} = ((do {
    ((my  $pos1) = $MATCH->to());
    (do {
    ((((((((('w' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to()))))) && ((('h' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('e' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('n' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && (do {
    ((my  $m2) = $grammar->ws($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        1
    }
    else {
        0
    }
})) && (do {
    ((my  $m2) = $grammar->exp($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        ($MATCH->{'exp'} = $m2);
        1
    }
    else {
        0
    }
})) && (((do {
    ((my  $body) = (${$MATCH->{'exp'}})->{'end_block'});
    if (!((defined($body)))) {
        die('Missing code block in ' . chr(39) . 'when' . chr(39))
    };
    ($MATCH->{capture} = (When->new(('parameters' => (${$MATCH->{'exp'}})->{'exp'}), ('body' => $body))))
}) || 1)))
})
})));
            $MATCH
        };
        sub for {
            my $grammar = $_[0];
            my $str = $_[1];
            my $pos = $_[2];
            (my  $MATCH);
            ($MATCH = Perlito::Match->new(('str' => $str), ('from' => $pos), ('to' => $pos), ('bool' => 1)));
            (($MATCH)->{bool} = ((do {
    ((my  $pos1) = $MATCH->to());
    (do {
    (((((((('f' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to()))))) && ((('o' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('r' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && (do {
    ((my  $m2) = $grammar->ws($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        1
    }
    else {
        0
    }
})) && (do {
    ((my  $m2) = $grammar->exp($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        ($MATCH->{'exp'} = $m2);
        1
    }
    else {
        0
    }
})) && (((do {
    ((my  $body) = (${$MATCH->{'exp'}})->{'end_block'});
    if (!((defined($body)))) {
        die('Missing code block in ' . chr(39) . 'when' . chr(39))
    };
    ($MATCH->{capture} = (For->new(('cond' => (${$MATCH->{'exp'}})->{'exp'}), ('topic' => undef()), ('body' => $body))))
}) || 1)))
})
})));
            $MATCH
        };
        sub while {
            my $grammar = $_[0];
            my $str = $_[1];
            my $pos = $_[2];
            (my  $MATCH);
            ($MATCH = Perlito::Match->new(('str' => $str), ('from' => $pos), ('to' => $pos), ('bool' => 1)));
            (($MATCH)->{bool} = ((do {
    ((my  $pos1) = $MATCH->to());
    (do {
    (((((((((('w' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to()))))) && ((('h' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('i' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('l' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('e' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && (do {
    ((my  $m2) = $grammar->ws($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        1
    }
    else {
        0
    }
})) && (do {
    ((my  $m2) = $grammar->exp($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        ($MATCH->{'exp'} = $m2);
        1
    }
    else {
        0
    }
})) && (((do {
    ((my  $body) = (${$MATCH->{'exp'}})->{'end_block'});
    if (!((defined($body)))) {
        die('Missing code block in ' . chr(39) . 'while' . chr(39))
    };
    ($MATCH->{capture} = (While->new(('cond' => (${$MATCH->{'exp'}})->{'exp'}), ('body' => $body))))
}) || 1)))
})
})));
            $MATCH
        };
        sub loop {
            my $grammar = $_[0];
            my $str = $_[1];
            my $pos = $_[2];
            (my  $MATCH);
            ($MATCH = Perlito::Match->new(('str' => $str), ('from' => $pos), ('to' => $pos), ('bool' => 1)));
            (($MATCH)->{bool} = ((do {
    ((my  $pos1) = $MATCH->to());
    (do {
    ((((((((('l' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to()))))) && ((('o' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('o' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && ((('p' eq substr($str, $MATCH->to(), 1)) && ((($MATCH)->{to} = (1 + $MATCH->to())))))) && (do {
    ((my  $m2) = $grammar->ws($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        1
    }
    else {
        0
    }
})) && (do {
    ((my  $m2) = $grammar->exp($str, $MATCH->to()));
    if ($m2) {
        (($MATCH)->{to} = $m2->to());
        ($MATCH->{'exp'} = $m2);
        1
    }
    else {
        0
    }
})) && (((do {
    ((my  $body) = (${$MATCH->{'exp'}})->{'end_block'});
    if (!((defined($body)))) {
        ($body = (${$MATCH->{'exp'}})->{'exp'});
        if (Main::isa($body, 'Lit::Block')) {
            ($MATCH->{capture} = (While->new(('cond' => Val::Bit->new(('bit' => 1))), ('body' => $body))))
        }
        else {
            die('Missing code block in ' . chr(39) . 'loop' . chr(39))
        }
    }
    else {
        die(chr(39) . 'loop' . chr(39) . ' with parameters is not implemented')
    }
}) || 1)))
})
})));
            $MATCH
        }
    }


}

1;

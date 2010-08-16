
class MiniPerl6::Expression {
    use MiniPerl6::Precedence;
    use MiniPerl6::Grammar;
    use MiniPerl6::Perl5::Emitter;
   
    sub pop_term ($num_stack) {
        my $v = $num_stack.pop;
        if $v.isa('Array') {
            say "# ** processing term ", $v.perl;
            if $v[1] eq 'methcall_no_params' {
                say "#   Call ", ($v[2]).perl;
                $v = Call.new( invocant => $v[3], method => $v[2], arguments => undef, hyper => 0 );
                say "#     ", $v.perl;
                return $v;
            }
            if $v[1] eq 'funcall_no_params' {
                say "#   Apply ", ($v[2]).perl;
                $v = Apply.new( code => $v[3], arguments => undef, namespace => $v[2] );
                say "#     ", $v.perl;
                return $v;
            }
            if $v[1] eq 'methcall' {
                say "#   Call ", ($v[2]).perl;
                $v = Call.new( invocant => undef, method => $v[2], arguments => $v[3], hyper => 0 );
                say "#     ", $v.perl;
                return $v;
            }
            if $v[1] eq 'funcall' {
                say "#   Apply ", ($v[2]).perl;
                $v = Apply.new( code => $v[3], arguments => $v[4], namespace => $v[2] );
                say "#     ", $v.perl;
                return $v;
            }
            if $v[1] eq '( )' {
                say "#   Plain parentheses ", ($v[2]).perl;
                $v = Apply.new( code => 'circumfix:<( )>', arguments => $v[2], namespace => '' );
                say "#     ", $v.perl;
                return $v;
            }
            if $v[1] eq '[ ]' {
                say "#   Array ", ($v[2]).perl;
                $v = Lit::Array.new( array1 => $v[2] );
                say "#     ", $v.perl;
                return $v;
            }
            if $v[1] eq 'block' {
                say "#   Block, Hash, or Pair ", ($v[2]).perl;
                $v = Lit::Block.new( stmts => $v[2] );
                # TODO: $v = Lit::Hash.new( hash1 => $v[2] );
                return $v;
            }
            if $v[1] eq '.( )' {
                say "#   Params ", ($v[2]).perl;
                say "#     v:     ", $v.perl;
                $v = Call.new( invocant => undef, method => 'postcircumfix:<( )>', arguments => $v[2], hyper => 0 );
                return $v;
            }
            if $v[1] eq '.[ ]' {
                say "#   Index ", ($v[2]).perl;
                $v = Index.new( obj => undef, index_exp => $v[2] );
                say "#     ", $v.perl;
                return $v;
            }
            if $v[1] eq '.{ }' {
                say "#   Lookup ", ($v[2]).perl;
                $v = Lookup.new( obj => undef, index_exp => $v[2] );
                say "#     ", $v.perl;
                return $v;
            }
            if ($v[1]).isa('Array') && ((($v[1]).elems) == 2) {
                say "#   old style Pair ", $v.perl;
                #   old style Pair - wrap it into a subroutine for now
                $v = Apply.new( code => 'pair', arguments => $v[1], namespace => '' );
                say "#     ", $v.perl;
                return $v;
            }
            return $v[1];
        }
        return $v;
    }

    sub reduce_postfix ($op, $value) {
        my $v = $op;
        say "# ** reduce_postfix ", $op.perl;
        say "#      value: ", $value.perl;
        say "#      v:     ", $v.perl;
        if $v[1] eq 'methcall_no_params' {
            say "#   Call ", ($v[2]).perl;
            $v = Call.new( invocant => $value, method => $v[2], arguments => undef, hyper => 0 );
            return $v;
        }
        if $v[1] eq 'funcall_no_params' {
            die "unexpected function call";
            say "#   Apply ", ($v[2]).perl;
            push $v, $value;
            return $v;
        }
        if $v[1] eq 'methcall' {
            say "#   Call ", ($v[2]).perl;
            $v = Call.new( invocant => $value, method => $v[2], arguments => $v[3], hyper => 0 );
            return $v;
        }
        if $v[1] eq 'funcall' {
            die "unexpected function call";
            say "#   Apply ", ($v[2]).perl;
            push $v, $value;
            return $v;
        }
        if $v[1] eq '( )' {
            say "#   Params ", ($v[2]).perl;
            if $value.isa('Apply') && !(defined($value.arguments)) {
                $value.arguments = $v[2];
                return $value;
            }
            if $value.isa('Call') && !(defined($value.arguments)) {
                $value.arguments = $v[2];
                return $value;
            }
            $v = Call.new( invocant => $value, method => 'postcircumfix:<( )>', arguments => $v[2], hyper => 0 );
            return $v;
        }
        if $v[1] eq '[ ]' {
            say "#   Index ", ($v[2]).perl;
            $v = Index.new( obj => $value, index_exp => $v[2] );
            say "#     ", $v.perl;
            return $v;
        }
        if $v[1] eq 'block' {
            say "#   Lookup (was Block)", ($v[2]).perl;
            $v = Lookup.new( obj => $value, index_exp => ($v[2])[0] );
            return $v;
        }
        if $v[1] eq '.( )' {
            $v = Call.new( invocant => $value, method => 'postcircumfix:<( )>', arguments => $v[2], hyper => 0 );
            return $v;
        }
        if $v[1] eq '.[ ]' {
            $v = Call.new( invocant => $value, method => 'postcircumfix:<[ ]>', arguments => $v[2], hyper => 0 );
            return $v;
        }
        if $v[1] eq '.{ }' {
            $v = Call.new( invocant => $value, method => 'postcircumfix:<{ }>', arguments => $v[2], hyper => 0 );
            return $v;
        }
        push $op, $value;
        return $op;
    }

    my $reduce_to_ast = sub ($op_stack, $num_stack) {
        my $last_op = $op_stack.shift;
        say "# reduce_to_ast ";
        say "#     last_op: ", $last_op.perl;
        say "#   num_stack: ", $num_stack;
        if $last_op[0] eq 'prefix' {
            push $num_stack,
                Apply.new(
                    namespace => '',
                    code      => 'prefix:<' ~ $last_op[1] ~ '>',
                    arguments => [ pop_term($num_stack) ],
                  );
        }
        elsif $last_op[0] eq 'postfix' {
            push $num_stack,
                Apply.new(
                    namespace => '',
                    code      => 'postfix:<' ~ $last_op[1] ~ '>',
                    arguments => [ pop_term($num_stack) ],
                  );
        }
        elsif $last_op[0] eq 'postfix_or_term' {
            $num_stack.push( reduce_postfix( $last_op, pop_term($num_stack) ) );
        }
        elsif MiniPerl6::Precedence::is_assoc_type('list', $last_op[1]) {
            my $arg;
            if $num_stack.elems < 2 {
                push $num_stack, 
                    Apply.new(
                        namespace => '',
                        code      => 'postfix:<' ~ $last_op[1] ~ '>',
                        arguments => [ pop_term($num_stack) ],
                      );
                return;
            }
            else {
                my $v2 = pop_term($num_stack);
                $arg = [ pop_term($num_stack), $v2 ];
            }
            if     (($arg[0]).isa('Apply'))
                && ($last_op[0] eq 'infix') 
                && (($arg[0]).code eq ('list:<' ~ $last_op[1] ~ '>')) 
            {
                push $num_stack,
                    Apply.new(
                        namespace => '',
                        code      => ($arg[0]).code,
                        arguments => [ @( ($arg[0]).arguments ), $arg[1] ],
                      );
                return;
            }
            push $num_stack, 
                Apply.new(
                    namespace => '',
                    code      => 'list:<' ~ $last_op[1] ~ '>',
                    arguments => $arg,
                  );
        }
        elsif MiniPerl6::Precedence::is_assoc_type('chain', $last_op[1]) {
            if $num_stack.elems < 2 {
                die "Missing value after operator";
            }
            my $v2 = pop_term($num_stack);
            my $arg = [ pop_term($num_stack), $v2 ];
            if ($arg[1]).isa('Hash')
                && MiniPerl6::Precedence::is_assoc_type('chain', ($arg[1]){op} ) 
            {
                push $num_stack,
                  {
                    op    => ['infix', $last_op],
                    val   => [ $arg[0] ],
                    chain => $arg[1]
                  };
                return;
            }
            push $num_stack, { op => ['infix', $last_op], val => $arg };
        }
        elsif $last_op[0] eq 'ternary' {
            if ( $num_stack.elems < 2 ) {
                die "Missing value after ternary operator";
            }
            my $v2 = pop_term($num_stack);
            push $num_stack,
                Apply.new(
                    namespace => '',
                    code      => 'ternary:<' ~ $last_op[1] ~ '>',
                    arguments => [ pop_term($num_stack), $last_op[2], $v2 ],
                  );
        }
        else {
            if ( $num_stack.elems < 2 ) {
                die "Missing value after operator";
            }
            my $v2 = pop_term($num_stack);
            push $num_stack,
                Apply.new(
                    namespace => '',
                    code      => 'infix:<' ~ $last_op[1] ~ '>',
                    arguments => [ pop_term($num_stack), $v2 ],
                  );
        }
    };
    
    # TODO
    # token pair {
    #     |   \: <var_sigil> <ident>                  #  :$var
    #                 Val::Buf.new( buf => ~$<ident> ),
    #                 Var.new( sigil => ~$$<var_sigil>, twigil => '', name => $$<ident> ) ]

    token operator { 
        | '.(' <paren_parse>   ')'                      { make [ 'postfix_or_term',  '.( )',  $$<paren_parse>   ] }
        | '.[' <square_parse>  ']'                      { make [ 'postfix_or_term',  '.[ ]',  $$<square_parse>  ] }
        | '.{' <curly_parse>   '}'                      { make [ 'postfix_or_term',  '.{ }',  $$<curly_parse>   ] }
        | '('  <paren_parse>   ')'                      { make [ 'postfix_or_term',  '( )',   $$<paren_parse>   ] }
        | '['  <square_parse>  ']'                      { make [ 'postfix_or_term',  '[ ]',   $$<square_parse>  ] }


        # TODO: general rule for terms that terminate in a block
        #       {...}  ->$v{...}  sub...{...}   method...{...}   do{...}
        | '->' <.MiniPerl6::Grammar.ws>? <var_ident> <.MiniPerl6::Grammar.ws> 
          '{'  <.MiniPerl6::Grammar.ws>?
               <MiniPerl6::Grammar.exp_stmts> <.MiniPerl6::Grammar.ws>? '}'
                    { make [ 'postfix_or_term', 'block', $$<MiniPerl6::Grammar.exp_stmts> ] }
        | '{'  <.MiniPerl6::Grammar.ws>?
               <MiniPerl6::Grammar.exp_stmts> <.MiniPerl6::Grammar.ws>? '}'
                    { make [ 'postfix_or_term', 'block', $$<MiniPerl6::Grammar.exp_stmts> ] }
        | <MiniPerl6::Grammar.method_def>               { make [ 'term', $$<MiniPerl6::Grammar.method_def>  ] }
        | <MiniPerl6::Grammar.sub_def>                  { make [ 'term', $$<MiniPerl6::Grammar.sub_def>     ] }


        | '??' <ternary_parse> '!!'                     { make [ 'op',          '?? !!', $$<ternary_parse>  ] }
        | <MiniPerl6::Grammar.var_ident>                { make [ 'term', $$<MiniPerl6::Grammar.var_ident>   ] }     
        | <MiniPerl6::Precedence.op_parse>              { make $$<MiniPerl6::Precedence.op_parse>             }
        | <MiniPerl6::Grammar.ident> <before <.MiniPerl6::Grammar.ws>? '=>' >   # autoquote
            { make [ 'term', Val::Buf.new( buf => ~$<MiniPerl6::Grammar.ident> ) ] }
        | 'and' <!before <.MiniPerl6::Grammar.word> >   { make [ 'op',          'and'                       ] }
        | '.' <MiniPerl6::Grammar.ident> 
          [ <.MiniPerl6::Grammar.ws> <list_parse>   
            { make [ 'postfix_or_term', 'methcall',           ~$<MiniPerl6::Grammar.ident>, $$<list_parse>  ] }
          | { make [ 'postfix_or_term', 'methcall_no_params', ~$<MiniPerl6::Grammar.ident>                  ] }
          ]
        | <MiniPerl6::Grammar.optional_namespace_before_ident> <MiniPerl6::Grammar.ident> 
          [ <.MiniPerl6::Grammar.ws> <list_parse>   
            { make [ 'postfix_or_term', 'funcall',            
                     ~$<MiniPerl6::Grammar.optional_namespace_before_ident>,
                     ~$<MiniPerl6::Grammar.ident>, $$<list_parse>  ] }
          | { make [ 'postfix_or_term', 'funcall_no_params',  
                     ~$<MiniPerl6::Grammar.optional_namespace_before_ident>,
                     ~$<MiniPerl6::Grammar.ident>                  ] }
          ]
        | <MiniPerl6::Grammar.val>                      { make [ 'term', $$<MiniPerl6::Grammar.val>         ] }
        | <.MiniPerl6::Grammar.ws>                      { make [ 'space',   ' '                             ] }
    }

    token has_newline_after {
        |    '#' 
        |    <.MiniPerl6::Grammar.is_newline> 
        |    <.MiniPerl6::Grammar.space>  <.has_newline_after>
    }
    token has_no_comma_or_colon_after {
        <.MiniPerl6::Grammar.ws> <!before [ ',' | ':' ]> .
    }

    method list_parse ($str, $pos) {
        say "# list_parse: input ",$str," at ",$pos;
        my $expr;
        my $last_pos = $pos;
        my $is_first_token = True;
        my $lexer_stack = [];
        my $get_token = sub {
            my $v;
            if $lexer_stack.elems {
                $v = $lexer_stack.pop;
            }
            else {
                my $m = self.operator($str, $last_pos);
                say "# list lexer got: " ~ $m.perl;
                if !$m {
                    return [ 'end', '*end*' ];
                }
                $v = $$m;
                if $v[0] ne 'end' {
                    $last_pos = $m.to;
                }
            }
            say "# list_lexer got " ~ $v.perl;

            if  $is_first_token 
                && ($v[0] eq 'op')
                && !(MiniPerl6::Precedence::is_fixity_type('prefix', $v[1]))
            {
                say "# finishing list - first token is: ", $v[1];
                $v[0] = 'end';
            }
            $is_first_token = False;   
            say "# list_lexer " ~ $v.perl;

            if (($v[0]) eq 'postfix_or_term') && (($v[1]) eq 'block') {
                if self.has_newline_after($str, $last_pos) {
                    # a block followed by newline terminates the expression
                    $lexer_stack.push( [ 'end', '*end*' ] );
                }
                elsif self.has_no_comma_or_colon_after($str, $last_pos) {
                    # a sequence ( block - space - not_comma_or_colon ) terminates the list
                    $lexer_stack.push( [ 'end', '*end*' ] );
                }
            } 

            return $v;
        };
        my $prec = MiniPerl6::Precedence.new(get_token => $get_token, reduce => $reduce_to_ast,
            end_token => [ 'and', 'or', ')', ';' ] );
        my $res = $prec.precedence_parse;
        say "# list_lexer return: ", $res.perl;
        if $res.elems == 0 {
            return MiniPerl6::Match.new(bool => 0);
        }
        $res = pop_term($res);
        return MiniPerl6::Match.new( 
            'str' => $str, 'from' => $pos, 'to' => $last_pos, 'bool' => 1, capture => $res);
    }

    method circumfix_parse ($str, $pos, $delimiter) {
        say "# circumfix_parse input: ",$str," at ",$pos;
        my $expr;
        my $last_pos = $pos;
        my $get_token = sub {
            my $m = self.operator($str, $last_pos);
            if !$m {
                die "Expected closing delimiter: ", $delimiter;
            }
            my $v = $$m;
            if $v[0] ne 'end' {
                $last_pos = $m.to;
            }
            say "# circumfix_lexer " ~ $v.perl;
            return $v;
        };
        my $prec = MiniPerl6::Precedence.new(get_token => $get_token, reduce => $reduce_to_ast,
            end_token => $delimiter );
        my $res = $prec.precedence_parse;
        $res = pop_term($res);
        say "# circumfix_parse return: ", $res.perl;
        return MiniPerl6::Match.new( 
            'str' => $str, 'from' => $pos, 'to' => $last_pos, 'bool' => 1, capture => $res);
    }

    method ternary_parse ($str, $pos) {
        return self.circumfix_parse($str, $pos, ['!!']);
    }
    method curly_parse ($str, $pos) {
        return self.circumfix_parse($str, $pos, ['}']);
    }
    method square_parse ($str, $pos) {
        return self.circumfix_parse($str, $pos, [']']);
    }
    method paren_parse ($str, $pos) {
        return self.circumfix_parse($str, $pos, [')']);
    }

    method exp_parse ($str, $pos) {
        say "# exp_parse input: ",$str," at ",$pos;
        my $expr;
        my $last_pos = $pos;
        my $lexer_stack = [];
        my $terminated = 0;
        my $get_token = sub {
            my $v;
            if $lexer_stack.elems {
                $v = $lexer_stack.pop;
            }
            else {
                my $m = self.operator($str, $last_pos);
                say "# exp lexer got: " ~ $m.perl;
                if !$m {
                    return [ 'end', '*end*' ];
                }
                $v = $$m;
                if $v[0] ne 'end' {
                    $last_pos = $m.to;
                }
            }
            say "# exp_lexer got " ~ $v.perl;

            if (($v[0]) eq 'postfix_or_term') && (($v[1]) eq 'block') {
                # a block followed by newline terminates the expression
                if self.has_newline_after($str, $last_pos) {
                    $terminated = 1;
                    $lexer_stack.push( [ 'end', '*end*' ] );
                }
            } 

            return $v;
        };
        my $prec = MiniPerl6::Precedence.new(get_token => $get_token, reduce => $reduce_to_ast, 
            end_token => [ '}', ';', 'if', 'unless', 'when', 'for', 'while', 'loop' ] );
        my $res = $prec.precedence_parse;
        say "# exp terminated";
        if $res.elems == 0 {
            say "# exp terminated with false";
            return MiniPerl6::Match.new(bool => 0);
        }
        # if the expression terminates in a block, the block was pushed to num_stack
        my $block;
        if $res.elems > 1 {
            $block = pop_term($res);
            say "# exp terminated with a block: ", $block.perl;
        }
        $res = pop_term($res);
        say "# exp_parse result: ", $res.perl;
        return MiniPerl6::Match.new( 
            'str' => $str, 'from' => $pos, 'to' => $last_pos, 'bool' => 1, 
            capture => {
                exp        => $res,
                end_block  => $block,
                terminated => $terminated } )
    } 

    token exp_stmt {
        | <MiniPerl6::Grammar.if>     { make $$<MiniPerl6::Grammar.if>     }   
        | <MiniPerl6::Grammar.unless> { make $$<MiniPerl6::Grammar.unless> }   
        | <MiniPerl6::Grammar.when>   { make $$<MiniPerl6::Grammar.when>   }   
        | <MiniPerl6::Grammar.for>    { make $$<MiniPerl6::Grammar.for>    }   
        | <MiniPerl6::Grammar.while>  { make $$<MiniPerl6::Grammar.while>  }   
        | <MiniPerl6::Grammar.loop>   { make $$<MiniPerl6::Grammar.loop>   }   
    }

    token statement_modifier {
        'if' | 'unless' | 'when' | 'for' | 'while' | 'loop'
    }

    method statement_parse ($str, $pos) {
        say "# statement_parse input: ",$str," at ",$pos;
        my $expr;
        my $last_pos = $pos;
        my $lexer_stack = [];
        my $res = self.exp_stmt($str, $pos);
        if $res {
            say "# statement result: ", $res.perl;
            return $res;
        }
        $res = self.exp_parse($str, $pos);
        if !($res) {
            say "# not a statement or expression";
            return $res;
        }
        if ($$res){'end_block'} {
            die "Unexpected block after expression";
        }
        if ($$res){'terminated'} {
            say "# statement expression terminated result: ", $res.perl;
            return $res;
        }
        say "# look for a statement modifier";
        my $modifier = self.statement_modifier($str, $res.to);
        if !($modifier) {
            say "# statement expression no modifier result: ", $res.perl;
            # TODO - require a statement terminator 
            return $res;
        }
        my $modifier_exp = self.exp_parse($str, $modifier.to);
        say "# statement modifier [", $modifier, "] exp: ", $modifier_exp.perl;
        if !($modifier_exp) {
            die "Expected expression after '", $modifier, "'";
        }
        if ($$modifier_exp){'end_block'} {
            die "Unexpected block after expression";
        }
        # TODO - require a statement terminator 
        say "# statement_parse modifier result: ", $modifier_exp.perl;
        return MiniPerl6::Match.new( 
            'str' => $str, 'from' => $pos, 'to' => $modifier_exp.to, 'bool' => 1, 
            capture => {
                exp          => $res,
                modifier     => ~$modifier,
                modifier_exp => $$modifier_exp } )
    } 

}


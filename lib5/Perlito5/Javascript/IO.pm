# Do not edit this file - Generated by Perlito5 8.0
use v5;
use Perlito5::Perl5::Runtime;
our $MATCH = {};
package main;
use v5;
package Perlito5::Javascript::IO;
sub Perlito5::Javascript::IO::emit_javascript {
    return ('//' . chr(10) . '//' . chr(10) . '// lib/Perlito5/Javascript/IO.js' . chr(10) . '//' . chr(10) . '// I/O functions for "Perlito" Perl5-in-Javascript' . chr(10) . '//' . chr(10) . '// AUTHORS' . chr(10) . '//' . chr(10) . '// Flavio Soibelmann Glock  fglock@gmail.com' . chr(10) . '//' . chr(10) . '// COPYRIGHT' . chr(10) . '//' . chr(10) . '// Copyright 2009, 2010, 2011, 2012 by Flavio Soibelmann Glock and others.' . chr(10) . '//' . chr(10) . '// This program is free software; you can redistribute it and/or modify it' . chr(10) . '// under the same terms as Perl itself.' . chr(10) . '//' . chr(10) . '// See http://www.perl.com/perl/misc/Artistic.html' . chr(10) . chr(10) . 'var isNode = typeof require != "undefined";' . chr(10) . 'if (isNode) {' . chr(10) . chr(10) . '    var fs = require("fs");' . chr(10) . chr(10) . '    p5atime = function(s) {' . chr(10) . '        var stat = fs.statSync(s); return stat["atime"];' . chr(10) . '    }' . chr(10) . '    p5mtime = function(s) {' . chr(10) . '        var stat = fs.statSync(s); return stat["mtime"];' . chr(10) . '    }' . chr(10) . '    p5ctime = function(s) {' . chr(10) . '        var stat = fs.statSync(s); return stat["ctime"];' . chr(10) . '    }' . chr(10) . '    p5size = function(s) {' . chr(10) . '        var stat = fs.statSync(s); return stat["size"];' . chr(10) . '    }' . chr(10) . '    p5is_file = function(s) {' . chr(10) . '        var stat = fs.statSync(s); return stat.isFile() ? 1 : 0;' . chr(10) . '    }' . chr(10) . '    p5is_directory = function(s) {' . chr(10) . '        var stat = fs.statSync(s); return stat.isDirectory() ? 1 : 0;' . chr(10) . '    }' . chr(10) . chr(10) . '}' . chr(10) . chr(10))
};
1;

1;

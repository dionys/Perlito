package Perlito5::Runtime;

use Perlito5::strict;


$Perlito5::EXPAND_USE = 1;
$Perlito5::STRICT     = 0;
$Perlito5::WARNINGS   = 0;
$Perlito5::UTF8       = 0;
$Perlito5::BYTES      = 0;


# the special variables list
# obtained with:
# $ perldoc -u perlvar | perl -ne ' /^\s*$/ && next; if (/^=item\s+([^\n]+)/) { push @item, $1; print "@item - $_" } else { if (@item) { push @xx, [@item]; print "push\n"; @item = () } }; END {use Data::Dumper; print Dumper \@xx} '

$Perlito5::SPECIAL_VAR = {
          '$_' => 'ARG',
          '$&' => '$MATCH',
          '$`' => '$PREMATCH',
          '$\'' => '$POSTMATCH',
          '$+' => '$LAST_PAREN_MATCH',
          '@+' => '@LAST_MATCH_END',
          '%+' => '%LAST_PAREN_MATCH',

          '@-' => '@LAST_MATCH_START',
          '$|' => 'autoflush',
          '$/' => '$RS',
          '@_' => '@ARG',
          '< $' => '$EUID',
          '$.' => '$NR',
          '< $< ' => '$UID',
          '$(' => '$GID',
          '$#' => undef,
          '$@' => '$EVAL_ERROR',
          '$=' => '$FORMAT_LINES_PER_PAGE',
          '$,' => '$OFS',
          '$?' => '$CHILD_ERROR',
          '$*' => undef,
          '$[' => undef,
          '$$' => '$PID',
          '%-' => undef,
          '$~' => '$FORMAT_NAME',
          '$-' => '$FORMAT_LINES_LEFT',
          '$&' => '$MATCH',
          '$%' => '$FORMAT_PAGE_NUMBER',
          '$)' => '$EGID',
          '$]' => undef,
          '$!' => '$ERRNO',
          '$;' => '$SUBSEP',
          '$\\' => '$ORS',
          '%!' => undef,
          '$"' => '$LIST_SEPARATOR',
          '$_' => '$ARG',
          '$:' => 'FORMAT_LINE_BREAK_CHARACTERS'
        };

# the CORE prototype list
# obtained with:
# $ perldoc -u PerlFunc | head -n300 | perl -ne ' push @x, /C<([^>]+)/g; END { eval { $p{"CORE::$_"} = prototype("CORE::$_") } for @x; use Data::Dumper; print Dumper \%p } ' > ~/tmp/core.pm

$Perlito5::CORE_PROTO = {
          'CORE::shutdown' => '*$',
          'CORE::chop' => undef,
          'CORE::lstat' => '*',
          'CORE::rename' => '$$',
          'CORE::lock' => '\\$',
          'CORE::rand' => ';$',
          'CORE::gmtime' => ';$',
          'CORE::gethostbyname' => '$',
          'CORE::each' => '\\[@%]',
          'CORE::ref' => '_',
          'CORE::syswrite' => '*$;$$',
          'CORE::msgctl' => '$$$',
          'CORE::getnetbyname' => '$',
          'CORE::write' => ';*',
          'CORE::alarm' => '_',
          'CORE::print' => undef,
          'CORE::getnetent' => '',
          'CORE::semget' => '$$$',
          'CORE::use' => undef,
          'CORE::abs' => '_',
          'CORE::break' => '',
          'CORE::undef' => undef,
          'CORE::no' => undef,
          'CORE::eval' => undef,
          'CORE::split' => undef,
          'CORE::localtime' => ';$',
          'CORE::sort' => undef,
          'CORE::chown' => '@',
          'CORE::endpwent' => '',
          'CORE::getpwent' => '',
          'CORE::pos' => undef,
          'CORE::lcfirst' => '_',
          'CORE::kill' => '@',
          'CORE::send' => '*$$;$',
          'CORE::endprotoent' => '',
          'CORE::semctl' => '$$$$',
          'CORE::waitpid' => '$$',
          'CORE::utime' => '@',
          'CORE::dbmclose' => '\\%',
          'CORE::getpwnam' => '$',
          'CORE::substr' => '$$;$$',
          'CORE::listen' => '*$',
          'CORE::getprotoent' => '',
          'CORE::shmget' => '$$$',
          'CORE::our' => undef,
          'CORE::readlink' => '_',
          'CORE::shmwrite' => '$$$$',
          'CORE::times' => '',
          'CORE::package' => undef,
          'CORE::map' => undef,
          'CORE::join' => '$@',
          'CORE::rmdir' => '_',
          'CORE::shmread' => '$$$$',
          'CORE::uc' => '_',
          'CORE::bless' => '$;$',
          'CORE::closedir' => '*',
          'CORE::getppid' => '',
          'CORE::tie' => undef,
          'CORE::readdir' => '*',
          'CORE::gethostent' => '',
          'CORE::getlogin' => '',
          'CORE::last' => undef,
          'CORE::gethostbyaddr' => '$$',
          'CORE::accept' => '**',
          'CORE::log' => '_',
          'CORE::tell' => ';*',
          'CORE::readline' => ';*',
          'CORE::tied' => undef,
          'CORE::socket' => '*$$$',
          'CORE::umask' => ';$',
          'CORE::sysread' => '*\\$$;$',
          'CORE::syscall' => '$@',
          'CORE::quotemeta' => '_',
          'CORE::dump' => '',
          'CORE::opendir' => '*$',
          'CORE::untie' => undef,
          'CORE::truncate' => '$$',
          'CORE::select' => ';*',
          'CORE::sleep' => ';$',
          'CORE::seek' => '*$$',
          'CORE::read' => '*\\$$;$',
          'CORE::rewinddir' => '*',
          'CORE::scalar' => undef,
          'CORE::wantarray' => '',
          'CORE::oct' => '_',
          'CORE::bind' => '*$',
          'CORE::stat' => '*',
          'CORE::sqrt' => '_',
          'CORE::getc' => ';*',
          'CORE::fileno' => '*',
          'CORE::getpeername' => '*',
          'CORE::sin' => '_',
          'CORE::getnetbyaddr' => '$$',
          'CORE::grep' => undef,
          'CORE::setservent' => '$',
          'CORE::sub' => undef,
          'CORE::shmctl' => '$$$',
          'CORE::study' => undef,
          'CORE::msgrcv' => '$$$$$',
          'CORE::setsockopt' => '*$$$',
          'CORE::int' => '_',
          'CORE::pop' => ';\\@',
          'CORE::link' => '$$',
          'CORE::exec' => undef,
          'CORE::setpwent' => '',
          'CORE::mkdir' => '_;$',
          'CORE::sysseek' => '*$$',
          'CORE::endservent' => '',
          'CORE::chr' => '_',
          'CORE::when' => undef,
          'CORE::getpwuid' => '$',
          'CORE::setprotoent' => '$',
          'CORE::reverse' => '@',
          'CORE::say' => undef,
          'CORE::goto' => undef,
          'CORE::getgrent' => '',
          'CORE::endnetent' => '',
          'CORE::hex' => '_',
          'CORE::binmode' => '*;$',
          'CORE::formline' => '$@',
          'CORE::getgrnam' => '$',
          'CORE::ucfirst' => '_',
          'CORE::chdir' => ';$',
          'CORE::setnetent' => '$',
          'CORE::splice' => '\\@;$$@',
          'CORE::unlink' => '@',
          'CORE::time' => '',
          'CORE::push' => '\\@@',
          'CORE::exit' => ';$',
          'CORE::endgrent' => '',
          'CORE::unshift' => '\\@@',
          'CORE::local' => undef,
          'CORE::my' => undef,
          'CORE::cos' => '_',
          'CORE::redo' => undef,
          'CORE::warn' => '@',
          'CORE::getsockname' => '*',
          'CORE::pipe' => '**',
          'CORE::sprintf' => '$@',
          'CORE::open' => '*;$@',
          'CORE::setpgrp' => ';$$',
          'CORE::exp' => '_',
          'CORE::seekdir' => '*$',
          'CORE::getservbyport' => '$$',
          'CORE::given' => undef,
          'CORE::pack' => '$@',
          'CORE::msgget' => '$$',
          'CORE::rindex' => '$$;$',
          'CORE::srand' => ';$',
          'CORE::telldir' => '*',
          'CORE::connect' => '*$',
          'CORE::getprotobyname' => '$',
          'CORE::msgsnd' => '$$$',
          'CORE::length' => '_',
          'CORE::state' => undef,
          'CORE::die' => '@',
          'CORE::delete' => undef,
          'CORE::getservent' => '',
          'CORE::getservbyname' => '$$',
          'CORE::setpriority' => '$$$',
          'CORE::lc' => '_',
          'CORE::fcntl' => '*$$',
          'CORE::chroot' => '_',
          'CORE::recv' => '*\\$$$',
          'CORE::dbmopen' => '\\%$$',
          'CORE::socketpair' => '**$$$',
          'CORE::vec' => '$$$',
          'CORE::system' => undef,
          'CORE::defined' => '_',    # original 'undef',
          'CORE::index' => '$$;$',
          'CORE::caller' => ';$',
          'CORE::close' => ';*',
          'CORE::atan2' => '$$',
          'CORE::semop' => '$$',
          'CORE::unpack' => '$;$',
          'CORE::ord' => '_',
          'CORE::chmod' => '@',
          'CORE::prototype' => undef,
          'CORE::getprotobynumber' => '$',
          'CORE::values' => '\\[@%]',
          'CORE::chomp' => undef,
          'CORE::ioctl' => '*$$',
          'CORE::eof' => ';*',
          'CORE::crypt' => '$$',
          'CORE::do' => undef,
          'CORE::flock' => '*$',
          'CORE::wait' => '',
          'CORE::sethostent' => '$',
          'CORE::return' => undef,
          'CORE::getsockopt' => '*$$',
          'CORE::fork' => '',
          'CORE::require' => undef,
          'CORE::format' => undef,
          'CORE::readpipe' => '_',
          'CORE::endhostent' => '',
          'CORE::getpgrp' => ';$',
          'CORE::setgrent' => '',
          'CORE::keys' => '\\[@%]',
          'CORE::glob' => undef,
          'CORE::getpriority' => '$$',
          'CORE::reset' => ';$',
          'CORE::sysopen' => '*$$;$',
          'CORE::continue' => '',
          'CORE::next' => undef,
          'CORE::getgrgid' => '$',
          'CORE::default' => undef,
          'CORE::shift' => ';\\@',
          'CORE::symlink' => '$$',
          'CORE::exists' => '$',      # original 'undef',
          'CORE::printf' => undef
        };
1;


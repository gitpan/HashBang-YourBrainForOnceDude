use Config;
use File::Basename qw(basename dirname);

chdir(dirname($0));
($file = basename($0)) =~ s/\.PERL$/\.pl/;

open OUT,">$file" or die "Can't create $file: $!";
chmod(0755, $file);
print "Extracting $file (with variable substitutions)\n";

print OUT <<"!GROK!THIS!", <<'!NO!SUBS!'; 
$Config{'startperl'} -w

!GROK!THIS!

use YourBrainForOnceDude;

open SOURCE, shift or die $!;
$_ = <SOURCE>;
$_ = '' if /^#!/;
{
    local $/;
    $_ .= <SOURCE>;
}

eval;
!NO!SUBS!

#vim :set ft=perl

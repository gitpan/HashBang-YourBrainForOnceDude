use ExtUtils::MakeMaker;

WriteMakefile(
    NAME => 'HashBang::YourBrainForOnceDude',
    VERSION => '0.10',
    PREREQ_PM => {hashbang => '0.10',
                  'YourBrainForOnceDude' => '0.11'
                 },
    PL_FILES => {'bin/yourbrainforoncedude.PERL' => 'bin/yourbrainforoncedude.pl'},
    EXE_FILES => ['bin/yourbrainforoncedude.pl'],
    clean => { FILES => 'config bin/yourbrainforoncedude.pl' },
);

sub MY::postamble {
    <<'END';
pure_install ::
	ln -fs ${INSTALLSCRIPT}/hashbang ${INSTALLSCRIPT}/yourbrainforoncedude
END
}

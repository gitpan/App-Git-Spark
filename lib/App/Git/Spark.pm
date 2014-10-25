package App::Git::Spark;
use utf8;

our $VERSION = '0.006'; # VERSION

# ABSTRACT: Plot your git commit history on the command line with sparklines

__END__

=pod

=encoding utf-8

=head1 NAME

App::Git::Spark - Plot your git commit history on the command line with sparklines

=head1 SYNOPSIS

    $ git spark --days 14 Stegosaurus
    Commits by Stegosaurus over the last 14 days
    total: 95   avg: 7   max: 23
    10 15 6 23 5 0 0 1 15 0 17 3 0 0
    ▄▅▂█▂▁▁▁▅▁▆▁▁▁

    $ git vspark --months 10 Triceratops
    Commits by Triceratops over the last 10 months
    total: 263   avg: 26   max: 72
     12 ██▋
     18 ███▉
     72 ███████████████▏
     56 ███████████▊
     16 ███▍
     28 █████▉
     12 ██▋
     19 ████
     19 ████
     11 ██▍

    $ git spark -h
    usage: git spark [-dhmoswy] [long options...] [AUTHOR]
            -o --hours      Commits from the last x hours
            -d --days       Commits from the last x days
            -w --weeks      Commits from the last x weeks
            -m --months     Commits from the last x months
            -y --years      Commits from the last x years
            -s --scale      Set the max value of the graph. Use this option to
                            compare this graph with other graphs.
            -h --help       Show this message

=head1 DESCRIPTION

Plot your git commit history on the commandline with sparklines and "vertical"
sparklines.  

=head1 COMPARING GRAPHS

Comparing graphs is often difficult because the scaling changes for different
data sets.  For example these two data series produce identical graphs despite
have very different data.

    $ spark 1 2 3 4 5
    ▁▂▄▆█
    $ spark 10 20 30 40 50
    ▁▂▄▆█

To solve this, you must put a max and a min in front of the data to get
consistent scaling.  For example:

    $ spark 50 1 1 2 3 4 5
    █▁▁▁▁▁▁
    $ spark 50 1 10 20 30 40 50
    █▁▂▃▅▆█

git-spark assumes the min is zero and users can pass in the max using
the --scale option.  (Note that git-spark chops off the max/min characters from
the output so this is all hidden behind the scenes.)

The --scale option is also relavent to git-vspark.

=head1 INSTALLATION

L<cpanm|https://metacpan.org/module/App::cpanminus> is the standard tool the
Perl community uses to download and install Perl libraries from the
L<CPAN|https://metacpan.org/>.  The following should get you up and running
quickly:

    curl -L http://cpanmin.us | perl - --sudo App::cpanminus
    cpanm App::Git::Spark

=head1 SEE ALSO

L<Term::Spark>

L<Term::Vspark>

=head1 AUTHOR

Eric Johnson <cpan at iijo dot nospamthanks dot org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Eric Johnson.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

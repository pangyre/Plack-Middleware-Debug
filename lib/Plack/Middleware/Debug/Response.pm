package Plack::Middleware::Debug::Response;
use 5.008;
use strict;
use warnings;
use parent qw(Plack::Middleware::Debug::Base);
our $VERSION = '0.13';

sub run {
    my($self, $env, $panel) = @_;

    return sub {
        my $res = shift;

        my @headers;
        Plack::Util::header_iter($res->[1], sub { push @headers, @_ });

        $panel->content(
            $self->render_list_pairs(
                [ 'Status code' => $res->[0], @headers ],
            ),
        );
    };
}

1;
__END__

=head1 NAME

Plack::Middleware::Debug::Response - Debug panel to inspect the response

=head1 SYNOPSIS

    Plack::Middleware::Debug::Response->new;

=head1 DESCRIPTION

=head1 METHODS

=over 4

=back

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit L<http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see L<http://search.cpan.org/dist/Plack-Middleware-Debug/>.

The development version lives at L<http://github.com/miyagawa/plack-middleware-debug/>.
Instead of sending patches, please fork this project using the standard git
and github infrastructure.

=head1 AUTHORS

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

Tatsuhiko Miyagawa, C<< <miyagawa@bulknews.net> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2009 by Marcel GrE<uuml>nauer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

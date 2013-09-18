package Dist::Zilla::Plugin::TextTabs;

use Moose;
use v5.10;
use Text::Tabs qw( expand unexpand );

# ABSTRACT: Expand or unexpand tabs in your dist
# VERSION

=head1 SYNOPSIS

 [TextTabs]
 tabstop   = 8
 unexapand = 0

=head1 DESCRIPTION

This L<Dist::Zilla> plugin expands or unexpands tabs using L<Text::Tab>.

=head1 ATTRIBUTES

=head2 tabstop

The length of the tabstop in characters.  This is usually 8, but some people prefer 4 or 2.

=head2 unexpand

if set to true, then an unexpand is used on all the targeted files, that is spaces of the
right length are converted into an equivalent number of tabs.  The default is false, or
expand mode.

=head1 SEE ALSO

L<Text::Tabs>

=cut

with 'Dist::Zilla::Role::FileMunger',
     'Dist::Zilla::Role::FileFinderUser' => {
       default_finders => [ ':InstallModules', ':ExecFiles' ],
     }
;

use namespace::autoclean;

has tabstop => (
  is      => 'ro',
  isa     => 'Int',
  default => 8,
);

has unexpand => (
  is      => 'ro',
  isa     => 'Bool',
  default => 0,
);

sub munge_files
{
  my($self) = @_;
  $self->munge_file($_) for @{ $self->found_files };
}

sub munge_file
{
  my($self, $file) = @_;
  local $Text::Tabs::tabstop = $self->tabstop;
  $file->content(join("\n", map { $self->unexpand ? unexpand $_ : expand $_ } split /\n/, $file->content));
  return;
}

__PACKAGE__->meta->make_immutable;

1;

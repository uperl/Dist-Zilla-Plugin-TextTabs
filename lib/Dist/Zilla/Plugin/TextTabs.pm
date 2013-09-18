package Dist::Zilla::Plugin::TextTabs;

use Moose;
use v5.10;
use Text::Tabs qw( expand unexpand $tabstop );

# ABSTRACT: Expand or unexpand tabs in your dist
# VERSION

with 'Dist::Zilla::Role::FileMunger',
     'Dist::Zilla::Role::FileFinderUser' => {
       default_finders => [ ':InstallModules', ':ExecFiles' ],
     }
;

use namespace::autoclean;

#has tabstop => (
#  is      => 'ro',
#  isa     => 'Int',
#  default => 8,
#);

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
  $file->content(join("\n", map { $self->unexpand ? unexpand $_ : expand $_ } split /\n/, $file->content));
  return;
}

__PACKAGE__->meta->make_immutable;

1;

# Dist::Zilla::Plugin::TextTabs

Expand or unexpand tabs in your dist

# SYNOPSIS

    [TextTabs]
    tabstop   = 8
    unexapand = 0

# DESCRIPTION

This [Dist::Zilla](http://search.cpan.org/perldoc?Dist::Zilla) plugin expands or unexpands tabs using [Text::Tab](http://search.cpan.org/perldoc?Text::Tab).

# ATTRIBUTES

## tabstop

The length of the tabstop in characters.  This is usually 8, but some people prefer 4 or 2.

## unexpand

if set to true, then an unexpand is used on all the targeted files, that is spaces of the
right length are converted into an equivalent number of tabs.  The default is false, or
expand mode.

# SEE ALSO

[Text::Tabs](http://search.cpan.org/perldoc?Text::Tabs)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

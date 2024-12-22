# Dist::Zilla::Plugin::TextTabs ![linux](https://github.com/plicease/Dist-Zilla-Plugin-TextTabs/workflows/linux/badge.svg) ![macos](https://github.com/plicease/Dist-Zilla-Plugin-TextTabs/workflows/macos/badge.svg) ![windows](https://github.com/plicease/Dist-Zilla-Plugin-TextTabs/workflows/windows/badge.svg) ![msys2-mingw](https://github.com/plicease/Dist-Zilla-Plugin-TextTabs/workflows/msys2-mingw/badge.svg)

Expand or unexpand tabs in your dist

# SYNOPSIS

```
[TextTabs]
tabstop   = 8
unexapand = 0
```

# DESCRIPTION

This [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla) plugin expands or unexpands tabs using [Text::Tab](https://metacpan.org/pod/Text::Tab).

# ATTRIBUTES

## tabstop

The length of the tabstop in characters.  This is usually 8, but some people prefer 4 or 2.

## unexpand

if set to true, then an unexpand is used on all the targeted files, that is spaces of the
right length are converted into an equivalent number of tabs.  The default is false, or
expand mode.

## installer

Instead of doing its work during the usual file munger stage, if this
attribute is true (the default is false), then this plugin will munge
just the `Makefile.PL` or `Build.PL` (or both if you have both) files
during the `InstallTool` phase.  This allows you to remove nauty
tabs from the installer than may have been put there by a nauty
`InstallTool` plugin (take care to put `[TextTabs]` in your `dist.ini`
after the nauty installer plugin).

# SEE ALSO

[Text::Tabs](https://metacpan.org/pod/Text::Tabs)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013-2024 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

#!/usr/bin/env perl
use v5.14;
use Pandoc::Filter;
use Pandoc::Elements;

my $header = Null;

# Div.notes | Header[level=2]
pandoc_filter sub {
    if ($_->name eq 'Div') {
        return [ $header, @{$_->content} ] if $_->class eq 'notes';
    } elsif ($_->name eq 'Header') {
        $header = $_ if $_->level == 2;
    }
    return [];
};

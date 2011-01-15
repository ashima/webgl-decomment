#!/usr/bin/perl

undef $/;
$_=<>;

sub l() { my($c)=@_; $c=~s/.*?$//mg ; return $c}
s,/\*(.*?)\*/," ".&l($1),sge; # "Those who cannot remember the past are..."
s,//.*?$,,mg;

print;


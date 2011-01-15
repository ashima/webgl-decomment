#!/usr/bin/perl

use Encode;

undef $/; 
$_=<>; 
Encode::from_to($_, "iso-8859-1", "utf16-BE"); 
print; 


#!/usr/bin/perl

use strict;
use warnings;

use POSIX;
use Test::More;

my @Data;
my $Index = 0;
while (<DATA>) {
    if ( $_ =~ m{\A\s*\z} ) {
        $Index++;
        next;
    }
    $Data[$Index] ||= '';
    $Data[$Index] .= $_;
};

my @Modules = split /\n/, $Data[0];

sub CalcFuel {
    my ($Mass, $Deep) = @_;

    my $Result = floor($Mass / 3) - 2;
    return 0 if $Result < 0;

    $Result += CalcFuel($Result, $Deep) if $Deep;

    return $Result;
};

my $FuelSum = 0;
for my $Module (@Modules) {
    $FuelSum += CalcFuel($Module);
}

is($FuelSum, 3363760, 'What is the sum of the fuel requirements for all of the modules on your spacecraft?');
is(CalcFuel(14, 1), 2, 'Test 1');
is(CalcFuel(1969, 1), 966, 'Test 2');
is(CalcFuel(100756, 1), 50346, 'Test 3');

$FuelSum = 0;
for my $Module (@Modules) {
    $FuelSum += CalcFuel($Module, 1);
}

is($FuelSum, 5042767, 'Part 2');

done_testing();

1;

__DATA__
77680
106826
120225
122031
100287
70402
145496
73956
148205
52065
149237
116195
84309
105327
134606
109489
104474
69536
141469
72321
75154
142565
57104
111925
100109
75178
115130
75586
148587
116029
113969
66072
90521
116324
137009
92880
110895
131046
83273
99576
70466
93602
63435
103569
56610
58392
95060
59101
121838
93494
52243
146982
142260
107232
117600
59715
80284
128223
123676
81060
99425
50621
101184
112136
131262
53150
113522
117802
120251
102322
111247
117719
88873
133541
92695
125445
149048
146928
83909
109466
94063
62338
124098
64769
104722
106612
53882
108847
92739
88496
89773
57471
140532
87308
137247
62816
118893
101446
149208
68267

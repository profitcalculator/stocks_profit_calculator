#!/usr/bin/perl


use strict;
use warnings;

# flush buffers
$| = 1;

use Data::Dumper 'Dumper';

# $$

my %mem;

#####################
##### functions #####
#####################
sub _read_file;
sub trim;              # left & right trim function


if ($#ARGV != 1) {
        print "\nusage: $0 <file.csv>   <AMOUNT>\n";
        print "        $0 data.csv     10000\n\n";
        exit;
}


my $file = $ARGV[0] || die;
my $investment = $ARGV[1];

my ( %st, %nu, %pr, %name, %maxx) = ();

######################
# load CSV in memory #
######################
open CSV, $file or die "[*] $0: ERROR: cannot open $file";
my @csv;
while (<CSV>) {
        chomp;
        next if /^\s*#/;               # ignore comments
        next if(m/^\s+$/ || m/^$/);    # ignore empty lines
        my @f = split /,/;

        # 'number' the ','
        my $count_commas = 0;
        $count_commas++ while ($_ =~ m/,/g);
        if ( $count_commas != 4 )
        {
                #warn "[*] $0: ERROR: invalid number of ',' , you need exactly 4\n";
                next;
        }

        my %hash;

        @hash{'ticker','percentage','current','max', 'name'} = @f;
        push @csv, \%hash;
}
close (CSV);

#print Dumper ( \@csv );

####################
# loop through CSV #
####################
for my $e (@csv) {
        my $ticker     = trim($e->{ticker});
        my $percentage = trim($e->{percentage});
        my $current    = trim($e->{current});
        my $max        = trim($e->{max});
        my $nm         = trim($e->{'name'});

	# Skip if current price < 5 $
	next if ( $current < 5 );

        my $stocks_number = int( $investment / $current );
	# round up number
	$stocks_number = sprintf "%.0f", $stocks_number;
	
        my $diff_price    = $max - $current;
	$diff_price       = sprintf "%.2f", $diff_price;

        my $profit        = $stocks_number * $diff_price;
	$profit = sprintf "%.0f", $profit;

	# print "$ticker,$current,$max,diff $diff_price,# $stocks_number,profit $profit\n";

        #$e->{profit}    = $profit;
        $mem{"$ticker"} = $profit;
        $nu{"$ticker"} = $stocks_number;
        $pr{"$ticker"} = $current;
        $name{"$ticker"} = $nm;

        $maxx{"$ticker"} = $max;


}

#print Dumper( \%mem );

print "\n\n";

#print "Stocks ordered by potential profit when investing $investment USD\n";

printf "%-8s %-6s        %-20s %s    %s   %s\n", "TICKER", "PRICE","# stocks", "Profit on $investment USD", "52_Week_high", "Company\n";

foreach my $name (reverse sort { $mem{$a} <=> $mem{$b} } keys %mem) {
	my $price = sprintf "%.2f", $pr{$name};
        printf "%-8s ( %-6s)        %-20s %s    (%s)    %s\n", $name, $price, $nu{$name}, $mem{$name}, $maxx{$name}, $name{$name};
}

# Reads en entire file for processing
sub _read_file
{
        my $filename = $_[0];
        #print "$filename\n";
        my $localcontent;
        open(my $fh, '<', $filename) or die "cannot open file $filename";
        {
                local $/;
                $localcontent = <$fh>;
        }
        close($fh);

        return $localcontent;
}

sub trim  {
        my $s = shift;
        $s =~ s/^\s+|\s+$//g;
        return $s;
};

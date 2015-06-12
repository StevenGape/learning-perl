#! perl -w
use strict;
# 额外附加题：写一个名为&above_average的子程序，当给定一个包含多个数字的列表时，返回其中大于这些数
# 平均值的数。（提示：另外写一个子程序，通过用这些数的总和除以列表中数字的个数来计算它们的平均值。）
# 当你写完后，用下面的程序检验一下。
my @fred = above_average(1..10);
print "\@fred is @fred\n";
print "(should be 6 7 8 9 10)\n";
my @barney = above_average(100, 1..10);
print "\@barney is @barney\n";
print "(should be just 100)\n";

sub above_average {
	my $sum = 0;
	my @arr;
	foreach my $arry(@_) {
		chomp(my $ary = $arry);
		$sum += $ary;
	}
	my $average = $sum / @_;
	foreach my $num(@_) {
		chomp(my $ar=$num);
		if ($num > $average) {
			push @arr, $num;
		}
	}
	return @arr;
}

#! perl -w
# 写一个程序，提示用户键入一个字符串及一个数字（分两行键入），然后以数字为重复次数，连续输出字符串（提
# 示：使用x操作符）。在用户键入“fred”和“3”时，应该会输出3行“fred”；如果用户键入的是“fred”于“299792”，
# 输出结果应该是一大堆。
print "input string:";
my $instr=<stdin>;
print "input num:";
my $innum=<stdin>;
print "output:";
while($innum>0){
	$innum-=1;
	print "$instr";
};

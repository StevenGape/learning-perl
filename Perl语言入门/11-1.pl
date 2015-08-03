#!perl -w
use strict;
use Module::CoreList;

# 从CPAN安装Module::CoreList模块。输出Perl5.14自带的所有模块的清单。请建立一个哈希，其键为指定
# Perl版本自带模块的名称，可以使用下面这行代码：
# my %modules = %{$Module::CoreList::version{5.014}};

my %modules = %{ $Module::CoreList::version{5.006} };
print join "\n", keys %modules;

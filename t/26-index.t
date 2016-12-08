#!perl

use Test::More;
use Cwd qw(abs_path);
use Git::Raw;

my $path = abs_path('t/test_repo');
my $repo = Git::Raw::Repository -> open($path);

# in memory
my $index = Git::Raw::Index -> new;
isa_ok $index, 'Git::Raw::Index';

my $index = $repo -> index;
$index -> clear;

$index -> add_frombuffer ('d.txt', 'content4');
$index -> add_frombuffer ('a/b.txt', 'content2');
$index -> add_frombuffer ('a.txt', 'content1');
$index -> add_frombuffer ('a/b/c.txt', 'content3');

my $tree = $index->write_tree;

my @entries = $tree -> entries;
is scalar(@entries), 3;

is $entries[0] -> name, 'a.txt';
is $entries[1] -> name, 'a';
is $entries[2] -> name, 'd.txt';

isa_ok $entries[0] -> object, 'Git::Raw::Blob';
isa_ok $entries[1] -> object, 'Git::Raw::Tree';
isa_ok $entries[2] -> object, 'Git::Raw::Blob';
is $entries[0] -> object -> content, 'content1';
is $entries[2] -> object -> content, 'content4';

my @entries2 = $entries[1] -> object -> entries;
is scalar(@entries2), 2;

is $entries2[0] -> name, 'b.txt';
is $entries2[1] -> name, 'b';
is $entries2[0] -> object -> content, 'content2';

my @entries3 = $entries2[1] -> object -> entries;
is scalar(@entries3), 1;

is $entries3[0] -> name, 'c.txt';
is $entries3[0] -> object -> content, 'content3';

done_testing;
#!/usr/bin/perl

use DBI;
use Data::Dump qw(dump);
use utf8;
use Encode;

binmode(STDIN, ':encoding(utf8)');
binmode(STDOUT, ':encoding(utf8)');
binmode(STDERR, ':encoding(utf8)');

#$ENV{'NLS_LANG'} = "SIMPLIFIED CHINESE_CHINA.UTF8";

$oracle= DBI->connect('dbi:Oracle:host=172.18.5.12;sid=orcl;port=1521', 'wycj_read/wycj23826888', '') or die("connect oracle failed"); 
$mysql= DBI->connect("DBI:mysql:database=wzmc;host=localhost", "root", "wo") or die("connect oracle failed");
$mysql->do("set names utf8");

$m_sql = $mysql->prepare("select * from byxys");
$m_sql->execute();
while($m_rows = $m_sql->fetchrow_hashref()){
    $sql = "select sbxm , xbdm ,xbmc , a.zydm as zydm, a.zymc as zymc1, b.zymc as zymc2, sfzh,byzsh,bjmc
       from xsjbxx a left join jybbymdb b on(a.xh=b.xh) left join byshb c on(b.xh=c.xh) 
       where b.xh=a.xh and b.xh=c.xh  and xh='$m_rows->{'xh'}'";
    $o_sql = $oracle->prepare($sql);
    $o_sql->execute();
    $o_rows = $o_sql->fetchrow_hashref();
    print $m_rows->{'xh'};
    print "  ";
    print $o_rows->{'SFZH'};
    print "\n";
    print $o_rows->{'ZYMC2'};
    $m2_sql = $mysql->do("update byxys set 
        sfzh='$o_rows->{'SFZH'}', 
        xbdm='$o_rows->{'XBDM'}',
        xb='$o_rows->{'XBMC'}',
        zydm='$o_rows->{'ZYDM'}',
        zymc='$o_rows->{'ZYMC2'}',
        zsbh='$o_rows->{'BYZSH'}',
        bjmc='$o_rows->{'BJMC'}'
        where xh='$m_rows->{xh}'");
}

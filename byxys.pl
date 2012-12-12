#!/usr/bin/perl


use DBI;
use Data::Dump qw(dump);

$oracle= DBI->connect('dbi:Oracle:host=172.18.5.12;sid=orcl;port=1521', 'wycj_read/wycj23826888', '') or die("connect oracle failed"); 
$mysql= DBI->connect("DBI:mysql:database=wzmc;host=localhost", "root", "wo") or die("connect oracle failed");
$mysql->do("set names utf8");



$m_sql = $mysql->prepare("select * from byxys");
$m_sql->execute();
while($m_rows = $m_sql->fetchrow_hashref()){
    $o_sql = $oracle->prepare("select * from xsjbxx where xh='$m_rows->{'xh'}'");
    $o_sql->execute();
    $o_rows = $o_sql->fetchrow_hashref();
    print $m_rows->{'xh'};
    print "  ";
    print $o_rows->{'ZJHM'};
    print "\n";
    $m2_sql = $mysql->do("update byxys set sfzh='$o_rows->{'ZJHM'}' where xh='$m_rows->{xh}'");
}


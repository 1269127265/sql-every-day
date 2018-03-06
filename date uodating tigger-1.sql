 create trigger ¸üĞÂuserID on jut117
     for insert
      as UPDATE a set a.createuser=c.F765 from JUT100 a,JUT117 b ,(select * from jut117 a 
where not exists
(select 1 from jut117 where F750=a.F750 and createtime>a.createtime)) C where a.F121=C.F750


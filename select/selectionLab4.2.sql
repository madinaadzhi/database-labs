create view FirstView (Patient, Birthday, CitizenCategory) as
select P.Name, P.Birthday, CC.Name
from Patient P
join CitizenCategory CC on P.CitizenCategoryID = CC.CitizenCategoryID;

select *
from FirstView;
drop view FirstView;
show create view FirstView;

create view SecondView as
    select * from FirstView;

alter view SecondView as
    select * from FirstView
    where Patient != 'Petro';

select * from SecondView;
drop view SecondView;
show create view SecondView;
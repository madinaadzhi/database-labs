set role all;
create role 'polyclinic_admin', 'polyclinic_user', 'polyclinic_microuser';

grant all on polyclinic.* to 'polyclinic_admin';
grant select on polyclinic.* to 'polyclinic_user';
grant select on polyclinic.Doctor to 'polyclinic_microuser';

create user 'polyclinicAdmin'@'localhost' identified by 'mysql2005';
create user 'polyclinicUser'@'localhost' identified by 'mysql2006';
create user 'polyclinicMicrouser'@'localhost' identified by 'mysql2007';

grant 'polyclinic_admin' to 'polyclinicAdmin'@'localhost';
grant 'polyclinic_user' to 'polyclinicUser'@'localhost';
grant 'polyclinic_microuser' to 'polyclinicMicrouser'@'localhost';

set default role 'polyclinic_admin' to 'polyclinicAdmin'@'localhost';
set default role 'polyclinic_user' to 'polyclinicUser'@'localhost';
set default role 'polyclinic_microuser' to 'polyclinicMicrouser'@'localhost';
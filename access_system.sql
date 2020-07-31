DROP TABLE IF EXISTS tbl_users;
DROP TABLE IF EXISTS tbl_groups;
DROP TABLE IF EXISTS tbl_doors;
DROP TABLE IF EXISTS tbl_access;
DROP TABLE IF EXISTS tbl_permission;


CREATE TABLE tbl_users (
    user_id integer,
    user_name varchar(50));
    
INSERT INTO tbl_users (user_id, user_name)
VALUES (1, 'Modesto'),
       (2, 'Ayine'),
       (3, 'Christopher'),
       (4, 'Cheong woo'),
       (5, 'Saulat'),
       (6, 'Heidy');
       
CREATE TABLE tbl_groups (
    group_id integer,
    group_name varchar(50));
    
INSERT INTO tbl_groups (group_id, group_name)
VALUES (1, 'IT'),
       (2, 'Sales'),
       (3, 'Admin'),
       (4, 'Operation');
       
CREATE TABLE tbl_doors(
    door_id integer,
    door_name varchar(50));
    
INSERT INTO tbl_doors (door_id, door_name)
VALUES (1, '101'),
       (2, '102'),
       (3, 'Audit A'),
       (4, 'Audit B');
       
CREATE TABLE tbl_permission(
    user_id integer,
    group_id integer,
    door_id integer);
    
INSERT INTO tbl_permission (user_id, group_id, door_id)
VALUES (1, 1, 1),
	   (1, 1, 2),
       (2, 1, 1),
       (2, 1, 2),
       (3, 2, 2),
       (3, 2, 3),
       (4, 2, 2),
       (4, 2, 3),
       (5, 3, NULL),
       (6, NULL, NULL);
       

SELECT tbl_groups.group_name AS 'Groups', tbl_users.user_name AS 'Users' 
FROM tbl_permission
INNER JOIN tbl_users ON tbl_permission.user_id = tbl_users.user_id
RIGHT JOIN tbl_groups ON tbl_permission.group_id = tbl_groups.group_id
group BY group_name, user_name ;

SELECT tbl_doors.door_name AS 'Rooms', tbl_groups.group_name AS 'Groups' 
FROM tbl_permission
RIGHT JOIN tbl_doors ON tbl_permission.door_id = tbl_doors.door_id
LEFT JOIN tbl_groups ON tbl_permission.group_id = tbl_groups.group_id
group BY door_name, group_name;

SELECT tbl_users.user_name AS 'User Name', tbl_groups.group_name AS 'Group Name', tbl_doors.door_name AS 'Room'
FROM tbl_permission
LEFT JOIN tbl_users ON tbl_permission.user_id = tbl_users.user_id
LEFT JOIN tbl_groups ON tbl_permission.group_id = tbl_groups.group_id
LEFT JOIN tbl_doors ON tbl_permission.door_id = tbl_doors.door_id
ORDER BY user_name ASC;



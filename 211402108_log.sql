MariaDB [(none)]> use task_manager.sql
ERROR 1049 (42000): Unknown database 'task_manager.sql'
MariaDB [(none)]> use task_manager
Database changed
MariaDB [task_manager]> SELECT 
    -> a.id, a.task_name, b.task_status, b.task_comments, d.category_name as 'Category',
    -> DATEDIFF(a.task_duration_end, a.task_duration_start) as 'Lama Pengerjaan',
    -> c.name as 'Create By', (SELECT name from users where users.id = task_dailies.user_verify_id ) as 'Verified By'
    -> FROM task_plans a
    -> RIGHT JOIN task_dailies b ON a.id = b.plan_id
    -> INNER JOIN users c ON b.id = c.id
    -> RIGHT JOIN task_categories d ON a.category_id = d.id
    -> ;
ERROR 1054 (42S22): Unknown column 'a.task_duration_start' in 'field list'
MariaDB [task_manager]> SELECT 
    -> a.id, a.task_name, b.task_status, b.task_comments, d.category_name as 'Category',
    -> DATEDIFF(a.task_duration_end, a.task_duration_start) as 'Lama Pengerjaan',
    -> c.name as 'Create By', (SELECT name from users where users.id = task_dailies.user_verify_id ) as 'Verified By'
    -> FROM task_plans a
    -> RIGHT JOIN task_dailies b ON a.id = b.plan_id
    -> INNER JOIN users c ON b.id = c.id
    -> RIGHT JOIN task_categories d ON a.category_id = d.id
    -> ;
ERROR 1054 (42S22): Unknown column 'a.task_duration_start' in 'field list'
MariaDB [task_manager]> SELECT 
    -> task_plans.id, task_plans.task_name, task_plans.task_status, task_dailies.task_comments, task_categories.category_name as 'Teknikal',
    -> DATEDIFF(task_plans.task_duration_end, task_plans.task_duration_start) as 'Lama Pengerjaan',
    -> users.name as 'Create By', (SELECT name from users where users.id = task_dailies.user_verify_id ) as 'Verified By'
    -> FROM task_plans WHERE
    -> RIGHT JOIN task_dailies task_comments ON task_plans.id = task_dailies.id
    -> INNER JOIN users name ON task_plans.id = users.id
    -> RIGHT JOIN task_categories category_name ON task_plans.category_id = task_categories.id
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'JOIN task_dailies task_comments ON task_plans.id = task_dailies.id
INNER JOIN...' at line 6
MariaDB [task_manager]> 
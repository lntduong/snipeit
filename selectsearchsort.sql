(
select
   `contracts`.*, `companies`.`name` as `companies`, `stores`.`name` as `stores`, `departments`.`name` as `departments`, `locations`.`name` as `locations`, `contact_1`.`first_name` as `users_1`, `contact_2`.`first_name` as `users_2` 
from
   `contracts` 
inner join
      `departments` 
      on `departments`.`id` = 
      (
         CASE
            WHEN
               contracts.object_type = "App\\Models\\Department" 
            THEN
               contracts.object_id 
            ELSE
               null 
         END
      )
   inner join
      `stores` 
      on `stores`.`id` = `departments`.`store_id` 
   inner join
      `companies` 
      on `companies`.`id` = `stores`.`company_id` 
   left join
      `locations` 
      on `locations`.`id` = `contracts`.`location_id` 
   left join
      `users` as `contact_1` 
      on `contact_1`.`id` = `contracts`.`contact_id_1` 
   left join
      `users` as `contact_2` 
      on `contact_2`.`id` = `contracts`.`contact_id_2` 
where  `companies`.`id` = 2  and
   (`contracts`.`deleted_at` is null 
   and `companies`.`name` LIKE '%Store 1 1%' 
   or `contracts`.`name` LIKE '%Store 1 1%' 
   and `contracts`.`deleted_at` is null 
   or `stores`.`name` LIKE '%Store 1 1%' 
   and `contracts`.`deleted_at` is null 
   or `departments`.`name` LIKE '%Store 1 1%' 
   and `contracts`.`deleted_at` is null 
   or `locations`.`name` LIKE '%Store 1 1%' 
   or `contact_1`.`first_name` LIKE '%Store 1 1%' 
   or `contact_1`.`last_name` LIKE '%Store 1 1%' 
   or `contact_1`.`username` LIKE '%Store 1 1%' 
   or CONCAT(contact_1.first_name, " ", contact_1.last_name) LIKE '%Store 1 1%' 
   or `contact_2`.`first_name` LIKE '%Store 1 1%' 
   or `contact_2`.`last_name` LIKE '%Store 1 1%' 
   or `contact_2`.`username` LIKE '%Store 1 1%' 
   or CONCAT(contact_2.first_name, " ", contact_2.last_name) LIKE '%Store 1 1%' 
   or `contracts`.`start_date` LIKE '%Store 1 1%' 
   or `contracts`.`end_date` LIKE '%Store 1 1%' 
   or `contracts`.`billing_date` LIKE '%Store 1 1%' 
   or `contracts`.`payment_date` LIKE '%Store 1 1%'
   )
   and `contracts`.`deleted_at` is null) 
union
(
select
   `contracts`.*, `companies`.`name` as `companies`, `stores`.`name` as `stores`, null as departments, `locations`.`name` as `locations`, `contact_1`.`first_name` as `users_1`, `contact_2`.`first_name` as `users_2` 
from
   `contracts` 
inner join
      `stores` 
      on `stores`.`id` = 
      (
         CASE
            WHEN
               contracts.object_type = "App\\Models\\Store" 
            THEN
               contracts.object_id 
            ELSE
               null 
         END
      )
   inner join
      `companies` 
      on `companies`.`id` = `stores`.`company_id` 
   left join
      `locations` 
      on `locations`.`id` = `contracts`.`location_id` 
   left join
      `users` as `contact_1` 
      on `contact_1`.`id` = `contracts`.`contact_id_1` 
   left join
      `users` as `contact_2` 
      on `contact_2`.`id` = `contracts`.`contact_id_2`
      where  `companies`.`id` = 2  and
   (`contracts`.`deleted_at` is null 
   and `companies`.`name` LIKE '%Store 1 1%' 
   or `contracts`.`name` LIKE '%Store 1 1%' 
   and `contracts`.`deleted_at` is null 
   or `stores`.`name` LIKE '%Store 1 1%' 
   and `contracts`.`deleted_at` is null 
   and `contracts`.`deleted_at` is null 
   or `locations`.`name` LIKE '%Store 1 1%' 
   or `contact_1`.`first_name` LIKE '%Store 1 1%' 
   or `contact_1`.`last_name` LIKE '%Store 1 1%' 
   or `contact_1`.`username` LIKE '%Store 1 1%' 
   or CONCAT(contact_1.first_name, " ", contact_1.last_name) LIKE '%Store 1 1%' 
   or `contact_2`.`first_name` LIKE '%Store 1 1%' 
   or `contact_2`.`last_name` LIKE '%Store 1 1%' 
   or `contact_2`.`username` LIKE '%Store 1 1%' 
   or CONCAT(contact_2.first_name, " ", contact_2.last_name) LIKE '%Store 1 1%' 
   or `contracts`.`start_date` LIKE '%Store 1 1%' 
   or `contracts`.`end_date` LIKE '%Store 1 1%' 
   or `contracts`.`billing_date` LIKE '%Store 1 1%' 
   or `contracts`.`payment_date` LIKE '%Store 1 1%'
   )
   and `contracts`.`deleted_at` is null)

union
(
select
   `contracts`.*, `companies`.`name` as `companies`, null as stores, null as departments, `locations`.`name` as `locations`, `contact_1`.`first_name` as `users_1`, `contact_2`.`first_name` as `users_2` 
from
   `contracts` 
   inner join
      `companies` 
      on `companies`.`id` = 
      (
         CASE
            WHEN
               contracts.object_type = "App\\Models\\Company"
            THEN
               contracts.object_id 
            ELSE
               null 
         END
      )
   left join
      `locations` 
      on `locations`.`id` = `contracts`.`location_id` 
   left join
      `users` as `contact_1` 
      on `contact_1`.`id` = `contracts`.`contact_id_1` 
   left join
      `users` as `contact_2` 
      on `contact_2`.`id` = `contracts`.`contact_id_2` 
       where  `companies`.`id` = 2  and
 (
      `contracts`.`deleted_at` is null 
      and `companies`.`name` LIKE '%Store 1 1%'
      and `contracts`.`deleted_at` is null 
      or `contracts`.`name` LIKE '%Store 1 1%'
      or `locations`.`name` LIKE '%Store 1 1%'
      or `contact_1`.`first_name` LIKE '%Store 1 1%'
      or `contact_1`.`last_name` LIKE '%Store 1 1%'
      or `contact_1`.`username` LIKE '%Store 1 1%'
      or CONCAT(contact_1.first_name, " ", contact_1.last_name) LIKE '%Store 1 1%'
      or `contact_2`.`first_name` LIKE '%Store 1 1%'
      or `contact_2`.`last_name` LIKE '%Store 1 1%'
      or `contact_2`.`username` LIKE '%Store 1 1%'
      or CONCAT(contact_2.first_name, " ", contact_2.last_name) LIKE '%Store 1 1%' 
      or `contracts`.`start_date` LIKE '%Store 1 1%'
      or `contracts`.`end_date` LIKE '%Store 1 1%'
      or `contracts`.`billing_date` LIKE '%Store 1 1%'
      or `contracts`.`payment_date` LIKE '%Store 1 1%'
   )
   and `contracts`.`deleted_at` is null) 
order by
   `locations` asc limit 10 offset 0
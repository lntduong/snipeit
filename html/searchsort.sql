select contracts.*, 
       companies.name      as company, 
       null                as stores, 
       null                as departments, 
       locations.name      as location, 
       contact_1.last_name as user1, 
       contact_2.last_name as user2 
from   contracts 
       left join companies 
              on companies.id = ( CASE 
                                    WHEN contracts.object_type = 
                                         "App\\Models\\Company" 
                                  THEN 
                                    contracts.object_id 
                                    ELSE null 
                                  END ) 
       left join locations 
              on locations.id = contracts.location_id 
       left join users as contact_1 
              on contact_1.id = contracts.contact_id_1 
       left join users as contact_2 
              on contact_2.id = contracts.contact_id_2 
where  contracts.deleted_at is null 
       and companies.name like '%hickle%' 
       and contracts.deleted_at is null 
        or contracts.name like '%hickle%' 
        or locations.name like '%hickle%' 
        or contact_1.last_name like '%hickle%' 
        or contact_1.first_name like '%hickle%' 
        or contact_1.username like '%hickle%' 
        or contact_2.last_name like '%hickle%' 
        or contact_2.first_name like '%hickle%' 
        or contact_2.username like '%hickle%' 
union 
select contracts.*, 
       companies.name      as company, 
       stores.name         as stores, 
       null                as departments, 
       locations.name      as location, 
       contact_1.last_name as user1, 
       contact_2.last_name as user2 
from   contracts 
       left join stores 
              on stores.id = ( CASE 
                                 WHEN contracts.object_type = 
                                      "App\\Models\\Store" THEN 
                                 contracts.object_id 
                                 ELSE null 
                               END ) 
       left join companies 
              on companies.id = stores.company_id 
       left join locations 
              on locations.id = contracts.location_id 
       left join users as contact_1 
              on contact_1.id = contracts.contact_id_1 
       left join users as contact_2 
              on contact_2.id = contracts.contact_id_2 
where  contracts.deleted_at is null 
       and companies.name like '%hickle%' 
        or contracts.name like '%hickle%' 
        or stores.name like '%hickle%' 
           and contracts.deleted_at is null 
        or locations.name like '%hickle%' 
        or contact_1.last_name like '%hickle%' 
        or contact_1.first_name like '%hickle%' 
        or contact_1.username like '%hickle%' 
        or contact_2.last_name like '%hickle%' 
        or contact_2.first_name like '%hickle%' 
        or contact_2.username like '%hickle%' 
union 
select contracts.*, 
       companies.name      as company, 
       stores.name         as stores, 
       departments.name    as departments, 
       locations.name      as location, 
       contact_1.last_name as user1, 
       contact_2.last_name as user2 
from   contracts 
       left join departments 
              on departments.id = ( CASE 
                                      WHEN 
                 contracts.object_type = "App\\Models\\Store" 
                                    THEN 
                                      contracts.object_id 
                                      ELSE null 
                                    END ) 
       left join stores 
              on stores.id = departments.store_id 
       left join companies 
              on companies.id = stores.company_id 
       left join locations 
              on locations.id = contracts.location_id 
       left join users as contact_1 
              on contact_1.id = contracts.contact_id_1 
       left join users as contact_2 
              on contact_2.id = contracts.contact_id_2 
where  contracts.deleted_at is null 
       and companies.name like '%hickle%' 
        or contracts.name like '%hickle%' 
        or stores.name like '%hickle%' 
           and contracts.deleted_at is null 
        or departments.name like '%hickle%' 
           and contracts.deleted_at is null 
        or locations.name like '%hickle%' 
        or contact_1.last_name like '%hickle%' 
        or contact_1.first_name like '%hickle%' 
        or contact_1.username like '%hickle%' 
        or contact_2.last_name like '%hickle%' 
        or contact_2.first_name like '%hickle%' 
        or contact_2.username like '%hickle%' 
order  by start_date asc 
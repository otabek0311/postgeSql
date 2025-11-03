-- create database cars;
-- \c cars;

-- create table users(
--     id serial primary key,
--     name varchar not null,
--      email varchar unique not null
-- );

-- create table customers(
--     id serial primary key,
--     name varchar not null,
--     users_id int not null,
--     constraint fk_users_id foreign key (users_id) references users(id) 
-- );

-- create table category(
--     id serial primary key,
--     name varchar not null,
--     users_id int not null,
--     constraint fk_users_id foreign key (users_id) references users(id) 
-- );

-- create table cars(
--     id serial primary key,
--     model varchar not null,
--     users_id int not null,
--     category_id int not null,
--     customers_id int not null,
--     constraint fk_categry_id foreign key (customers_id) references customers(id),
--     constraint fk_categry_id foreign key (category_id) references category(id),
--     constraint fk_users_id foreign key (users_id) references users(id) 
-- );

-- create table details(
--     id serial primary key,
--     detail varchar not null
--     cars_id int not null,
--     constraint fk_cars_id foreign key (cars_id) references cars(id) 
-- )

-- create table orders(
--     id serial primary key,
--     customers_id int not null,
--     cars_id int not null,
--     category_id int not null,
--     quantity int not null,
--     constraint fk_customers_id foreign key (customers_id) references customers(id),
--     constraint fk_customers_id foreign key (cars_id) references cars(id),
--     constraint fk_categry_id foreign key (category_id) references category(id)

-- );







-- create or replace function talaba_yoshi_hisoblash()
-- returns table(id int, ism varchar, tugilgan_sana date, yosh int)
-- as $$
-- begin
--     return query
--     select id, name, birth_date, extract(year from age(current_date, birth_date))::int as yosh
--     from students;
-- end;
-- $$ language plpgsql;

-- create or replace procedure talabalarni_kursga_royxatga_qoshish(in kurs_id int, in talaba_ids int[])
-- as $$
-- begin
--     insert into enrollments(student_id, course_id, enrolled_at)
--     select unnest(talaba_ids), kurs_id, current_date;
-- end;
-- $$ language plpgsql;

-- create or replace function trigger_baho_ozgarganda_xabar()
-- returns trigger as $$
-- begin
--     if new.grade < old.grade then
--         insert into notifications(message)
--         values ('sizning baho pastlashdi');
--     end if;
--     return new;
-- end;
-- $$ language plpgsql;

-- drop trigger if exists trg_baho_ozgarganda_xabar on enrollments;

-- create trigger trg_baho_ozgarganda_xabar
-- after update on enrollments
-- for each row
-- execute function trigger_baho_ozgarganda_xabar();

-- create or replace function talaba_bahosi_hisoblash(talaba_id int, kurs_id int)
-- returns numeric
-- as $$
-- declare
--     o_baho numeric;
-- begin
--     select avg(grade) into o_baho
--     from enrollments
--     where student_id = talaba_id and course_id = kurs_id;
--     return o_baho;
-- end;
-- $$ language plpgsql;

-- create or replace function trigger_kursga_qayta_royxatga_tekshirish()
-- returns trigger as $$
-- begin
--     if exists (
--         select 1 from enrollments
--         where student_id = new.student_id and course_id = new.course_id
--     ) then
--         raise exception 'talaba bu kursga allaqachon royxatdan o‘tgan';
--     end if;
--     return new;
-- end;
-- $$ language plpgsql;

-- drop trigger if exists trg_kursga_qayta_royxatga_tekshirish on enrollments;

-- create trigger trg_kursga_qayta_royxatga_tekshirish
-- before insert on enrollments
-- for each row
-- execute function trigger_kursga_qayta_royxatga_tekshirish();








-- create or replace function kursdagi_eng_yaxshi_talaba_topish(kurs_id int)
-- returns table(ism varchar, baho int, yozilgan_sana date)
-- as $$
-- begin
--     return query
--     select s.name, e.grade, e.enrolled_at
--     from enrollments e
--     join students s on e.student_id = s.id
--     where e.course_id = kurs_id
--     order by e.grade desc, e.enrolled_at asc
--     limit 1;
-- end;
-- $$ language plpgsql;

-- create or replace procedure kursga_royxatdan_otgan_talabalar_soni(in kurs_id int, out soni int)
-- as $$
-- begin
--     select count(*) into soni
--     from enrollments
--     where course_id = kurs_id;
-- end;
-- $$ language plpgsql;

-- create or replace function trigger_royxatga_qoshilganda_xabar()
-- returns trigger as $$
-- begin
--     insert into notifications(message)
--     values ('sizning ro‘yxatdan o‘tishingiz muvaffaqiyatli amalga oshdi');
--     return new;
-- end;
-- $$ language plpgsql;

-- drop trigger if exists trg_royxatga_qoshilganda_xabar on enrollments;

-- create trigger trg_royxatga_qoshilganda_xabar
-- after insert on enrollments
-- for each row
-- execute function
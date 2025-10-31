-- create database users;
-- \c users;

-- create table users(
--     id serial primary key,
--     name varchar not null,
--     email varchar unique not null,
-- );
 
-- --  insert into users (name ,email ,user_id ) values( 'ali','ali@gmail.com', 1)

-- create table category (
--  id serial primary key 
--  name varchar not null 
--  user_id int not null
--  constraint fk_user foreign key (user_id) references user(id)
-- );

-- create table product (
--     id serial primary key,
--     name varchar not null,
--     price int not null,
--     user_id int not null
--     constraint fk_user foreign key (user_id) references user(id)
--     category_id int not null,
--     constraint fk_category_id foreign key (category_id) references category(id),
-- );

-- create table client{
--     id serial primary key,
--     name varchar not null,
-- }

-- create table order(
--     id serial primary key ,
--     client_id int not null,
--     constraint fk_client_id foreign key (client_id) references client(id),
--     product_id int not null,
--     constraint fk_product_id foreign key (product_id) references product(id),
--     count int not null
-- );

-- 1-shart

create database client;
\c client ;

create table customer(
    id serial primary key,
    name varchar not null,
    phone varchar not null
);

create table product(
    id serial primary key,
    name varchar not null,
    price int not null
);

create table orders(
    id serial primary key,
    customer_id int not null,
    product_id int not null,
    quantity int not null,
    constraint fk_customer_id foreign key (customer_id) references customer (id),
    constraint fk_product_id foreign key (product_id) references product (id)
);

insert into customer (name, phone) values
('Ali', '998901234567'),
('Vali', '998902345678'),
('Gulbahor', '998903456789'),
('Dilshod', '998904567890'),
('Malika', '998905678901');


insert into product (name, price) values
('Olma', 5000),
('Banan', 8000),
('Uzum', 12000),
('Anor', 10000),
('Nok', 7000);


insert into orders (customer_id, product_id, quantity) values
(1, 2, 3),
(2, 1, 5),
(3, 3, 2),
(4, 5, 1),
(5, 4, 4);

select c.name, c.phone, o.id AS order_id, o.quantity
from customer c
join orders o ON c.id = o.customer_id;

select o.id AS order_id, c.name AS customer, p.name AS product, o.quantity
from orders o
join customer c ON o.customer_id = c.id
join product p ON o.product_id = p.id;

select p.*
from product p
LEFT join orders o ON p.id = o.product_id
WHERE o.id IS NULL;

select *
from customer c
full join orders o ON c.id = o.customer_id;



-- 2-shart

create table students (
    id serial primary key,
    name varchar not null
);

create table courses (
    id serial primary key,
    name varchar not null
);

create table enrollments (
    id serial primary key,
    student_id int not null,
    course_id int not null,
   constraint fk_student foreign key (student_id) references students(id),
   constraint fk_course foreign key (course_id) references courses(id)
);

insert into students (name) values
('Ali'),
('Vali'),
('Gulbahor'),
('Dilshod'),
('Malika');

insert into courses (name) values
('Matematika'),
('Fizika'),
('Ingliz tili'),
('Tarix'),
('Dasturlash');

insert into enrollments (student_id, course_id) values
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 4),
(4, 2),
(5, 5);

select s.name as student, c.name as course
from students s
join enrollments e on s.id = e.student_id
join courses c on e.course_id = c.id;

select s.name as student, c.name as course
from students s
full join enrollments e on s.id = e.student_id
full join courses c on e.course_id = c.id;
-- Create the database and switch to it
CREATE DATABASE all_in_small;
USE all_in_small;
-- Create the roles table
CREATE TABLE roles(
    id int NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    role_name varchar(50)
);
-- Insert  sample roles
INSERT INTO roles( role_name)
VALUES 
('Owner'),
('Manager'),
('Staff');
-- Create the permission table
CREATE TABLE permissions(
    id int NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    permission_name varchar(50)
);
-- Insert sample permissions
INSERT INTO permissions( permission_name)
VALUES 
     -- ENUM?
('Create'),
('Delete'),
('Add'),
('Edit'),
('View'),
('Control')
;
-- Create the permission-role table
CREATE TABLE permission_role(
role_id int,
permission_id int,
PRIMARY KEY(role_id,permission_id),
FOREIGN KEY(role_id) REFERENCES roles(id),
FOREIGN KEY(permission_id) REFERENCES permissions(id)
);
-- Insert sample permission_role
INSERT INTO permission_role(role_id, permission_id)
VALUES
(1,6),
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(2,3),
(2,4),
(2,5),
(3,3),
(3,5);
-- Create the users table with foreign key reference to roles
CREATE TABLE users(
    id int  NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    role_id int,
    username varchar(50) NOT NULL UNIQUE,
    password varchar(50) NOT NULL,
    first_name varchar(50),
    last_name varchar(50) NOT NULL,
    mobile varchar(20),
    email varchar(50),
    FOREIGN KEY(role_id) REFERENCES roles(id)
);
-- Insert  sample users
INSERT INTO users( role_id, username, password, first_name, last_name, mobile, email)
VALUES
(1,"thaolo","11","thao","nguyen","11223344","thao@ais.com.au"),
(2,"thuyng","22","thuy","nguyen","22334455","thuy@ais.com.au"),
(1,"trang08","33","trang","bohner","33445566","trang@ais.com.au"),
(3,"staff1","44","david","beckham","44556677","david@aisstaff.com.au");

-- Create the orders table
CREATE TABLE orders(
    id int NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    user_id int,
    status enum("placed","completed","ready"),
    date timestamp,
    total_price decimal(10,2),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

-- Insert sample orders
INSERT INTO orders(user_id,status,date,total_price)
VALUES
(2,"placed","2024-01-23",100.00),
(3,"completed","2024-01-23",64.00),
(2,"placed","2024-01-23",150.00),
(3,"completed","2024-01-23",54.00);

-- Create the categories table  
CREATE TABLE categories(
    id int NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    name varchar(20) 
);

-- Insert sample categories
INSERT INTO categories(name)
VALUES
("food"),
("drink");
-- Create the products table
CREATE TABLE products(
    id int NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    category_id int,
    name varchar(50),
    price decimal(10,2),
    FOREIGN KEY(category_id) REFERENCES categories(id)
); 
-- Insert sample products
INSERT INTO products(category_id,name,price)
VALUES
(1,"banh my chao",22),
(1,"nem chua ran",30),
(1,"nom bo kho",15),
(1,"coc dam ot",10),
(1,"bun bo hue",25),
(2,"nuoc mia",5),
(2,"nuoc dua",7),
(2,"che tac",8),
(2,"sua dau",9),
(2,"sua ngo",10);

-- Create the table order details
CREATE TABLE order_details(
    order_id int,
    product_id int,
    quantity int,
    price int,
    PRIMARY KEY(order_id,product_id),
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(product_id) REFERENCES products(id)
);

-- Insert sample order details
INSERT INTO order_details(order_id,product_id,quantity,price)
VALUES
(1,4,5,0),
(1,10,5,0),
(2,1,2,0),
(2,10,2,0),
(3,2,5,0),
(4,8,3,0),
(4,3,2,0);



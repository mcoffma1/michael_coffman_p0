CREATE USER project0_user
WITH password 'project0password';

grant all privileges
on database postgres
to project0_user;

-- Create Tables for user_roles, app_users, and accounts

CREATE TABLE user_roles(
	id serial,
	name varchar(25) NOT NULL,
	
	CONSTRAINT user_roles_pk
	PRIMARY KEY (id)
);

create table app_users(
	id serial,
	first_name varchar(25) NOT NULL,
	last_name varchar(25) NOT NULL,
	username varchar(25) NOT NULL,
	PASSWORD varchar(25) NOT NULL,
	email varchar(256) NOT NULL,
	role_id int NOT NULL,
	
	constraint app_users_pk 
	primary key (id),
	
	CONSTRAINT user_roles_fk
	FOREIGN KEY (role_id) 
	REFERENCES user_roles
);

CREATE TABLE accounts(
	id serial,
	name varchar(25) NOT NULL,
	amount NUMERIC(15, 2) DEFAULT 0.00 NOT NULL,
	user_id int NOT NULL,
	
	CONSTRAINT accounts_pk
	PRIMARY KEY (id),
	
	CONSTRAINT app_user_fk
	FOREIGN KEY (user_id) 
	REFERENCES app_users(id)
);

-- Insert constant roles into user_roles
INSERT INTO user_roles (name)
VALUES 
	('Basic User'), ('Admin'), ('LOCKED');

SELECT * FROM user_roles;
SELECT * FROM app_users;
SELECT * FROM accounts;

INSERT INTO app_users (first_name, last_name, username, PASSWORD, email, role_id)
VALUES 
	('Michael', 'Coffman', 'mcoffma04', 'password', 'mcoffma@revature.net', 2);

INSERT INTO accounts (name, amount, user_id)
VALUES 
	('Checking', 100.00, 1);


SELECT * 
FROM app_users
JOIN accounts
WHERE user_id = id;



#Library Management System You are going to build a project based on Library Management System. 

#Create a database named library and following TABLES in the database: 1. Branch 2. Employee 3. Books 4. Customer 5. IssueStatus 6. ReturnStatus Attributes for the tables: 

create database Library;
use Library;

-- 1. Branch Branch_no - Set as PRIMARY KEY Manager_Id Branch_address Contact_no
	create table Branch(branch_no int primary key,manager_id int,branch_address varchar(20),contact_no bigint);
	desc Branch;
   
	INSERT INTO Branch (branch_no, manager_id, branch_address,contact_no) VALUES
	(1,1001, 'Central Branch',6845123322),
	(2,1002, 'West Branch',7095123018),
	(3,1003, 'East Branch',9865101377),
	(4,1004, 'South Branch',8864790124),  
	(5,1005, 'North Branch',8965432877);

	select * from Branch;
   
-- 2. Employee Emp_Id – Set as PRIMARY KEY Emp_name Position Salary Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch table 
	create table Employee(
    emp_id int primary key,
    emp_name varchar(20),
    position varchar(20),
    salary int,
    branch_no int,
	foreign key(branch_no) references Branch(branch_no));
    
    desc Employee;
    
	INSERT INTO Employee (emp_id, emp_name, position, salary, branch_no) VALUES
	(201, 'Diya', 'Manager', 75000, 1),
	(202, 'Root', 'Assistant', 45000, 2),
	(203, 'Rohit', 'Clerk', 35000, 3),
	(204, 'Maya', 'Manager', 78000, 4),
	(205, 'Unni', 'Librarian', 50000, 5),
	(206, 'Diya', 'Clerk', 25000, 1),
	(207, 'Root', 'Manager', 45000, 2),
	(208, 'Rohit', 'Librarian', 35000, 3),
	(209, 'Maya', 'Librarian', 30000, 4),
	(210, 'Unni', 'Manager', 50000, 5),
	(211, 'Rahul', 'Assistant', 20000, 1),
	(212, 'Aswanth', 'Librarian', 35000, 2),
    (213, 'Jaya', 'Cleaner', 15000, 1),
	(214, 'Ravi', 'Driver', 18000, 1),
	(215, 'Rohit', 'Cleaner', 35000, 2),
    (216, 'Amal', 'Assistant Manager', 30000, 1);
    

	select * from Employee;

-- 3. Books ISBN - Set as PRIMARY KEY Book_title Category Rental_Price Status [Give yes if book available and no if book not available] Author Publisher
	create table Books(
    ISBN int primary key,
    book_title varchar(100),
    category varchar(25),
    rental_price decimal(10,2),
    status enum('yes','no') not null,
    author varchar(100),
    publisher varchar(100));     
    
    desc Books;
    
	INSERT INTO Books (ISBN, book_title, category, rental_price, status, author, publisher) VALUES
	(978005, 'History of India', 'History', 8.00, 'yes', 'Romila Thapar', 'Penguin Books'),
    (978006, 'Rich Dad Poor Dad', 'Finance', 7.99, 'yes', 'Robert Kiyosaki', 'Warner Books'),
	(978007, 'Atomic Habits', 'Self-Help', 8.50, 'yes', 'James Clear', 'Penguin Random House'),
	(978008, 'The Psychology of Money', 'Finance', 9.25, 'yes', 'Morgan Housel', 'Harriman House'),
	(978009, 'Python Programming', 'Technology', 10.99, 'yes', 'Guido van Rossum', 'O’Reilly Media'),
	(978010, 'RAM C/O ANANDHI', 'Fiction', 6.75, 'yes', 'Manoj Kumar', 'Penguin Books');

	select * from Books;
    
-- 4. Customer Customer_Id - Set as PRIMARY KEY Customer_name Customer_address Reg_date 
	create table Customer(
    c_id int primary key,
    c_name varchar(25),
    c_address varchar(25),
    reg_date date);
    
    desc Customer;
    
    INSERT INTO Customer (c_id, c_name, c_address, reg_date) VALUES
	(300, 'Akhil', 'Kozhikode', '2021-01-15'),
    (301, 'Jithin', 'Kochi', '2021-08-05'),
	(302, 'Sarah', 'Kollam', '2021-11-21'),
	(303, 'Michael', 'Kochi', '2022-04-01'),
	(304, 'Aravind', 'Kottayam', '2023-08-10'),
	(305, 'Arjun', 'Trivandrum', '2023-05-12'),
	(306, 'Neethu', 'Kochi', '2024-01-08');
    
	select * from Customer;

-- 5. IssueStatus Issue_Id - Set as PRIMARY KEY Issued_cust – Set as FOREIGN KEY and it refer customer_id in CUSTOMER table Issued_book_name Issue_date 
-- Isbn_book – Set as FOREIGN KEY and it should refer isbn in BOOKS table 
	create table IssueStatus(
    issue_id int primary key,
    issue_cust int,
    foreign key(issue_cust) references  Customer(c_id),
    issued_book_name varchar(100),
    issued_date date,
    isbn_book int,
    foreign key(isbn_book) references Books(ISBN));
    
    desc IssueStatus;
    
    INSERT INTO IssueStatus (issue_id, issue_cust, issued_book_name, issued_date, isbn_book) VALUES
	(401, 301, 'Rich Dad Poor Dad', '2024-02-10', 978006),
	(402, 302, 'Atomic Habits', '2024-02-12', 978007),
	(403, 303, 'The Psychology of Money', '2024-02-14', 978008),
	(404, 304, 'Python Programming', '2024-02-16', 978009),
	(405, 305, 'RAM C/O ANANDHI', '2024-02-18', 978010),
    (406, 303, 'Rich Dad Poor Dad', '2024-02-10', 978006),
	(407, 301, 'Atomic Habits', '2024-02-12', 978007);
    
	select * from IssueStatus;
    
-- 6. ReturnStatus Return_Id - Set as PRIMARY KEY Return_cust Return_book_name Return_date Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS table 
	create table ReturnStatus(
    return_id int primary key,
    return_cust varchar(25),
    return_book_name varchar(100),
    return_date date,
    isbn_book2 int,
    foreign key(isbn_book2) references Books(ISBN));

	desc ReturnStatus;
    
	INSERT INTO ReturnStatus (return_id, return_cust, return_book_name, return_date, isbn_book2) VALUES
	(501, 'John Carter', 'Rich Dad Poor Dad', '2024-03-01', 978006),
	(502, 'Sarah Johnson', 'Atomic Habits', '2024-03-03', 978007),
	(503, 'Michael Brown', 'The Psychology of Money', '2024-03-05', 978008),
	(504, 'Emily White', 'Python Programming', '2024-03-07', 978009),
	(505, 'David Black', 'RAM C/O ANANDHI', '2024-03-09', 978010);
    
    select * from ReturnStatus;


#Display all the tables and Write the queries for the following : 
-- 1. Retrieve the book title, category, and rental price of all available books. 
	select book_title,category,rental_price from Books;
	
-- 2. List the employee names and their respective salaries in descending order of salary. 
	select emp_name,salary from Employee order by salary desc;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books. 
	select c.c_name,i.issued_book_name from IssueStatus i inner join Customer c on issue_cust = c_id;

-- 4. Display the total count of books in each category. 
	select category,count(*) as 'Total Books' from Books group by category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
	select emp_name,position from Employee where salary>50000;
    
-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
	select c_name,reg_date from Customer where reg_date < '2022-01-01' and c_id not in (select issue_cust from IssueStatus);
    
-- 7. Display the branch numbers and the total count of employees in each branch. 
	select branch_no,count(*) as 'No.of Employees' from Employee group by branch_no;
    
-- 8. Display the names of customers who have issued books in the month of June 2023. 
	select c.c_name from Customer c inner join IssueStatus i on issue_cust = c_id where DATE_FORMAT(i.issued_date, '%Y-%m') = '2023-06';
	

-- 9. Retrieve book_title from book table containing history. 
	select book_title from Books where book_title like '%History%';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
	select branch_no,count(*) as 'employee count' from Employee group by branch_no having count(*)>5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses. 
	select e.emp_name,b.branch_no,b.branch_address from Employee e inner join Branch b on e.branch_no=b.branch_no where e.position='manager';

-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25. 
	select c.c_name from Customer c inner join IssueStatus i on i.issue_cust = c.c_id
    inner join Books b on b.ISBN = i.isbn_book where rental_price > 25.00;


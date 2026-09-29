#1.	Retrieve all accounts with balance greater than 20,000. 
SELECT *
FROM accounts
WHERE balance > 20000;

#2.	Find customers who live in Chennai. 
SELECT *
FROM customers
WHERE city = 'Chennai';

#3.	Display accounts with balance between 20,000 and 50,000. 
SELECT *
FROM accounts
WHERE balance BETWEEN 20000 AND 50000;

#4.	Find customers whose names start with 'J'.
SELECT *
FROM customers
WHERE name LIKE 'J%';

#5.	Retrieve accounts of type 'Savings' or 'Current'. 
SELECT *
FROM accounts
WHERE account_type IN ('Savings', 'Current');

#6.	Display accounts that are not 'Savings'. 
SELECT *
FROM accounts
WHERE account_type <> 'Savings';

#16.	Display all accounts sorted by balance in descending order. 
SELECT *
FROM accounts
ORDER BY balance DESC;

#17.	List customers sorted alphabetically by name. 
SELECT *
FROM customers
ORDER BY name ASC;

#18.	Display accounts sorted by account type and then by balance (descending). 
SELECT *
FROM accounts
ORDER BY account_type ASC, balance DESC;

#aggregate + join related queries

#20.	Calculate the average balance of accounts. 
SELECT AVG(balance) AS average_balance
FROM accounts;

#21.	Find the maximum account balance. 
SELECT MAX(balance) AS maximum_balance
FROM accounts;

#22.	Find the minimum account balance. 
SELECT MIN(balance) AS minimum_balance
FROM accounts;

#23.	Count the total number of customers. 
SELECT COUNT(*) AS total_customers
FROM customers;

#29.	Retrieve customer names along with their account balances. 
SELECT c.name, a.balance
FROM customers c JOIN accounts a
ON c.customer_id = a.customer_id;

#30.	Display all customers and their accounts (including customers without accounts). 
SELECT c.name, a.account_id, a.account_type, a.balance
FROM customers c LEFT JOIN accounts a
ON c.customer_id = a.customer_id;

#31.	Display all accounts and corresponding customer details. 
SELECT a.account_id, a.account_type, a.balance, c.name, c.city
FROM accounts a JOIN customers c
ON a.customer_id = c.customer_id;

#32.	Retrieve customer names and account types where balance is greater than 20,000. 
SELECT c.name, a.account_type
FROM customers c JOIN accounts a
ON c.customer_id = a.customer_id
WHERE a.balance > 20000;

# sub queries

#36.	Find accounts with balance greater than average balance.
SELECT *
FROM accounts
WHERE balance > (SELECT AVG(balance)
  		          FROM accounts ); 
                  
#37.	Retrieve customers who have accounts.
SELECT *
FROM customers
WHERE customer_id IN ( SELECT customer_id
    			       FROM accounts);
 
#38.	Find customers who do not have any accounts. 
SELECT *
FROM customers
WHERE customer_id NOT IN (SELECT customer_id
    				    FROM accounts);
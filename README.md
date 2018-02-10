# Purdue CS 348 Information Systems - Project 1: SQL Queries and Relationships

@Harris Christiansen (christih@purdue.edu) (HarrisChristiansen.com)  
February 2018  

## Description
- Given the provided `dbseed`, provide the SQL queries for the following problems:
- Answers are found in `project1_christih.sql`

## Problems
1. For each product, find the ProductName and AverageDiscount given on that product.
2. For each unique PhoneNo, determine the CountOfCustomers with that given phone number - sorted by CountOfCustomers (descending)
3. For products with 0 stock, list the ProductId, ProductName, FirstName, LastName - sorted by ProductId (ascending)
4. For each customer, list the CustomerId, LastName, AverageDiscount - sorted by CustomerId (ascending)
5. Find the top 3 products with the highest number of sales. List ProductName, NumberOfItemsSold - sorted by NumberOfItemsSold (descending)
6. For each customer with a delayed order, list FirstName, LastName, PhoneNo - sorted by FirstName (ascending)
7. Find the top 4 customers who generated the highest revenue. List CustomerId, Revenue - sorted by Revenue (descending)
8. Find the top 3 product categories with the highest number of unique customers. List Category, DistinctNumberOfCustomers - sorted by DistinctNumberOfCustomers (descending)
9. Find customers with >$1000 in currently delayed orders. List FirstName, LastName, OrderId, TotalAmount - sorted by TotalAmount(descending)
10. List suppliers who supply at least 3 unique products. List SupplierId, LastName, NumberOfDifferentProducts - sorted by NumberOfDifferentProducts (descending)

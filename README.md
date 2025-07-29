# Joins-Practice
SQL Joins Practice for CODTECH IT Solutions Internship - Task 1.

# TASK-1: JOINS PRACTICE - SQL INTERNSHIP

COMPANY: CODTECH IT SOLUTIONS

NAME: Enuganti Jayasai Deepika

INTERN ID:  CT04DH798

DOMAIN: Database Management / SQL Development

DURATION: 4 WEEKS



## TASK DESCRIPTION

### Overview and Objective:
This task, "Joins Practice", was designed to reinforce fundamental SQL concepts, specifically the various types of JOIN operations. The core objective was to demonstrate the ability to combine data from multiple relational tables effectively and to understand the distinct behaviors and applications of INNER, LEFT, RIGHT, and FULL (or FULL OUTER) JOINs. Mastering joins is crucial for any database professional, as most real-world applications involve fetching data that is normalized and spread across several interconnected tables. This exercise aimed to solidify theoretical knowledge with practical implementation.

### Database Environment and Setup:
To successfully complete this task, I set up a local database environment. I chose MySQL as my relational database management system (RDBMS) and utilized MySQL Workbench for executing SQL queries and visualizing results. The initial step involved creating a dedicated database named codtech_internship_db to encapsulate all tables and data relevant to these internship tasks, ensuring a clean and organized workspace.

### Data Model and Population:
For demonstration purposes, two essential tables were created: Customers and Orders.
-   The Customers table was designed with columns such as CustomerID (as the primary key), CustomerName, and City. This table represents the entities placing orders.
-   The Orders table contained OrderID (primary key), CustomerID (as a foreign key referencing the Customers table), OrderDate, and Amount. This table represents the transactions.
The foreign key relationship between Orders.CustomerID and Customers.CustomerID was explicitly defined to establish referential integrity, which is crucial for accurate data linking during join operations.
Following table creation, carefully crafted sample data was inserted into both tables. This data included:
-   Customers with multiple orders.
-   Customers with a single order.
-   Customers with no orders (e.g., 'Eve', CustomerID 5) – specifically for demonstrating LEFT and FULL JOINs.
-   Orders with a CustomerID that does not exist in the Customers table (e.g., OrderID 104 with CustomerID 6) – crucial for demonstrating RIGHT and FULL JOINs, highlighting data inconsistencies if referential integrity isn't strictly enforced at the application level.

### Implementation of Join Operations:

#### 1. INNER JOIN:
The INNER JOIN was the first type explored. This join is characterized by its property of returning only those rows that have matching values in both the Customers and Orders tables based on the CustomerID common column. My query effectively filtered out Customers who had not placed any orders (like 'Eve') and any Orders that were not associated with an existing Customer (like OrderID 104). The output clearly showed the intersection of these two datasets, providing a clean list of all orders that are correctly linked to an existing customer.

#### 2. LEFT JOIN (LEFT OUTER JOIN):
Next, the LEFT JOIN was implemented. This join ensures that all records from the Customers table (designated as the "left" table in my query) are returned. For each customer, if a matching OrderID exists in the Orders table, those order details are included. Critically, if a customer has no corresponding orders (such as 'Eve'), the columns pertaining to the Orders table (e.g., OrderID, OrderDate, Amount) are populated with NULL values. This type of join is invaluable when you need a complete list of entities from one side of a relationship, regardless of whether they have related data on the other side, making it perfect for scenarios like listing all customers and their order details, or identifying customers who haven't placed any orders.

#### 3. RIGHT JOIN (RIGHT OUTER JOIN):
The RIGHT JOIN (also known as RIGHT OUTER JOIN) operates symmetrically to the LEFT JOIN. It returns all records from the Orders table (the "right" table). If an order has a matching CustomerID in the Customers table, the customer's details are included. Conversely, if an order's CustomerID does not match any existing customer (like OrderID 104, which had CustomerID 6), the columns from the Customers table are filled with NULL values. This join is particularly useful for auditing purposes, allowing one to identify all transactions and specifically highlight any that might be "orphaned" or incorrectly linked due to missing customer data.

#### 4. FULL JOIN (FULL OUTER JOIN):
Finally, the FULL JOIN (or FULL OUTER JOIN) was demonstrated. This join provides the most comprehensive result set, returning all rows when there is a match in either the left table or the right table. This means it includes:
    * Rows with matches in both tables.
    * Rows from the left table that have no match in the right table (with `NULL`s for right table columns).
    * Rows from the right table that have no match in the left table (with `NULL`s for left table columns).
For my chosen RDBMS,  MySQL which does not natively support FULL OUTER JOIN, I implemented a common workaround: a UNION of a LEFT JOIN and a RIGHT JOIN. Care was taken to ensure that duplicate rows (those with matches in both tables) were not repeated, typically by adding a WHERE clause in the RIGHT JOIN part to only select rows where the left-side columns were NULL (indicating no match from the LEFT JOIN already captured). This comprehensive view is invaluable for data reconciliation and understanding the complete relationship landscape between two datasets.

### Learnings and Conclusion:
This task was fundamental in solidifying my understanding of SQL JOIN operations. The practical application of each join type with specifically designed data clarified their unique behaviors, particularly how they handle non-matching records. I gained a deeper appreciation for the importance of choosing the correct join type based on the specific data retrieval requirements. Furthermore, understanding the nuances of NULL values in outer joins and adapting to RDBMS-specific syntax (like simulating FULL OUTER JOIN in MySQL) were key takeaways. This exercise provided a strong foundation for more complex data analysis and manipulation using SQL.

---

#### *Step 7: Commit and Push to GitHub*

1.  Open your terminal or Git Bash.
2.  Navigate to your main repository folder
3.  Add all the new files and folders for Task 1:
    bash
    git add Task1_Joins_Practice/
    
    (Or git add . to add everything in the current directory if you're sure nothing else is incomplete)
4.  Commit your changes:
    bash
    git commit -m "Completed Task 1: Joins Practice - Added SQL queries, outputs, and README"
    
5.  Push your changes to your GitHub repository:
    bash
    git push origin main
    
    (Replace main with master if your default branch is master).

👨‍💻 Author Made by Enuganti Jayasai Deepika 
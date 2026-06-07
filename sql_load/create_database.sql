CREATE DATABASE adventure_works;

SET datestyle = 'MDY';  -- Set date format to match the format in the CSV files (MM/DD/YYYY)

\copy calendar FROM 'C:/Users/Lenovo/Desktop/projects/adventure-works/csv_files/AdventureWorks_Calendar.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

/* customers has latin names, so we need to use LATIN1 encoding to avoid issues with special characters insted of using UTF8 encoding */
\copy customers FROM 'C:/Users/Lenovo/Desktop/projects/adventure-works/csv_files/AdventureWorks_Customers.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'LATIN1');.

\copy product_categories FROM 'C:/Users/Lenovo/Desktop/projects/adventure-works/csv_files/AdventureWorks_Product_Categories.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy product_subcategories FROM 'C:/Users/Lenovo/Desktop/projects/adventure-works/csv_files/AdventureWorks_Product_Subcategories.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy products FROM 'C:/Users/Lenovo/Desktop/projects/adventure-works/csv_files/AdventureWorks_Products.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy returns FROM 'C:/Users/Lenovo/Desktop/projects/adventure-works/csv_files/AdventureWorks_Returns.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
-- sales in 2015, 2016, and 2017 are in separate files, so we need to load them separately
\copy sales FROM 'C:/Users/Lenovo/Desktop/projects/adventure-works/csv_files/AdventureWorks_Sales_2015.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy sales FROM 'C:/Users/Lenovo/Desktop/projects/adventure-works/csv_files/AdventureWorks_Sales_2016.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy sales FROM 'C:/Users/Lenovo/Desktop/projects/adventure-works/csv_files/AdventureWorks_Sales_2017.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy territories FROM 'C:/Users/Lenovo/Desktop/projects/adventure-works/csv_files/AdventureWorks_Territories.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

-- Verify the data has been loaded correctly

SELECT * FROM customers;
SELECT * FROM product_categories;
SELECT * FROM product_subcategories;
SELECT * FROM products;
SELECT * FROM returns;
SELECT * FROM sales;
SELECT * FROM territories;

SELECT COUNT(*) FROM sales;

SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sales', COUNT(*) FROM sales
UNION ALL
SELECT 'territories', COUNT(*) FROM territories
UNION ALL
SELECT 'product_categories', COUNT(*) FROM product_categories
UNION ALL
SELECT 'product_subcategories', COUNT(*) FROM product_subcategories;
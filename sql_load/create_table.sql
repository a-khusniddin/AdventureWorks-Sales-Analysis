CREATE TABLE calendar (
    date DATE
);


CREATE TABLE customers (
    customer_key INT PRIMARY KEY,
    name_prefix VARCHAR(10),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    marital_status VARCHAR(5),
    gender VARCHAR(10),
    email VARCHAR(100),
    annual_income VARCHAR(20),
    total_children INT,
    education_level VARCHAR(50),
    occupation VARCHAR(50),
    home_owner VARCHAR(5)
);


ALTER TABLE customers
ALTER COLUMN annual_income TYPE VARCHAR(20);

ALTER TABLE products
ALTER COLUMN size TYPE VARCHAR(10);

CREATE TABLE product_categories (
    category_key INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE product_subcategories (
    subcategory_key INT PRIMARY KEY,
    subcategory_name VARCHAR(50),
    category_key INT REFERENCES product_categories(category_key)
);

CREATE TABLE products (
    product_key INT PRIMARY KEY,
    subcategory_key INT REFERENCES product_subcategories(subcategory_key),
    product_sku VARCHAR(50),
    product_name VARCHAR(100),
    model_name VARCHAR(100),
    product_description VARCHAR(255),
    color VARCHAR(50),
    size INT,
    product_style VARCHAR(10),
    product_cost DECIMAL(10,2),
    product_price DECIMAL(10,2)
);

CREATE TABLE territories (
    territory_key INT PRIMARY KEY,
    region VARCHAR(50),
    country VARCHAR(50),
    continent VARCHAR(50)
);

CREATE TABLE returns (
    return_date DATE,
    territory_key INT REFERENCES territories(territory_key),
    product_key INT REFERENCES products(product_key),
    return_quantity INT
);

CREATE TABLE sales (
    order_date DATE,
    stock_date DATE,
    order_number VARCHAR(50),
    product_key INT REFERENCES products(product_key),
    customer_key INT REFERENCES customers(customer_key),
    territory_key INT REFERENCES territories(territory_key),
    order_line_item INT,
    order_quantity INT
);




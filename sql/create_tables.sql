CREATE TABLE fact_sales (
    sale_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    store_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity INT NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL,
    total_amount NUMERIC(10, 2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id)
)

CREATE TABLE dim_product (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR (50),
    category VARCHAR (50),
    price NUMERIC(10, 2),
    brand VARCHAR (50),
    supplier_id INT
)

CREATE TABLE dim_customer (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR (255),
    gender VARCHAR (10),
    birth_date DATE,
    loyalty_status VARCHAR(10) CHECK (loyalty_status IN ('None', 'Bronze', 'Silver', 'Gold'))
)

CREATE TABLE dim_store (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR (50),
    city VARCHAR (20),
    state VARCHAR (20)
)

CREATE TABLE dim_date (
    date DATE PRIMARY KEY,
    day INT,
    month INT,
    quarter INT,
    year INT
)
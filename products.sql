--  Customer table
CREATE TABLE Customer (
    Customer_id   VARCHAR2(20) CONSTRAINT customer_pk PRIMARY KEY,
    Customer_Name VARCHAR2(20) NOT NULL,
    Customer_Tel  NUMBER
);

--  Product table
CREATE TABLE Product (
    Product_id   VARCHAR2(20) CONSTRAINT product_pk PRIMARY KEY,
    Product_Name VARCHAR2(20) NOT NULL,
    Price        NUMBER       CONSTRAINT price_positive CHECK (Price > 0)
);

--  Orders table
CREATE TABLE Orders (
    Customer_id  VARCHAR2(20) CONSTRAINT orders_customer_fk REFERENCES Customer(Customer_id),
    Product_id   VARCHAR2(20) CONSTRAINT orders_product_fk  REFERENCES Product(Product_id),
    Quantity     NUMBER,
    Total_amount NUMBER,
    CONSTRAINT orders_pk PRIMARY KEY (Customer_id, Product_id)
);

-- ALTER TABLES

-- Addng Category column to Product table
ALTER TABLE Product
ADD Category VARCHAR2(20);

-- Adding OrderDate column to Orders table with SYSDATE as default
ALTER TABLE Orders
ADD OrderDate DATE DEFAULT SYSDATE;

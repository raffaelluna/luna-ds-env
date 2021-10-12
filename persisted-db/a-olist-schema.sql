SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

CREATE TABLE IF NOT EXISTS orders (
    order_id VARCHAR(10000),
    customer_id VARCHAR(10000),
    order_status VARCHAR(10000),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP,
    PRIMARY KEY (order_id)
);

ALTER TABLE orders OWNER TO root;

CREATE TABLE IF NOT EXISTS order_reviews (
    review_id VARCHAR(10000),
    order_id VARCHAR(10000),
    review_score INT,
    review_comment_title VARCHAR(10000),
    review_comment_message VARCHAR(10000),
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);

ALTER TABLE order_reviews OWNER TO root;

CREATE TABLE IF NOT EXISTS order_payments (
    order_id VARCHAR(10000),
    payment_sequential INT,
    payment_type VARCHAR(10000),
    payment_installments INT,
    payment_value FLOAT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);

ALTER TABLE order_payments OWNER TO root;

CREATE TABLE IF NOT EXISTS customers (
    customer_id VARCHAR(10000),
    customer_unique_id VARCHAR(10000),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(10000),
    customer_state VARCHAR(10000),
    PRIMARY KEY (customer_id)
);

ALTER TABLE customers OWNER TO root;

CREATE TABLE IF NOT EXISTS geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city VARCHAR(10000),
    geolocation_state VARCHAR(10000)
);

ALTER TABLE geolocation OWNER TO root;

CREATE TABLE IF NOT EXISTS products (
    product_id VARCHAR(10000),
    product_category_name VARCHAR(10000),
    product_name_lenght FLOAT,
    product_description_lenght FLOAT,
    product_photos_qty FLOAT,
    product_weight_g FLOAT,
    product_length_cm FLOAT,
    product_height_cm FLOAT,
    product_width_cm FLOAT,
    PRIMARY KEY (product_id)
);

ALTER TABLE geolocation OWNER TO root;

CREATE TABLE IF NOT EXISTS sellers (
    seller_id VARCHAR(10000),
    seller_zip_code_prefix INT,
    seller_city VARCHAR(10000),
    seller_state VARCHAR(10000),
    PRIMARY KEY (seller_id)
);

ALTER TABLE sellers OWNER TO root;

CREATE TABLE IF NOT EXISTS order_items (
    order_id VARCHAR(10000),
    order_item_id INT,
    product_id VARCHAR(10000),
    seller_id VARCHAR(10000),
    shipping_limit_date TIMESTAMP,
    price FLOAT,
    freight_value FLOAT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON UPDATE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON UPDATE CASCADE,
    FOREIGN KEY (seller_id) REFERENCES sellers(seller_id) ON UPDATE CASCADE
);

ALTER TABLE order_items OWNER TO root;

CREATE TABLE IF NOT EXISTS categories_translation (    
    product_category_name VARCHAR(100),
    product_category_name_english VARCHAR(100)
);

ALTER TABLE categories_translation OWNER TO root;
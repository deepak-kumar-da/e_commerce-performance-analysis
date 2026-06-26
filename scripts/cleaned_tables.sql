if OBJECT_ID ('silver.dim_customer') is not null
	drop table silver.dim_customer;

create table silver.dim_customer(
	customer_id nvarchar(50),
	customer_unique_id nvarchar(50),
	customer_zip_code_prefix nvarchar(10),
	customer_city nvarchar(50),
	customer_state nvarchar(20)
);

if OBJECT_ID ('silver.dim_geolocation') is not null
	drop table silver.dim_geolocation;

create table silver.dim_geolocation(
	geolocation_zip_code_preview nvarchar(10),
	geolocation_latitude decimal(12,8),
	geolocation_longitude decimal(12,8),
	geolocation_city nvarchar(50),
	geolocation_state nvarchar(50)
);

if OBJECT_ID ('silver.fact_order_items') is not null
	drop table silver.fact_order_items;

create table silver.fact_order_items(
	order_id nvarchar(50),
	order_item_id int,
	product_id nvarchar(50),
	seller_id nvarchar(50),
	shipping_limit_date datetime,
	price float,
	freight_value float
);


if OBJECT_ID ('silver.fact_order_payments') is not null
	drop table silver.fact_order_payments;

create table silver.fact_order_payments(
order_id nvarchar(50),
payment_sequential int,
payment_type nvarchar(20),
payment_installation int,
payment_value float
);

if OBJECT_ID ('silver.fact_order_reviews') is not null
	drop table silver.fact_order_reviews;

create table silver.fact_order_reviews(
review_id nvarchar(50),
order_id nvarchar(50),
review_score int,
review_comment_title nvarchar(50),
review_comment_message nvarchar(300),
review_creation_date datetime null,
review_answer_timestamp datetime null
);


if OBJECT_ID ('silver.fact_orders') is not null
	drop table silver.fact_orders;

create table silver.fact_orders(
order_id nvarchar(50),
customer_id nvarchar(50),
order_status nvarchar(20),
order_purchase_timestamp datetime,
order_approved_at datetime,
order_delivered_carrier_date datetime,
order_delivered_customer_date datetime,
order_estimated_delivery_time datetime
);

if OBJECT_ID ('silver.dim_products') is not null
	drop table silver.dim_products;

create table silver.dim_products(
product_id nvarchar(50),
product_category_name nvarchar(50),
product_name_length int,
product_description_length int,
product_photos_quantity int,
product_weight_in_g int,
product_length_in_cm int,
product_height_in_cm int,
product_width_in_cm int
);


if OBJECT_ID ('silver.dim_sellers') is not null
	drop table silver.dim_sellers;

create table silver.dim_sellers(
seller_id nvarchar(50),
seller_zip_code_prefix nvarchar(10),
seller_city nvarchar(50),
seller_state nvarchar(50)
);


if OBJECT_ID ('silver.dim_product_category_name') is not null
	drop table silver.dim_product_category_name;

create table silver.dim_product_category(
product_category_name nvarchar(100),
product_category_name_eng nvarchar(100)
);







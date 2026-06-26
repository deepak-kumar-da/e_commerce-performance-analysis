/*
=======================================================================================
CREATING VIEWS 
=======================================================================================
*/

-- view -> dim_customer
drop view if exists gold.dim_customer
go

create view gold.dim_customer 
as
	select 
		customer_id,
		customer_unique_id,
		customer_zip_code_prefix,
		customer_city,
		customer_state
	from silver.dim_customer 
go

-- view -> dim_geolocation
drop view if exists gold.dim_geolocation
go

create view gold.dim_geolocation
as
	select 
		geolocation_latitude,
		geolocation_longitude,
		geolocation_zip_code_preview,
		geolocation_city,
		geolocation_state
	from silver.dim_geolocation
go

-- view -> fact_orders
drop view if exists gold.fact_orders
go

create view gold.fact_orders
as
	select
		oi.order_id as Order_ID,
		o.customer_id as Customer_ID,
		oi.product_id as Product_ID,
		oi.seller_id as Seller_ID,
		oi.price as Price,
		oi.freight_value as Transportation_Cost,
		op.payment_value as Total_Payment,
		op.payment_type as Payment_Type,
		op.payment_installation as Payment_Installation,
		o.order_status as Order_Status,
		o.order_purchase_timestamp as Purchased_Date,
		o.order_approved_at as Approved_Date,
		oi.shipping_limit_date as Dispatch_Date,
		o.order_delivered_carrier_date as Carrier_Date,
		o.order_delivered_customer_date as Delivered_Date,
		o.order_estimated_delivery_time as Expected_Delivery,
		ore.review_score as Review_Score,
		ore.review_comment_message

	from silver.fact_order_items oi
	left join silver.fact_order_payments op
	on oi.order_id = op.order_id

	left join silver.fact_orders o
	on oi.order_id = o.order_id

	left join silver.fact_order_reviews as ore
	on oi.order_id = ore.order_id

go


-- view -> dim_products
drop view if exists gold.dim_products
go

create view gold.dim_products
as
	select 
		p.product_id as Product_ID,
		pc.product_category_name_eng as Product_Category,
		p.product_weight_in_g as Product_Weight,
		p.product_length_in_cm as Product_Length,
		p.product_height_in_cm as Product_Height,
		p.product_width_in_cm as Product_Width

	from silver.dim_products p

	left join silver.dim_product_category pc
	on p.product_category_name = pc.product_category_name

go


-- view -> dim_seller
drop view if exists gold.dim_seller
go

create view gold.dim_seller
as
	select 
		seller_id as Seller_ID,
		seller_zip_code_prefix as Seller_Zip_Code,
		seller_city as Seller_City,
		seller_state as Seller_State
	from silver.dim_sellers
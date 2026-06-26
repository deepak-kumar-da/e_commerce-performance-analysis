/*
============================================================================================================
STORED PROCEDURE -> SILVER.LOAD_BRONZE 
============================================================================================================
Work :- It inserts all cleaned data from  raw data tables to the specific tables in a single line of code.
How to Use :- EXEC SILVER.LOAD_BRONZE
*/

create or alter procedure silver.load_silver as 
begin
	begin try
	    
		-- Inserting Customer Table
		truncate table silver.dim_customer
		insert into silver.dim_customer (
			customer_id,
			customer_unique_id,
			customer_zip_code_prefix,
			customer_city,
			customer_state
		)

		select 
		replace(customer_id,'"','' ) as customer_id,
		replace(customer_unique_id,'"','') as customer_unique_id,
		cast(replace(customer_zip_code_prefix,'"','') as int) as customer_zip_code_prefix,
		customer_city,
		customer_state
		from bronze.dim_customer


		-- Inserting Geolocation Table
		truncate table silver.dim_geolocation
		insert into silver.dim_geolocation (
			geolocation_zip_code_preview,
			geolocation_latitude,
			geolocation_longitude,
			geolocation_city,
			geolocation_state
		)

		select
		cast(replace(geolocation_zip_code_preview,'"','') as int) as geolocation_zip_code_preview,
		geolocation_latitude,
		geolocation_longitude,
		geolocation_city,
		geolocation_state
		from bronze.dim_geolocation



		-- Inserting Product Category Table
		truncate table silver.dim_product_category
		insert into silver.dim_product_category (
		product_category_name,
		product_category_name_eng
		)

		select 
		product_category_name,
		product_category_name_eng
		from bronze.dim_product_category_name

		-- Inserting Sellers Table
		truncate table silver.dim_sellers
		insert into silver.dim_sellers(
		seller_id,
		seller_zip_code_prefix,
		seller_city,
		seller_state
		)

		select 
		replace(seller_id,'"','') as seller_id,
		replace(seller_zip_code_prefix,'"','') as seller_zip_code_prefix,
		seller_city,
		seller_state
		from bronze.dim_sellers


	    -- Inserting Order Items Table
		truncate table silver.fact_order_items
		insert into silver.fact_order_items(
			order_id,
			order_item_id,
			product_id,
			seller_id,
			shipping_limit_date,
			price,
			freight_value
		)

		select 
		replace(order_id,'"','') as order_id,
		order_item_id,
		replace(product_id,'"','') as product_id,
		replace(seller_id,'"','') as seller_id,
		shipping_limit_date,
		price,
		freight_value
		from bronze.fact_order_items


		-- Inserting Order Payments Table
		truncate table silver.fact_order_payments
		insert into silver.fact_order_payments(
		order_id,
		payment_sequential,
		payment_type,
		payment_installation,
		payment_value
		)

		select
		replace(order_id,'"','') as order_id,
		payment_sequential,
		payment_type,
		payment_installation,
		payment_value
		from bronze.fact_order_payments

		
		
		-- Inserting Order Reviews Table
		truncate table silver.fact_order_reviews
		insert into silver.fact_order_reviews(
		review_id,
		order_id,
		review_score,
		review_comment_title,
		review_comment_message,
		review_creation_date,
		review_answer_timestamp
		)

		select 
		review_id,
		order_id,
		review_score,
		review_comment_title,
		review_comment_message,
		review_creation_date,
		review_answer_timestamp
		from bronze.fact_order_reviews



		-- Inserting Orders Table
		truncate table silver.fact_orders
		insert into silver.fact_orders(
		order_id,
		customer_id,
		order_status,
		order_purchase_timestamp,
		order_approved_at,
		order_delivered_carrier_date,
		order_delivered_customer_date,
		order_estimated_delivery_time
		)

		select
		replace(order_id,'"','') as order_id,
		replace(customer_id,'"','') as customer_id,
		order_status,
		order_purchase_timestamp,
		order_approved_at,
		order_delivered_carrier_date,
		order_delivered_customer_date,
		order_estimated_delivery_time
		from bronze.fact_orders



		-- Inserting Products Table
		truncate table silver.dim_products
		insert into silver.dim_products(
		product_id,
		product_category_name,
		product_name_length,
		product_description_length,
		product_photos_quantity,
		product_weight_in_g,
		product_length_in_cm,
		product_height_in_cm,
		product_width_in_cm
		)

		select 
		replace(product_id,'"','') as product_id,
		product_category_name,
		product_name_length,
		product_description_length,
		product_photos_quantity,
		product_weight_in_g,
		product_length_in_cm,
		product_height_in_cm,
		product_width_in_cm
		from bronze.dim_products

	end try
	begin catch
        print 'Error Occured During Loading Bronze Layer';
		print 'Error Message' + Error_message();
		print 'Error Message' + cast(error_number() as nvarchar);
    end catch
end
/*
===============================================================================
STORED PROCEDURE -> BRONZE.LOAD_BRONZE 
===============================================================================
Work :- It inserts all csv data to the specific tables in a single line of code.
How to Use :- EXEC BRONZE.LOAD_BRONZE
*/

create or alter procedure bronze.load_bronze as
begin
    begin try
        
        -- Inserting Customer Table
        truncate table bronze.dim_customer

        bulk insert bronze.dim_customer
        from 'C:\Users\mu pc\Desktop\Projects\Project 4\dataset\olist_customers_dataset.csv'
        with(
            first_row = 2,
            fieldterminator = ',',
            rowterminator = '0x0A',
            codepage = '65001',
            tablock
        );

        -- Inserting Geolocation Table
        truncate table bronze.dim_geolocation

        bulk insert bronze.dim_geolocation
        from 'C:\Users\mu pc\Desktop\Projects\Project 4\dataset\olist_geolocation_dataset.csv'
        with(
            first_row = 2,
            fieldterminator = ',',
            rowterminator = '0x0A',
            codepage = '65001',
            tablock
        );

        -- Inserting Order Items Table
        truncate table bronze.fact_order_items

        bulk insert bronze.fact_order_items
        from 'C:\Users\mu pc\Desktop\Projects\Project 4\dataset\olist_order_items_dataset.csv'
        with(
            first_row = 2,
            fieldterminator = ',',
            rowterminator = '0x0A',
            codepage = '65001',
            tablock
        );

        -- Inserting Order Payments Table
        truncate table bronze.fact_order_payments

        bulk insert bronze.fact_order_payments
        from 'C:\Users\mu pc\Desktop\Projects\Project 4\dataset\olist_order_payments_dataset.csv'
        with(
            first_row = 2,
            fieldterminator = ',',
            rowterminator = '0x0A',
            codepage = '65001',
            tablock
        );

        -- Inserting Order Reviews Table
        truncate table bronze.fact_order_reviews

        bulk insert bronze.fact_order_reviews
        from 'C:\Users\mu pc\Desktop\Projects\Project 4\dataset\olist_order_reviews_dataset_fixed.csv'
        with(
            first_row = 2,
            fieldterminator = ',',
            rowterminator = '0x0A',
            codepage = '65001',
            tablock
        );

        -- Inserting Orders Table
        truncate table bronze.fact_orders

        bulk insert bronze.fact_orders
        from 'C:\Users\mu pc\Desktop\Projects\Project 4\dataset\olist_orders_dataset.csv'
        with(
            first_row = 2,
            fieldterminator = ',',
            rowterminator = '0x0A',
            codepage = '65001',
            tablock
        );


        -- Inserting Products Table
        truncate table bronze.dim_products

        bulk insert bronze.dim_products
        from 'C:\Users\mu pc\Desktop\Projects\Project 4\dataset\olist_products_dataset.csv'
        with(
            first_row = 2,
            fieldterminator = ',',
            rowterminator = '0x0A',
            codepage = '65001',
            tablock
        );


        -- Inserting Sellers Table
        truncate table bronze.dim_sellers

        bulk insert bronze.dim_sellers
        from 'C:\Users\mu pc\Desktop\Projects\Project 4\dataset\olist_sellers_dataset.csv'
        with(
            first_row = 2,
            fieldterminator = ',',
            rowterminator = '0x0A',
            codepage = '65001',
            tablock
        );



        -- Inserting Product Category Table
        truncate table bronze.dim_product_category_name

        bulk insert bronze.dim_product_category_name
        from 'C:\Users\mu pc\Desktop\Projects\Project 4\dataset\product_category_name_translation.csv'
        with(
            first_row = 2,
            fieldterminator = ',',
            rowterminator = '0x0A',
            codepage = '65001',
            tablock
        );
    end try
    begin catch
        print 'Error Occured During Loading Bronze Layer';
		print 'Error Message' + Error_message();
		print 'Error Message' + cast(error_number() as nvarchar);
    end catch
END
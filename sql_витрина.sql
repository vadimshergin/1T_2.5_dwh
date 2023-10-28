CREATE TABLE shops AS
    SELECT shop_name, [date], product_id, sales_cnt,  FROM shop_dns JOIN product ON product.product_id = shop_dns.product_id JOIN plan ON product.product_id = plan.product_id
    UNION
    SELECT shop_name, [date], product_id, sales_cnt,  FROM shop_mvideo JOIN product ON product.product_id = shop_mvideo.product_id JOIN plan ON product.product_id = plan.product_id
    UNION
    SELECT shop_name, [date], product_id, sales_cnt,  FROM shop_sitilink JOIN product ON product.product_id = shop_sitilink.product_id JOIN plan ON product.product_id = plan.product_id
    FOREIGN KEY (product_id) REFERENCES plan (product_id)


CREATE TABLE shops_data AS
    SELECT shop_name, product_id, sales_cnt AS sales_fact, plan_cnt AS sales_plan, [date], plan_date FROM plan
    JOIN shops ON plan.product_id = shops.product_id
    FOREIGN KEY (product_id) REFERENCES products (product_id)


SELECT shop_name, product_name, sales_fact, sales_plan, (sales_fact/sales_cnt) AS sales_ratio, (sales_cnt*price) AS income_fact, (sales_plan*price) AS income_plan, (income_fact/income_plan) AS income_ratio
    FROM shops_data JOIN products ON shops_data.product_id = products.product_id
    WHERE shops_data.date = shops_data.plan_date;


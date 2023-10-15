CREATE TABLE gathering AS
    SELECT shop_name, product_id, product_name, price, plan_date, plan_cnt, sales_cnt, "date" FROM products
        INNER JOIN plan 
            ON products.product_id = plan.product_id
        INNER JOIN shop_dns
            ON products.product_id = shop_dns.product_id
        INNER JOIN shop_mvideo
            ON products.product_id = shop_mvideo.product_id
        INNER JOIN shop_sitilink
            ON products.product_id = shop_sitilink.product_id;

SELECT shop_name, product_name, sales_cnt AS sales_fact, plan_cnt AS sales_plan, 
        (sales_cnt/plan_cnt) AS sales_ratio, 
        (sales_cnt * price) AS income_fact, 
        (plan_cnt * price) AS income_plan, 
        (income_fact/income_plan) AS income_ratio
        FROM gathering
GROUP BY shop_name;

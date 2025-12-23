create database food_delivery_projects;
use food_delivery_projects;
CREATE TABLE product (
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(100),
    price        INT
);
CREATE TABLE sales (
    user_id      INT,
    created_date DATE,
    product_id   INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
CREATE TABLE user_name (
    user_id   INT PRIMARY KEY,
    user_name VARCHAR(100)
);
CREATE TABLE users (
    user_id     INT PRIMARY KEY,
    signup_date DATE
);
CREATE TABLE goldusers_signup (
    user_id          INT PRIMARY KEY,
    gold_signup_date DATE
);
INSERT INTO product (product_id, product_name, price) VALUES
(1,  'Dal Makhani',      150),
(2,  'Butter Chicken',   220),
(3,  'Chole Bhature',    120),
(4,  'Fish Curry',       200),
(5,  'Paneer Tikka',     180),
(6,  'Veg Biryani',      160),
(7,  'Chicken Biryani',  220),
(8,  'Mutton Biryani',   320),
(9,  'Mango Lassi',       90),
(10, 'Masala Dosa',      130),
(11, 'Prawn Fry',        280);

INSERT INTO users (user_id, signup_date) VALUES
(1, '2013-01-05'),
(2, '2015-03-12'),
(3, '2014-07-22'),
(4, '2016-02-09'),
(5, '2013-11-13'),
(6, '2014-06-17'),
(7, '2016-09-21'),
(8, '2016-09-21'),
(9, '2015-12-29'),
(10,'2015-12-29');

INSERT INTO user_name (user_id, user_name) VALUES
(1,  'Rohan'),
(2,  'Priya'),
(3,  'Amit'),
(4,  'Sneha'),
(5,  'John'),
(6,  'Sara'),
(7,  'Dev'),
(8,  'Kunal'),
(9,  'Meera'),
(10, 'Arjun');

INSERT INTO goldusers_signup (user_id, gold_signup_date) VALUES
(1, '2019-02-21'),
(3, '2017-11-03'),
(4, '2018-09-15'),
(5, '2019-05-01'),
(7, '2017-06-20');

INSERT INTO sales (user_id, created_date, product_id) VALUES
(1, '2018-01-10', 2),
(1, '2018-03-05', 6),
(1, '2019-03-01', 8),
(1, '2019-08-15', 2),
(1, '2020-01-20', 9);

-- User 2
INSERT INTO sales (user_id, created_date, product_id) VALUES
(2, '2017-02-11', 3),
(2, '2017-04-09', 3),
(2, '2018-06-21', 1),
(2, '2019-09-10',10);

-- User 3
INSERT INTO sales (user_id, created_date, product_id) VALUES
(3, '2017-01-15', 1),
(3, '2017-08-30', 2),
(3, '2018-02-14', 2),
(3, '2018-07-19', 7),
(3, '2019-11-25', 8);

INSERT INTO sales (user_id, created_date, product_id) VALUES
(4, '2018-03-03', 5),
(4, '2018-08-20', 5),
(4, '2018-10-05', 6),
(4, '2019-01-11', 7),
(4, '2020-05-14', 5);

-- User 5
INSERT INTO sales (user_id, created_date, product_id) VALUES
(5, '2017-09-09',10),
(5, '2018-12-30', 3),
(5, '2019-05-10', 2),
(5, '2019-06-18', 2),
(5, '2020-02-22',11);

-- User 6
INSERT INTO sales (user_id, created_date, product_id) VALUES
(6, '2016-11-11', 4),
(6, '2017-03-30', 4),
(6, '2018-08-08', 6),
(6, '2019-12-01', 9);

-- User 7
INSERT INTO sales (user_id, created_date, product_id) VALUES
(7, '2016-05-05', 6),
(7, '2017-01-20', 6),
(7, '2017-07-10', 7),
(7, '2018-04-04', 7),
(7, '2019-09-09', 8);

-- User 8
INSERT INTO sales (user_id, created_date, product_id) VALUES
(8, '2017-10-10', 1),
(8, '2018-01-18', 3),
(8, '2018-09-09', 3),
(8, '2020-03-03', 9);

-- User 9
INSERT INTO sales (user_id, created_date, product_id) VALUES
(9, '2018-06-06',11),
(9, '2018-12-12',11),
(9, '2019-03-30', 8),
(9, '2020-07-07',10);

-- User 10
INSERT INTO sales (user_id, created_date, product_id) VALUES
(10,'2017-02-02', 2),
(10,'2018-05-15', 5),
(10,'2019-01-25', 2),
(10,'2020-09-09', 7);

SELECT COUNT(*) FROM product;
SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM user_name;
SELECT COUNT(*) FROM goldusers_signup;
SELECT COUNT(*) FROM sales;

DROP TABLE sales;

CREATE TABLE sales (
    sale_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT,
    created_date DATE,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
INSERT INTO sales (user_id, created_date, product_id) VALUES
(1, '2018-01-10', 2),
(1, '2018-03-05', 6),
(1, '2019-03-01', 8),
(1, '2019-08-15', 2),
(1, '2020-01-20', 9);

-- User 2
INSERT INTO sales (user_id, created_date, product_id) VALUES
(2, '2017-02-11', 3),
(2, '2017-04-09', 3),
(2, '2018-06-21', 1),
(2, '2019-09-10',10);

-- User 3
INSERT INTO sales (user_id, created_date, product_id) VALUES
(3, '2017-01-15', 1),
(3, '2017-08-30', 2),
(3, '2018-02-14', 2),
(3, '2018-07-19', 7),
(3, '2019-11-25', 8);

-- User 4
INSERT INTO sales (user_id, created_date, product_id) VALUES
(4, '2018-03-03', 5),
(4, '2018-08-20', 5),
(4, '2018-10-05', 6),
(4, '2019-01-11', 7),
(4, '2020-05-14', 5);

-- User 5
INSERT INTO sales (user_id, created_date, product_id) VALUES
(5, '2017-09-09',10),
(5, '2018-12-30', 3),
(5, '2019-05-10', 2),
(5, '2019-06-18', 2),
(5, '2020-02-22',11);

-- User 6
INSERT INTO sales (user_id, created_date, product_id) VALUES
(6, '2016-11-11', 4),
(6, '2017-03-30', 4),
(6, '2018-08-08', 6),
(6, '2019-12-01', 9);

-- User 7
INSERT INTO sales (user_id, created_date, product_id) VALUES
(7, '2016-05-05', 6),
(7, '2017-01-20', 6),
(7, '2017-07-10', 7),
(7, '2018-04-04', 7),
(7, '2019-09-09', 8);

-- User 8
INSERT INTO sales (user_id, created_date, product_id) VALUES
(8, '2017-10-10', 1),
(8, '2018-01-18', 3),
(8, '2018-09-09', 3),
(8, '2020-03-03', 9);

-- User 9
INSERT INTO sales (user_id, created_date, product_id) VALUES
(9, '2018-06-06',11),
(9, '2018-12-12',11),
(9, '2019-03-30', 8),
(9, '2020-07-07',10);

-- User 10
INSERT INTO sales (user_id, created_date, product_id) VALUES
(10,'2017-02-02', 2),
(10,'2018-05-15', 5),
(10,'2019-01-25', 2),
(10,'2020-09-09', 7);

SELECT TOP 5 * FROM sales;

SELECT 
    p.product_id,
    p.product_name,
    COUNT(s.product_id) AS total_quantity_sold,
    SUM(p.price) AS total_revenue
FROM sales s
JOIN product p
    ON s.product_id = p.product_id
GROUP BY 
    p.product_id,
    p.product_name
ORDER BY 
    total_revenue DESC;

	SELECT TOP 3
    p.product_id,
    p.product_name,
    COUNT(s.product_id) AS total_quantity_sold,
    SUM(p.price) AS total_revenue
FROM sales s
JOIN product p
    ON s.product_id = p.product_id
GROUP BY 
    p.product_id,
    p.product_name
ORDER BY 
    total_revenue DESC;

	SELECT 
    (SELECT COUNT(*) FROM users) AS total_signed_up_users,
    (SELECT COUNT(*) FROM goldusers_signup) AS total_gold_users;

	SELECT 
    SUM(p.price) AS total_revenue_from_gold_users
FROM sales s
JOIN goldusers_signup g
    ON s.user_id = g.user_id
JOIN product p
    ON s.product_id = p.product_id;

	SELECT 
    SUM(p.price) AS total_revenue_from_gold_users
FROM sales s
JOIN goldusers_signup g
    ON s.user_id = g.user_id
JOIN product p
    ON s.product_id = p.product_id;

	SELECT 
    g.user_id,
    u.user_name,
    g.gold_signup_date,
    DATEDIFF(YEAR,  g.gold_signup_date, GETDATE())  AS years_as_gold,
    DATEDIFF(MONTH, g.gold_signup_date, GETDATE())  AS months_as_gold,
    DATEDIFF(DAY,   g.gold_signup_date, GETDATE())  AS days_as_gold
FROM goldusers_signup g
JOIN user_name u
    ON g.user_id = u.user_id
ORDER BY g.gold_signup_date;

SELECT TOP 1
    p.product_id,
    p.product_name,
    COUNT(s.product_id) AS total_orders_by_gold_users
FROM sales s
JOIN goldusers_signup g
    ON s.user_id = g.user_id
JOIN product p
    ON s.product_id = p.product_id
GROUP BY 
    p.product_id,
    p.product_name
ORDER BY 
    total_orders_by_gold_users DESC;

	SELECT 
    YEAR(s.created_date) AS sales_year,
    SUM(p.price) AS total_revenue
FROM sales s
JOIN product p
    ON s.product_id = p.product_id
GROUP BY 
    YEAR(s.created_date)
ORDER BY 
    sales_year;

	WITH yearly_revenue AS (
    SELECT 
        YEAR(s.created_date) AS sales_year,
        SUM(p.price) AS total_revenue
    FROM sales s
    JOIN product p
        ON s.product_id = p.product_id
    GROUP BY YEAR(s.created_date)
)

WITH yearly_revenue AS (
    SELECT 
        YEAR(s.created_date) AS sales_year,
        SUM(p.price) AS total_revenue
    FROM sales s
    JOIN product p
        ON s.product_id = p.product_id
    GROUP BY YEAR(s.created_date)
)

SELECT
    y1.sales_year,
    y1.total_revenue,
    y2.total_revenue AS previous_year_revenue,
    (y1.total_revenue - y2.total_revenue) AS revenue_change,
    CASE 
        WHEN y2.total_revenue IS NULL THEN NULL
        ELSE ROUND(
            (y1.total_revenue - y2.total_revenue) * 100.0 / y2.total_revenue,
            2
        )
    END AS percentage_change
FROM (
    SELECT 
        YEAR(s.created_date) AS sales_year,
        SUM(p.price) AS total_revenue
    FROM sales s
    JOIN product p
        ON s.product_id = p.product_id
    GROUP BY YEAR(s.created_date)
) AS y1
LEFT JOIN (
    SELECT 
        YEAR(s.created_date) AS sales_year,
        SUM(p.price) AS total_revenue
    FROM sales s
    JOIN product p
        ON s.product_id = p.product_id
    GROUP BY YEAR(s.created_date)
) AS y2
    ON y1.sales_year = y2.sales_year + 1
ORDER BY y1.sales_year;

SELECT 
    (SELECT COUNT(*) FROM users) AS total_users,
    (SELECT COUNT(*) FROM goldusers_signup) AS gold_users,
    ROUND(
        ( (SELECT COUNT(*) FROM goldusers_signup) * 100.0 ) 
        / (SELECT COUNT(*) FROM users),
        2
    ) AS gold_percentage


	SELECT 
    g.user_id,
    u.user_name,
    
    -- Orders BEFORE becoming gold
    SUM(CASE WHEN s.created_date < g.gold_signup_date THEN 1 ELSE 0 END) AS orders_before_gold,
    
    -- Orders AFTER becoming gold
    SUM(CASE WHEN s.created_date >= g.gold_signup_date THEN 1 ELSE 0 END) AS orders_after_gold
    
FROM goldusers_signup g
JOIN sales s 
    ON g.user_id = s.user_id
JOIN user_name u
    ON g.user_id = u.user_id
GROUP BY 
    g.user_id,
    u.user_name
ORDER BY 
    g.user_id;

	SELECT
    u.user_id,
    un.user_name,
    SUM(p.price) AS total_amount_spent
FROM sales s
JOIN product p
    ON s.product_id = p.product_id
JOIN users u
    ON s.user_id = u.user_id
JOIN user_name un
    ON s.user_id = un.user_id
GROUP BY 
    u.user_id,
    un.user_name
ORDER BY 
    total_amount_spent DESC;

	SELECT 
    s.user_id,
    un.user_name,
    COUNT(*) AS visit_frequency
FROM sales s
JOIN user_name un
    ON s.user_id = un.user_id
GROUP BY 
    s.user_id,
    un.user_name
ORDER BY 
    visit_frequency DESC;

	WITH first_order AS (
    SELECT
        s.user_id,
        un.user_name,
        s.created_date,
        p.product_name,
        ROW_NUMBER() OVER (PARTITION BY s.user_id ORDER BY s.created_date) AS rn
    FROM sales s
    JOIN product p
        ON s.product_id = p.product_id
    JOIN user_name un
        ON s.user_id = un.user_id
)

SELECT 
    user_id,
    user_name,
    created_date AS first_order_date,
    product_name AS first_product_ordered
FROM first_order
WHERE rn = 1
ORDER BY user_id;

SELECT TOP 1
    p.product_id,
    p.product_name,
    COUNT(s.product_id) AS total_times_purchased
FROM sales s
JOIN product p
    ON s.product_id = p.product_id
GROUP BY 
    p.product_id,
    p.product_name
ORDER BY 
    total_times_purchased DESC;

	WITH user_product_counts AS (
    SELECT
        s.user_id,
        un.user_name,
        p.product_id,
        p.product_name,
        COUNT(*) AS order_count,
        ROW_NUMBER() OVER (
            PARTITION BY s.user_id
            ORDER BY COUNT(*) DESC
        ) AS rn
    FROM sales s
    JOIN product p
        ON s.product_id = p.product_id
    JOIN user_name un
        ON s.user_id = un.user_id
    GROUP BY
        s.user_id,
        un.user_name,
        p.product_id,
        p.product_name
)

SELECT
    user_id,
    user_name,
    product_id,
    product_name,
    order_count AS times_ordered
FROM user_product_counts
WHERE rn = 1
ORDER BY user_id;

WITH first_after_gold AS (
    SELECT
        g.user_id,
        un.user_name,
        s.created_date,
        p.product_name,
        ROW_NUMBER() OVER (
            PARTITION BY g.user_id
            ORDER BY s.created_date
        ) AS rn
    FROM goldusers_signup g
    JOIN sales s
        ON g.user_id = s.user_id
    JOIN product p
        ON s.product_id = p.product_id
    JOIN user_name un
        ON g.user_id = un.user_id
    WHERE s.created_date >= g.gold_signup_date
)

SELECT
    user_id,
    user_name,
    created_date AS first_order_after_gold_date,
    product_name AS first_product_after_gold
FROM first_after_gold
WHERE rn = 1
ORDER BY user_id;

WITH last_before_gold AS (
    SELECT
        g.user_id,
        un.user_name,
        s.created_date,
        p.product_name,
        ROW_NUMBER() OVER (
            PARTITION BY g.user_id
            ORDER BY s.created_date DESC
        ) AS rn
    FROM goldusers_signup g
    JOIN sales s
        ON g.user_id = s.user_id
    JOIN product p
        ON s.product_id = p.product_id
    JOIN user_name un
        ON g.user_id = un.user_id
    WHERE s.created_date < g.gold_signup_date
)

SELECT
    user_id,
    user_name,
    created_date AS last_order_before_gold_date,
    product_name AS last_product_before_gold
FROM last_before_gold
WHERE rn = 1
ORDER BY user_id;

SELECT
    g.user_id,
    un.user_name,
    COUNT(*) AS total_orders_before_gold,
    SUM(p.price) AS total_amount_before_gold
FROM goldusers_signup g
JOIN sales s
    ON g.user_id = s.user_id
JOIN product p
    ON s.product_id = p.product_id
JOIN user_name un
    ON g.user_id = un.user_id
WHERE s.created_date < g.gold_signup_date
GROUP BY 
    g.user_id,
    un.user_name
ORDER BY 
    total_amount_before_gold DESC;

	WITH gold_orders AS (
    SELECT 
        s.sale_id,
        s.user_id,
        s.created_date,
        ROW_NUMBER() OVER (
            PARTITION BY s.user_id
            ORDER BY s.created_date
        ) AS gold_rank
    FROM sales s
    JOIN goldusers_signup g
        ON s.user_id = g.user_id
       AND s.created_date >= g.gold_signup_date
)

SELECT
    s.sale_id,
    s.user_id,
    s.created_date,
    p.product_name,
    ISNULL(CAST(g.gold_rank AS VARCHAR(10)), 'NA') AS gold_transaction_rank
FROM sales s
LEFT JOIN gold_orders g
    ON s.sale_id = g.sale_id
JOIN product p
    ON s.product_id = p.product_id
ORDER BY 
    s.user_id, 
    s.created_date;




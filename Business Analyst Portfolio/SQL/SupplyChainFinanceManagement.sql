CREATE DATABASE SupplyChainFinanceManagement;


USE SupplyChainFinanceManagement;

CREATE TABLE dim_customer (
    customer_code   INT PRIMARY KEY,
    customer        VARCHAR(100),
    platform        VARCHAR(50),
    channel         VARCHAR(50),
    market          VARCHAR(50),
    sub_zone        VARCHAR(50),
    region          VARCHAR(50)
);

CREATE TABLE dim_product (
    product_code VARCHAR(20) PRIMARY KEY,
    division     VARCHAR(50),
    segment      VARCHAR(50),
    category     VARCHAR(50),
    product      VARCHAR(100),
    variant      VARCHAR(100)
);

CREATE TABLE fact_forecast_monthly (
    date_             DATE,
    fiscal_year       INT,
    product_code      VARCHAR(20),
    customer_code     INT,
    forecast_quantity INT,
    FOREIGN KEY (product_code)  REFERENCES dim_product(product_code),
    FOREIGN KEY (customer_code) REFERENCES dim_customer(customer_code)
);

CREATE TABLE fact_freight_cost (
    market         VARCHAR(50),
    fiscal_year    INT,
    freight_pct    DECIMAL(10,4),
    other_cost_pct DECIMAL(10,4),
    PRIMARY KEY (market, fiscal_year)
);

CREATE TABLE fact_gross_price (
    product_code VARCHAR(20),
    fiscal_year  INT,
    gross_price  DECIMAL(10,4),
    PRIMARY KEY (product_code, fiscal_year),
    FOREIGN KEY (product_code) REFERENCES dim_product(product_code)
);

CREATE TABLE fact_manufacturing_cost (
    product_code       VARCHAR(20),
    cost_year          INT,
    manufacturing_cost DECIMAL(10,4),
    PRIMARY KEY (product_code, cost_year),
    FOREIGN KEY (product_code) REFERENCES dim_product(product_code)
);

CREATE TABLE fact_post_invoice_deductions (
    customer_code        INT,
    product_code         VARCHAR(20),
    date_                DATE,
    discounts_pct        DECIMAL(10,4),
    other_deductions_pct DECIMAL(10,4),
    FOREIGN KEY (customer_code) REFERENCES dim_customer(customer_code),
    FOREIGN KEY (product_code)  REFERENCES dim_product(product_code)
);

CREATE TABLE fact_pre_invoice_deductions (
    customer_code            INT,
    fiscal_year              INT,
    pre_invoice_discount_pct DECIMAL(10,4),
    PRIMARY KEY (customer_code, fiscal_year),
    FOREIGN KEY (customer_code) REFERENCES dim_customer(customer_code)
);

CREATE TABLE fact_sales_monthly (
    date_                     DATE,
    fiscal_year               INT,
    customer_code             INT,
    product_code              VARCHAR(20),
    sold_quantity             INT,
    gross_price_per_item      DECIMAL(10,4),
    pre_invoice_discount_pct  DECIMAL(10,4),
    FOREIGN KEY (customer_code) REFERENCES dim_customer(customer_code),
    FOREIGN KEY (product_code)  REFERENCES dim_product(product_code)
);



INSERT INTO dim_product (product_code, division, segment, category, product, variant)
VALUES
('P001', 'Peripherals', 'Mouse',    'Wireless Mouse',   'AtliQ Wireless Mouse',     'Black'),
('P002', 'Peripherals', 'Keyboard', 'Mechanical KB',    'AtliQ Mech Keyboard',      'RGB'),
('P003', 'Computers',   'Laptop',   'Gaming Laptop',    'AtliQ Gaming Laptop 15',   '16GB RAM'),
('P004', 'Printers',    'Printer',  'Laser Printer',    'AtliQ Laser Printer Pro',  'WiFi'),
('P005', 'Peripherals', 'Headset',  'Gaming Headset',   'AtliQ Surround Headset',   '7.1');

INSERT INTO fact_gross_price (product_code, fiscal_year, gross_price)
VALUES
('P001', 2021, 30.00),
('P002', 2021, 60.00),
('P003', 2021, 900.00),
('P004', 2021, 200.00),
('P005', 2021, 80.00),

('P001', 2022, 32.00),
('P002', 2022, 65.00),
('P003', 2022, 950.00),
('P004', 2022, 210.00),
('P005', 2022, 85.00);

INSERT INTO fact_manufacturing_cost (product_code, cost_year, manufacturing_cost)
VALUES
('P001', 2021, 18.00),
('P002', 2021, 35.00),
('P003', 2021, 600.00),
('P004', 2021, 120.00),
('P005', 2021, 45.00),

('P001', 2022, 19.00),
('P002', 2022, 37.00),
('P003', 2022, 620.00),
('P004', 2022, 130.00),
('P005', 2022, 48.00);

INSERT INTO fact_freight_cost (market, fiscal_year, freight_pct, other_cost_pct)
VALUES
('India',          2021, 0.0500, 0.0200),
('India',          2022, 0.0480, 0.0210),
('United States',  2021, 0.0600, 0.0250),
('United States',  2022, 0.0580, 0.0260);

INSERT INTO fact_pre_invoice_deductions (customer_code, fiscal_year, pre_invoice_discount_pct)
VALUES
(1001, 2021, 0.0500),
(1002, 2021, 0.0600),
(1003, 2021, 0.0700),
(1004, 2021, 0.0400),
(1005, 2021, 0.0800),

(1001, 2022, 0.0550),
(1002, 2022, 0.0650),
(1003, 2022, 0.0750),
(1004, 2022, 0.0450),
(1005, 2022, 0.0850);

INSERT INTO fact_post_invoice_deductions
(customer_code, product_code, date_, discounts_pct, other_deductions_pct)
VALUES
(1001, 'P001', '2021-10-15', 0.0300, 0.0100),
(1001, 'P003', '2021-11-20', 0.0400, 0.0150),
(1002, 'P002', '2021-12-05', 0.0250, 0.0100),
(1003, 'P005', '2022-01-12', 0.0200, 0.0080),
(1004, 'P004', '2022-02-18', 0.0350, 0.0120);

INSERT INTO fact_sales_monthly
(date_, fiscal_year, customer_code, product_code, sold_quantity, gross_price_per_item, pre_invoice_discount_pct)
VALUES
('2021-09-10', 2021, 1001, 'P001',  500, 30.00, 0.0500),
('2021-09-15', 2021, 1002, 'P002',  300, 60.00, 0.0600),
('2021-10-05', 2021, 1003, 'P003',   50, 900.00, 0.0700),
('2021-11-12', 2021, 1001, 'P002',  150, 60.00, 0.0500),
('2021-12-20', 2021, 1005, 'P005',  400, 80.00, 0.0800),

('2022-01-15', 2022, 1004, 'P004',  120, 210.00, 0.0450),
('2022-02-10', 2022, 1003, 'P001',  600, 32.00, 0.0750),
('2022-03-08', 2022, 1002, 'P005',  350, 85.00, 0.0650),
('2022-04-18', 2022, 1001, 'P003',   70, 950.00, 0.0550),
('2022-05-25', 2022, 1005, 'P002',  250, 65.00, 0.0850);

INSERT INTO fact_forecast_monthly
(date_, fiscal_year, product_code, customer_code, forecast_quantity)
VALUES
('2021-09-01', 2021, 'P001', 1001, 600),
('2021-09-01', 2021, 'P002', 1002, 350),
('2021-10-01', 2021, 'P003', 1003, 60),
('2021-11-01', 2021, 'P005', 1005, 450),

('2022-01-01', 2022, 'P004', 1004, 130),
('2022-02-01', 2022, 'P001', 1003, 650),
('2022-03-01', 2022, 'P005', 1002, 370),
('2022-04-01', 2022, 'P003', 1001, 80);

SELECT TOP 5 * FROM fact_sales_monthly;

CREATE FUNCTION dbo.get_fiscal_year (@date DATE)
RETURNS INT
AS
BEGIN
    DECLARE @fy INT;
    SET @fy = CASE 
                WHEN MONTH(@date) >= 4 THEN YEAR(@date)
                ELSE YEAR(@date) - 1
              END;
    RETURN @fy;
END;

SELECT 
    FORMAT(date_, 'yyyy-MM') AS year_month,
    SUM(sold_quantity) AS total_quantity,
    SUM(sold_quantity * gross_price_per_item) AS gross_sales
FROM fact_sales_monthly
GROUP BY FORMAT(date_, 'yyyy-MM')
ORDER BY year_month;

Net Sales = Gross Sales 
          - (Gross Sales * pre_invoice_discount_pct)
          - (Gross Sales * post_invoice_discount_pct)

SELECT 
    s.date_,
    s.customer_code,
    s.product_code,
    s.sold_quantity,
    gp.gross_price,
    s.pre_invoice_discount_pct,
    pid.discounts_pct AS post_inv_discount,
    
    (s.sold_quantity * gp.gross_price) 
        * (1 - s.pre_invoice_discount_pct - pid.discounts_pct) 
        AS net_invoice_sales

WITH forecast AS (
    SELECT 
        DATEFROMPARTS(YEAR(date_), MONTH(date_), 1) AS month_start,
        customer_code,
        product_code,
        forecast_quantity
    FROM fact_forecast_monthly
),
sales AS (
    SELECT 
        DATEFROMPARTS(YEAR(date_), MONTH(date_), 1) AS month_start,
        customer_code,
        product_code,
        SUM(sold_quantity) AS actual_quantity
    FROM fact_sales_monthly
    GROUP BY 
        DATEFROMPARTS(YEAR(date_), MONTH(date_), 1),
        customer_code,
        product_code
)

WITH forecast AS (
    SELECT 
        DATEFROMPARTS(YEAR(date_), MONTH(date_), 1) AS month_start,
        customer_code,
        product_code,
        forecast_quantity
    FROM fact_forecast_monthly
),
sales AS (
    SELECT 
        DATEFROMPARTS(YEAR(date_), MONTH(date_), 1) AS month_start,
        customer_code,
        product_code,
        SUM(sold_quantity) AS actual_quantity
    FROM fact_sales_monthly
    GROUP BY 
        DATEFROMPARTS(YEAR(date_), MONTH(date_), 1),
        customer_code,
        product_code
)
SELECT *
FROM forecast f;

CREATE VIEW vw_customer_sales AS
SELECT 
    s.customer_code,
    c.customer,
    c.market,
    SUM(s.sold_quantity) AS total_units,
    SUM(s.sold_quantity * s.gross_price_per_item) AS total_gross_sales
FROM fact_sales_monthly s
JOIN dim_customer c ON s.customer_code = c.customer_code
GROUP BY 
    s.customer_code, 
    c.customer, 
    c.market;

	CREATE VIEW vw_gross_to_net AS
SELECT 
    s.date_,
    s.customer_code,
    s.product_code,
    s.sold_quantity,
    gp.gross_price,
    s.pre_invoice_discount_pct,
    pid.discounts_pct AS post_inv_discount,

    -- Gross sales
    (s.sold_quantity * gp.gross_price) AS gross_sales,

    -- Net sales after discounts
    (s.sold_quantity * gp.gross_price) 
        * (1 - s.pre_invoice_discount_pct - ISNULL(pid.discounts_pct, 0)) AS net_sales

FROM fact_sales_monthly s
JOIN fact_gross_price gp 
    ON s.product_code = gp.product_code 
   AND s.fiscal_year  = gp.fiscal_year
LEFT JOIN fact_post_invoice_deductions pid
    ON s.customer_code = pid.customer_code
   AND s.product_code  = pid.product_code
   AND s.date_         = pid.date_;

   CREATE VIEW vw_manufacturing_cost AS
SELECT 
    p.product_code,
    p.product,
    mc.cost_year,
    mc.manufacturing_cost
FROM dim_product p
JOIN fact_manufacturing_cost mc 
    ON p.product_code = mc.product_code;

	CREATE VIEW vw_forecast_accuracy AS
WITH forecast AS (
    SELECT 
        DATEFROMPARTS(YEAR(date_), MONTH(date_), 1) AS month_start,
        customer_code,
        product_code,
        forecast_quantity
    FROM fact_forecast_monthly
),
sales AS (
    SELECT 
        DATEFROMPARTS(YEAR(date_), MONTH(date_), 1) AS month_start,
        customer_code,
        product_code,
        SUM(sold_quantity) AS actual_quantity
    FROM fact_sales_monthly
    GROUP BY 
        DATEFROMPARTS(YEAR(date_), MONTH(date_), 1),
        customer_code,
        product_code
)
SELECT 
    f.month_start,
    f.customer_code,
    f.product_code,
    f.forecast_quantity,
    ISNULL(s.actual_quantity, 0) AS actual_quantity,
    (ISNULL(s.actual_quantity, 0) - f.forecast_quantity) AS variance
FROM forecast f
LEFT JOIN sales s
    ON f.month_start = s.month_start
    AND f.customer_code = s.customer_code
    AND f.product_code = s.product_code;

	CREATE PROCEDURE sp_get_net_sales_summary
    @fiscal_year INT
AS
BEGIN
    SELECT 
        s.fiscal_year,
        s.customer_code,
        c.customer,
        SUM(s.sold_quantity * gp.gross_price) AS total_gross_sales,
        SUM(
            (s.sold_quantity * gp.gross_price) 
            * (1 - s.pre_invoice_discount_pct - ISNULL(pid.discounts_pct, 0))
        ) AS total_net_sales
    FROM fact_sales_monthly s
    JOIN dim_customer c
        ON s.customer_code = c.customer_code
    JOIN fact_gross_price gp
        ON s.product_code = gp.product_code
       AND s.fiscal_year = gp.fiscal_year
    LEFT JOIN fact_post_invoice_deductions pid
        ON s.customer_code = pid.customer_code
       AND s.product_code = pid.product_code
       AND s.date_ = pid.date_
    WHERE s.fiscal_year = @fiscal_year
    GROUP BY 
        s.fiscal_year,
        s.customer_code,
        c.customer
    ORDER BY total_net_sales DESC;
END;

EXEC sp_get_net_sales_summary @fiscal_year = 2021;

CREATE TABLE sales_audit (
    audit_id       INT IDENTITY(1,1) PRIMARY KEY,
    date_          DATE,
    customer_code  INT,
    product_code   VARCHAR(20),
    sold_quantity  INT,
    log_timestamp  DATETIME DEFAULT GETDATE(),
    action_type    VARCHAR(20)
);

CREATE TRIGGER trg_sales_insert_audit
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    INSERT INTO sales_audit (date_, customer_code, product_code, sold_quantity, action_type)
    SELECT 
        date_,
        customer_code,
        product_code,
        sold_quantity,
        'INSERT'
    FROM inserted;
END;

INSERT INTO fact_sales_monthly
(date_, fiscal_year, customer_code, product_code, sold_quantity, gross_price_per_item, pre_invoice_discount_pct)
VALUES
('2022-06-01', 2022, 1001, 'P001', 100, 32.00, 0.05);

SELECT * FROM sales_audit;



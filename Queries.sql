CREATE DATABASE testDB;
CREATE TABLE customers (
    customer_id INT,
    name TEXT,
    country TEXT,
    industry TEXT,
    risk_score INT
);

CREATE TABLE shareholders (
    shareholder_id INT,
    customer_id INT,
    name TEXT,
    ownership TEXT
);

CREATE TABLE screening (
    name TEXT,
    pep_flag TEXT,
    sanction_flag TEXT,
    adverse_media TEXT
);

-- Insert into customers
INSERT INTO customers VALUES (1, 'ABC Ltd', 'Sri Lanka', 'Trading', 45);
INSERT INTO customers VALUES (2, 'XYZ Corp', 'UAE', 'Finance', 80);
INSERT INTO customers VALUES (3, 'Amal Silva', 'Sri Lanka', 'Individual', 60);

-- Insert into shareholders
INSERT INTO shareholders VALUES (1, 1, 'John Lee', '60%');
INSERT INTO shareholders VALUES (2, 1, 'Amal Silva', '40%');
INSERT INTO shareholders VALUES (3, 2, 'Global Inc', '100%');

-- Insert into screening
INSERT INTO screening VALUES ('Amal Silva', 'YES', 'NO', 'YES');
INSERT INTO screening VALUES ('John Lee', 'NO', 'NO', 'NO');
INSERT INTO screening VALUES ('XYZ Corp', 'NO', 'YES', 'YES');

-- List all customers and their shareholders
SELECT c.name AS customer, sh.name AS shareholder, sh.ownership
FROM customers c
LEFT JOIN shareholders sh ON c.customer_id = sh.customer_id;

-- Flag high-risk customers or shareholders
SELECT c.name AS customer_name, c.risk_score, s.pep_flag, s.sanction_flag, s.adverse_media
FROM customers c
LEFT JOIN shareholders sh ON c.customer_id = sh.customer_id
LEFT JOIN screening s ON s.name = sh.name
WHERE c.risk_score > 50 OR s.pep_flag = 'YES' OR s.sanction_flag = 'YES';

-- Calculate total risk exposure per customer
SELECT c.name AS customer_name, SUM(c.risk_score) AS total_risk_score
FROM customers c
JOIN shareholders sh ON c.customer_id = sh.customer_id
GROUP BY c.name;

-- Identify customers with potential issues
SELECT DISTINCT c.name AS customer_name
FROM customers c
LEFT JOIN shareholders sh ON c.customer_id = sh.customer_id
LEFT JOIN screening s ON s.name = sh.name
WHERE s.pep_flag = 'YES' OR s.sanction_flag = 'YES' OR s.adverse_media = 'YES';

SELECT * FROM customers;


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

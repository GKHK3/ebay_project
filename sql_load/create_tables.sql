CREATE TABLE daily_performance (
    date DATE NOT NULL,
    product VARCHAR(50) NOT NULL,
    views INTEGER,
    watchers INTEGER,
    price NUMERIC(10,2),
    price_delivery NUMERIC(10,2),
    sales INTEGER DEFAULT 0,

    PRIMARY KEY (date, product)
);
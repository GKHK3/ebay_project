CREATE TABLE listing_changes(
    change_id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    product VARCHAR(50) NOT NULL,
    change_type VARCHAR(100),
    description TEXT
);
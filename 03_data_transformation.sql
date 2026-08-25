-- STEP 1: Creating a cleaned base view for Airbnb listings
CREATE OR REPLACE VIEW v_listings_cleaned AS
SELECT 
    id,
    name,
    room_type,
    neighbourhood_cleansed AS district,
    REPLACE(REPLACE(price, '$', ''), ',', '')::NUMERIC AS price, -- Cleaned price in SEK
    beds,
    number_of_reviews AS total_reviews,
    review_scores_rating AS rating,
    availability_365 AS days_available_year
FROM 
    raw_listings
WHERE 
    -- Filtering out the Amsterdam geospatial anomaly
    latitude BETWEEN 59.0 AND 60.0
    AND longitude BETWEEN 17.0 AND 19.5;


-- STEP 2: Creating a production-ready data mart for Power BI Dashboard
CREATE OR REPLACE VIEW v_district_investment_summary AS
SELECT 
    district,
    COUNT(id) AS total_properties,
    ROUND(AVG(rating)::NUMERIC, 2) AS avg_rating,
    ROUND(AVG(price)::NUMERIC, 2) AS avg_price_per_night, -- In SEK
    ROUND(AVG(price * (365 - days_available_year))::NUMERIC, 2) AS avg_estimated_annual_revenue, -- In SEK
    ROUND(AVG(total_reviews)::NUMERIC, 1) AS avg_reviews_count,
    ROUND((AVG(rating) / AVG(price) * 100)::NUMERIC, 3) AS value_for_money_index
FROM 
    v_listings_cleaned
WHERE 
    days_available_year < 365 
    AND price > 0
    AND rating IS NOT NULL
GROUP BY 
    district
HAVING 
    COUNT(id) >= 30;

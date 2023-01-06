-- Looking at revenue by each year based on hotel type
-- CTE to refer to this query in further queries
Use Project
With hotels AS (
SELECT * FROM Project..['2018$']
UNION
SELECT * FROM Project..['2019$']
UNION
SELECT * FROM Project..['2020$'])

Select sum((q.stays_in_weekend_nights+q.stays_in_week_nights)*q.adr*q.Discount) AS revenue 
From(Select * From hotels
Left Join meal_cost$ ON meal_cost$.meal = hotels.meal
Left Join market_segment$ ON market_segment$.market_segment = hotels.market_segment) AS q



-- Looking at the result we see the revenue is increasing
Select arrival_date_year, hotel,
round(sum((stays_in_weekend_nights+stays_in_week_nights)*adr),2) as Revenue
From hotels
Group By arrival_date_year, hotel


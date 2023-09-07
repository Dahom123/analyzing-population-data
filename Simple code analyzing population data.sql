CREATE TABLE population_data (
    id SERIAL PRIMARY KEY,
    country VARCHAR(255),
    year INT,
    population INT
	--Get the total population for a specific country in a given year:
	SELECT country, year, SUM(population) AS total_population
FROM population_data
WHERE country = 'YourCountry' AND year = 2022
GROUP BY country, year;


-----Find the country with the highest population in a specific year:



SELECT year, country, MAX(population) AS max_population
FROM population_data
WHERE year = 2022
GROUP BY year, country;

--Calculate the average population for each year:
SELECT year, AVG(population) AS average_population
FROM population_data
GROUP BY year
ORDER BY year;

---Find the top N countries with the highest population in a specific year:

SELECT year, country, population
FROM population_data
WHERE year = 2022
ORDER BY population DESC
LIMIT 10; -- Change '10' to the desired number of countries

--Calculate the population growth rate between two years for a specific country:


SELECT country,
       (p2.population - p1.population) AS population_growth,
       (p2.population - p1.population) / p1.population * 100 AS growth_rate_percent
FROM population_data p1
JOIN population_data p2
ON p1.country = p2.country
WHERE p1.year = 2020 AND p2.year = 2022;
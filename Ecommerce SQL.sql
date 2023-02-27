-- 1. Create new schema as ecommerce
create schema ecommerce;
-- 2. Import .csv file users_data into MySQL
use ecommerce;
select count(*) from users_data;
-- 3. Run SQL command to see the structure of table
DESC users_data;
-- 4. Run SQL command to select first 100 rows of the database
select * from users_data limit 100;
-- 5. How many distinct values exist in table for field country and languag
SELECT COUNT(DISTINCT country), COUNT(DISTINCT language) FROM users_data;
-- 6. Check whether male users are having maximum followers or female users.
SELECT gender, SUM(socialNbFollowers) FROM users_data GROUP BY gender;

SELECT 'total_users_1', COUNT(hasProfilePicture) FROM users_data
WHERE hasProfilePicture = 'TRUE'
UNION SELECT 'total_users_Application', COUNT(hasAnyApp) FROM users_data
WHERE hasAnyApp = 'TRUE' UNION SELECT 'total_users_Android', COUNT(hasAndroidApp) FROM users_data
WHERE hasAndroidApp = 'TRUE' UNION SELECT 'total_users_Ios', COUNT(hasIosApp) FROM users_data WHERE hasIosApp = 'TRUE';
-- 8. Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers
SELECT count(productsBought) FROM users_data WHERE productsBought > 0 group by country order by count(productsBought) desc;

-- 9. Calculate the total number of sellers for each country and sort the result in ascending order of total number of sellers.
SELECT country,  count(productsSold)  FROM users_data WHERE productsSold > 0 group by country  order by count(productsSold) asc;

-- 10. Display name of top 10 countries having maximum products pass rate.
SELECT DISTINCT country, productsPassRate FROM users_data ORDER BY productsPassRate DESC LIMIT 10;

-- 11. Calculate the number of users on an ecommerce platform for different language choices.
SELECT COUNT(language) FROM users_data;

-- 12. Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform
SELECT ' putting produts in wishlist', COUNT(productsWished) choices FROM users_data WHERE
productsWished > 0 AND gender = 'F'
UNION SELECT 'like socially', COUNT(socialProductsLiked) choices2 FROM users_data WHERE
socialProductsLiked > 0 AND gender = 'F';
-- 13. Check the choice of male users about being seller or buyer.
SELECT 'selling', COUNT(productsSold) choices FROM users_data WHERE productsSold > 0 AND gender = 'M' UNION SELECT
'buying', COUNT(productsBought) choices2 FROM users_data WHERE productsBought > 0 AND gender = 'M';

-- 14. Which country is having maximum number of buyers?
SELECT country,count(productsBought) FROM users_data group by country order by count(productsBought) desc limit 1;

-- 15. List the name of 10 countries having zero number of sellers.
SELECT country FROM users_data WHERE country=all(select productsSold=0) group by country LIMIT 10;

-- 16. Display record of top 110 users who have used ecommerce platform recently.
SELECT * FROM users_data ORDER BY daysSinceLastLogin LIMIT 110;

-- 17. Calculate the number of female users those who have not logged in since last 100 days.
SELECT COUNT(gender) female FROM users_data WHERE gender = 'F' AND daysSinceLastLogin = 100;

-- 18. Display the number of female users of each country at ecommerce platform.
SELECT country, COUNT(gender) female_users FROM users_data WHERE gender = 'F' AND hasAnyApp = 'TRUE' GROUP BY country;

-- 19. Display the number of male users of each country at ecommerce platform.
SELECT country, COUNT(gender) male_users FROM users_data WHERE gender = 'M' AND hasAnyApp = 'TRUE' GROUP BY country;

-- 20. Calculate the average number of products sold and bought on ecommerce platform by male users for each country.
 SELECT AVG(productsSold) Sold, AVG(productsBought) Bought FROM users_data WHERE gender = 'M' AND hasAnyApp = 'TRUE' GROUP BY country;


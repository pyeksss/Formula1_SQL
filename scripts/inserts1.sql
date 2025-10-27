-- data preparation

ALTER TABLE drivers ADD COLUMN dob_date date;
UPDATE drivers
SET dob_date = TO_DATE(dob, 'DD/MM/YYYY')
WHERE dob ~ '^\d{2}/\d{2}/\d{4}$'
  AND TO_DATE(dob, 'DD/MM/YYYY') >= '1900-01-01'
  AND TO_DATE(dob, 'DD/MM/YYYY') <= CURRENT_DATE;

UPDATE drivers AS d
SET dob_date = v.new_dob::date
FROM (
    VALUES
    (589, '1899-08-03'),
    (703, '1898-11-01'),
    (741, '1896-12-28'),
    (750, '1899-10-15'),
    (760, '1899-10-13'),
    (786, '1898-06-09'),
    (791, '1898-08-18')
) AS v("driverId", new_dob)
WHERE d."driverId" = v."driverId";
 
-- 1. search for racers born after 1990 and sort by last name
SELECT 
    "driverId" 
    forename,
    surname,
    dob_date
FROM 
    drivers
WHERE 
    dob_date > '01/01/1990'
ORDER BY 
    surname ASC;

-- 2. search for the number of races by country
SELECT c.country, 
    COUNT(r."raceId") AS race_count
FROM race r
JOIN circuits c ON r."circuitId" = c."circuitId"
GROUP BY c.country
HAVING COUNT(r."raceId") > 5
ORDER BY race_count DESC;

-- 3. connecting race and track to find out where each race took place
SELECT r."raceId", r.name AS race_name, c.name AS circuit_name, c.country
FROM race r
INNER JOIN circuits c ON r."circuitId" = c."circuitId"
ORDER BY r.year DESC, r.round;

-- 4. names of the 10 pilots with the most victories
SELECT d.forename, d.surname, COUNT(*) AS wins
FROM results res
JOIN drivers d ON res."driverId" = d."driverId"
WHERE res.position = 1
GROUP BY d.forename, d.surname
ORDER BY wins DESC
LIMIT 10;

-- 5. average points a team scores per race
SELECT c.name AS constructor, ROUND(AVG(res.points),2) AS avg_points
FROM results res
JOIN constructors c ON res."constructorId" = c."constructorId"
GROUP BY c.name
ORDER BY avg_points DESC;

-- 6. pilots who have never won a race
SELECT forename, surname
FROM drivers
WHERE "driverId" NOT IN (
    SELECT DISTINCT "driverId" FROM results WHERE position = 1);


-- 7. races where participants scored more points overall than usual
SELECT re."raceId", r.name, r.year, AVG(points) AS avg_points
FROM results re
JOIN race r ON r."raceId" = re."raceId"
GROUP BY re."raceId", r.name, r.year
HAVING AVG(points) > (
    SELECT AVG(points) FROM results)
ORDER BY avg_points DESC;


-- 8. average pit stop time per race
SELECT r.name AS race_name, ROUND(AVG(p.milliseconds)/1000.0,2) AS avg_pit_time_sec
FROM pitstops p
JOIN race r ON p."raceId" = r."raceId"
GROUP BY r.name
ORDER BY avg_pit_time_sec ASC
LIMIT 10;


-- 9. pilot rankings in the championship for each season
SELECT 
    s.year,
    d.forename,
    d.surname,
    SUM(r.points) AS total_points,
    RANK() OVER (PARTITION BY s.year ORDER BY SUM(r.points) DESC) AS season_rank
FROM results r
JOIN race ra ON r."raceId" = ra."raceId"
JOIN seasons s ON ra.year = s.year
JOIN drivers d ON r."driverId" = d."driverId"
GROUP BY s.year, d."driverId", d.forename, d.surname
ORDER BY s.year DESC, season_rank;


-- 10. the difference in points between first and second place in each race
	SELECT 
	    "raceId",
	    "driverId",
	    points,
	    points - LEAD(points) OVER (PARTITION BY "raceId" ORDER BY points DESC) AS diff_with_next
	FROM results
	WHERE position <= 2;


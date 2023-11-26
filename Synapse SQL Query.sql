-- Top 5 Countries by Total Medals Won
WITH TotalMedals AS (
    SELECT Team_Country, SUM(Gold + Silver + Bronze) AS TotalMedals
    FROM Medals
    GROUP BY Team_Country
)
SELECT Team_Country, TotalMedals
FROM TotalMedals
ORDER BY TotalMedals DESC
LIMIT 5;


-- Number of Coaches per Discipline and the Discipline with the most coaches.
WITH CoachesCount AS (
    SELECT Discipline, COUNT(*) AS NumberOfCoaches
    FROM Coaches
    GROUP BY Discipline
)
SELECT Discipline, NumberOfCoaches
FROM CoachesCount
ORDER BY NumberOfCoaches DESC
LIMIT 1;


-- Gender Ratio Among Athletes for Each Discipline
WITH GenderCounts AS (
    SELECT 
        a.Discipline,
        COUNT(CASE WHEN e.Gender = 'Male' THEN 1 END) AS MaleCount,
        COUNT(CASE WHEN e.Gender = 'Female' THEN 1 END) AS FemaleCount
    FROM Athletes a
    INNER JOIN EntriesGender e ON a.Discipline = e.Discipline
    GROUP BY a.Discipline
)
SELECT 
    Discipline, 
    MaleCount, 
    FemaleCount,
    ROUND(CAST(FemaleCount AS FLOAT) / MaleCount, 2) AS GenderRatio
FROM GenderCounts;


-- Country with the Highest Number of Athletes but Lowest Number of Medals
WITH CountryAthleteCount AS (
    SELECT Country, COUNT(*) AS AthleteCount
    FROM Athletes
    GROUP BY Country
), CountryMedalCount AS (
    SELECT Team_Country, SUM(Gold + Silver + Bronze) AS TotalMedals
    FROM Medals
    GROUP BY Team_Country
)
SELECT a.Country, a.AthleteCount, COALESCE(m.TotalMedals, 0) AS TotalMedals
FROM CountryAthleteCount a
LEFT JOIN CountryMedalCount m ON a.Country = m.Team_Country
ORDER BY TotalMedals ASC, AthleteCount DESC
LIMIT 1;


-- Average Number of Athletes in Each Team Event
WITH TeamAthleteCounts AS (
    SELECT t.Event, COUNT(*) AS AthleteCount
    FROM Teams t
    INNER JOIN Athletes a ON t.TeamName = a.TeamName AND t.Discipline = a.Discipline
    GROUP BY t.Event
)
SELECT Event, AVG(AthleteCount) AS AverageAthletes
FROM TeamAthleteCounts
GROUP BY Event;


-- Dense Ranking of Athletes by Participation in Multiple Disciplines
SELECT 
    PersonName, 
    COUNT(DISTINCT Discipline) AS NumberOfDisciplines,
    DENSE_RANK() OVER (ORDER BY COUNT(DISTINCT Discipline) DESC) AS DisciplineRank
FROM Athletes
GROUP BY PersonName;


--  Ranking Sports by Gender Participation Disparity
SELECT 
    Discipline, 
    ABS(Female - Male) AS GenderDisparity,
    RANK() OVER (ORDER BY ABS(Female - Male) DESC) AS DisparityRank
FROM EntriesGender;

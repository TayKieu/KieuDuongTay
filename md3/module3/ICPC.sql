create database dethamkhao;
use dethamkhao;
create table icpc(
TeamName varchar(100) ,
UniversityName varchar(100),
ProblemID varchar(50),
Time int,
Result varchar(5));

SELECT TeamName, UniversityName, SUM(`Time`) AS TotalTime 
                        FROM ICPC WHERE Result = 'AC'  
                        GROUP BY TeamName, UniversityName 
                        ORDER BY TotalProblems DESC, TotalTime;
			
            
        select *  FROM ICPC WHERE Result = 'AC'  
        group by TeamName;
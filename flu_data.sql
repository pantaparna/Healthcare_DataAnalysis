
/* 
Obejectives: come up with flu shot dashboard for 2022 that does the following

1) Total number of patients getting flu shots stratified by
a)Age
b)Race
c)County
d)Overall

2)Runnig total of flu shot over the course of 2022
3)Total number of flu shots given in 2022
4)A list of patients that show whether or not they recieve a flue shot

Requirement
Patient must have been 'Active at our hospital'.
*/

# Use JOINS AND CTE to extract data of interest
# Export data in a csv file format for further analysis using Tableau       



with flu_shot_2022 as
(SELECT Patient, min(date) as earliest_flu_date 
FROM immunizations
where CODE = '5302'
AND DATE between '2022-01-01 00:00' and '2022-12-31 23:59'
group by Patient)


SELECT TIMESTAMPDIFF(YEAR, pat.birthdate, CURDATE()) AS age,
       pat.id,
       pat.FirstName as first,
       pat.LastName as last,
       pat.county,
       pat.Race,
       pat.ethnicity,
       pat.gender,
       flu.earliest_flu_date,
       flu.patient,
       case when flu.patient is not null then 1
       else 0
       end as flu_shot_2022
FROM patients as pat
Left Join flu_shot_2022 as flu
on pat.id = flu.patient;
       

















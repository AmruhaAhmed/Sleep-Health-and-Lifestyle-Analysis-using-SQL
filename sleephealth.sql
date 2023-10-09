--checking the number of rows in the table
select count(*) from sleeptable;

--checking the type of values BMI_Category column is taking
select distinct BMI_Category  from sleeptable;
-- Overweight
-- Normal
-- Obese
-- Normal Weight

-- Overweight and obese have the same meaning, so all entries in the table containing either Overweight/obese are changed to Obese
update sleeptable set BMI_Category='Obese' where BMI_Category in('Overweight','obese');

--Normal and Normal Weight have the same meaning so all instances of Normal Weight are changed to Normal
update sleeptable set BMI_Category='Normal' where BMI_Category is 'Normal Weight';

--checking  the average sleep duration per occupation
select Occupation,avg(Sleep_Duration) from sleeptable group by Occupation order by avg(Sleep_Duration) desc;
-- Lawyer|7.41063829787234
-- Engineer|7.36923076923077
-- Accountant|7.21935483870968
-- Doctor|6.88769230769231
-- Teacher|6.85
-- Nurse|6.75714285714286
-- Software Engineer|6.75
-- Salesperson|6.47272727272727
-- Scientist|6.0
-- Sales Representative|5.9
--Lawyers and Engineers have the highest amount of average sleep duration whereas Scientists and Sales Representatives have the least amount of average sleep duration

--checking the average sleep duration per BMI_Category
select BMI_Category,avg(Sleep_Duration) from sleeptable group by BMI_Category order by avg(Sleep_Duration) desc;
-- Normal|7.14727272727273
-- Obese|6.49142857142857
--Normal people have a higher amount of average sleep duration than obese people

--checking the average stress level per occupation
select Occupation,avg(Stress_Level) from sleeptable group by Occupation order by avg(Stress_Level) asc;
-- Accountant|4.12903225806452
-- Engineer|4.30769230769231
-- Teacher|5.0625
-- Lawyer|5.06382978723404
-- Nurse|6.0
-- Software Engineer|6.0
-- Salesperson|7.0
-- Scientist|7.0
-- Doctor|7.01538461538462
-- Sales Representative|8.0
-- The average stress level for Accountants and Engineers is the least and it is highest for Doctors and Sales Representative

--checking the average sleep duration per age 
select age,avg(Sleep_Duration) from sleeptable group by age order by avg(Sleep_Duration) desc ;
-- 30|7.56923076923077
-- 40|7.55
-- 41|7.53333333333333
-- 31|7.44444444444444
-- 42|7.43333333333333
-- 37|7.25
-- 39|7.24
-- 35|7.21666666666667
-- 38|7.185
-- 36|7.06666666666667
-- 29|6.66923076923077
-- 43|6.61428571428571
-- 32|6.58823529411765
-- 27|6.1
-- 33|6.06153846153846
-- 28|6.02
-- 34|5.8
-- people of ages 30 and 40 years have the highest sleep duration whereas people of ages 28 and 34 years have the least sleep duration

--checking the count of people suffering from sleep disorders
select distinct Sleep_Disorder,count(*) from sleeptable group by Sleep_Disorder;
-- Insomnia|24
-- None|161
-- Sleep Apnea|15
--Out of 200 people, 161 people do not have any sleep disorders,24 people suffer from insomnia and 15 people suffer from Sleep Apnea

-- checking the average stress level of all the people
select avg(Stress_Level) from sleeptable;
-- 5.73

--checking the average stress level per disorder
select Sleep_Disorder,avg(Stress_Level) from sleeptable group by Sleep_Disorder order by avg(Stress_Level) asc;
-- None|5.54037267080745
-- Insomnia|6.41666666666667
-- Sleep Apnea|6.66666666666667
-- people having no sleep disorders have a lower stress level as compared to those suffering from sleep apnea

--checking the average sleep duration per gender
select Gender,avg(Sleep_Duration) from sleeptable group by Gender order by avg(Sleep_Duration) desc;
-- Male|7.03835616438356
-- Female|7.01666666666666

--checking the average sleep duration by considering the quality of sleep
select Quality_of_Sleep,avg(Sleep_Duration) from sleeptable group by Quality_of_Sleep order by avg(Sleep_Duration) desc;
-- 9|8.0
-- 7|7.54761904761904
-- 8|7.34301075268817
-- 5|6.5
-- 6|6.1921568627451
-- 4|5.86
--People having the quality of sleep of 9 out of 10 have the highest avg sleep duration and the people having the quality of sleep of 4 out of 10 have the lowest average sleep duration

--checking the average stress level per gender
select Gender,avg(Stress_Level) from sleeptable group by Gender order by avg(Stress_Level) desc;
-- Male|6.11643835616438
-- Female|4.68518518518519

--checking the average stress level in each age
select Age,avg(Stress_Level) from sleeptable group by Age order by avg(Stress_Level) desc;
-- 34|8.0
-- 28|8.0
-- 33|7.69230769230769
-- 29|7.15384615384615
-- 32|6.94117647058824
-- 31|6.22222222222222
-- 43|6.21428571428571
-- 30|6.15384615384615
-- 27|6.0
-- 42|5.66666666666667
-- 40|5.5
-- 41|5.25
-- 39|4.93333333333333
-- 38|4.6
-- 36|4.5
-- 35|4.41666666666667
-- 37|4.25
-- People of ages 34 and 28 years have highest average stress levels and people of ages 37 have the lowest average stress levels

--checking the average stress level for each quality of sleep
select Quality_of_Sleep,avg(Stress_Level) from sleeptable group by Quality_of_Sleep order by avg(Stress_Level) desc;
-- 4|8.0
-- 6|7.56862745098039
-- 5|7.0
-- 7|5.76190476190476
-- 8|4.54838709677419
-- 9|3.0
--people having the quality of sleep of 4 out of 10 have the highest amount of average stress levels whereas people having the best quality sleep of 9 out 10 have the least amount of average stress level

--checking the average Physical Activity Level of all the people
select avg(Physical_Activity_Level) from sleeptable;
--57.215
--on an average, people are devoting 57.215 minutes to Physical Activity each day

--checking the average Physical Activity per Occupation
select Occupation,avg(Physical_Activity_Level) from sleeptable group by Occupation order by avg(Physical_Activity_Level) desc;
-- Lawyer|70.4255319148936
-- Engineer|60.7692307692308
-- Accountant|60.6451612903226
-- Doctor|53.0769230769231
-- Teacher|48.4375
-- Software Engineer|48.0
-- Nurse|46.7142857142857
-- Salesperson|45.0
-- Scientist|41.0
-- Sales Representative|30.0
--Lawyers have the highest average Physical Activity Level of 70.4 minutes each day whereas Sales Representatives have the least average Physical Activity Level of 30 minutes each day

--checking the average Physical Activity Level per stress level
select Stress_Level,avg(Physical_Activity_Level) from sleeptable group by Stress_Level order by avg(Physical_Activity_Level) desc;
-- 5|70.2040816326531
-- 6|69.1627906976744
-- 3|62.5
-- 4|59.7777777777778
-- 7|42.1428571428571
-- 8|31.6842105263158
-- People with the stress level of 8 out of 10 have the least amount of average Physical Activity level of 31.68 minutes each day whereas people having the stress level of 5 out of 10 have the highest average physical activity level of 70.24 minutes each day.

--checking the average Physical_Activity_Level per gender
select Gender,avg(Physical_Activity_Level) from sleeptable group by Gender order by avg(Physical_Activity_Level) desc;
-- Male|57.7191780821918
-- Female|55.8518518518519
--the average Physical_Activity_Level for men and women is comparitively the same

--checking the average Physical_Activity_Level for each BMI Category
select BMI_Category,avg(Physical_Activity_Level) from sleeptable group by BMI_Category order by avg(Physical_Activity_Level) desc;
-- Normal|60.1515151515151
-- Obese|43.3714285714286
-- Normal people spend more time on Physical Activity Everyday than Obese people

--checking the average Physical_Activity_Level for each type of sleep disorder
select Sleep_Disorder,avg(Physical_Activity_Level) from sleeptable group by Sleep_Disorder order by avg(Physical_Activity_Level) asc;
-- Sleep Apnea|44.6
-- Insomnia|45.4166666666667
-- None|60.1490683229814
--people suffering from sleep disorders have a lower average physical activity level as compared to those having no sleep disorders

--checking the average Physical_Activity_Level for each type of Quality_of_Sleep
select Quality_of_Sleep, avg(Physical_Activity_Level) from sleeptable group by Quality_of_Sleep order by avg(Physical_Activity_Level) asc;
-- 4|30.8
-- 6|36.4509803921569
-- 5|37.1428571428571
-- 8|65.752688172043
-- 7|68.9285714285714
-- 9|80.0
-- People having the lowest quality of sleep i.e 4 out of 10 have the least amount of average physical activity .People with the best quality of sleep(9 out of 10) have the highest average physical activity level

--checking the average stress level for each BMI category
select BMI_Category,avg(Stress_Level) from sleeptable group by BMI_Category order by avg(Stress_Level);
-- Normal|5.56969696969697
-- Obese|6.48571428571429

--checking the ID of the person taking the maximum number of steps each day
select Person_ID from sleeptable where Daily_Steps=(select max(Daily_Steps) from sleeptable);
-- 2
-- 3

--checking the average number of steps taken by people each day
select avg(Daily_Steps) from sleeptable;
-- 6760.0

--checking the average daily steps per occupation type
select Occupation,avg(Daily_Steps) from sleeptable group by Occupation order by avg(Daily_Steps) desc ;
-- Lawyer|7661.70212765957
-- Accountant|7051.61290322581
-- Doctor|6907.69230769231
-- Engineer|6015.38461538462
-- Salesperson|6000.0
-- Teacher|5893.75
-- Software Engineer|5800.0
-- Scientist|5350.0
-- Nurse|5028.57142857143
-- Sales Representative|3000.0
-- Lawyers take the highest average steps per day whereas Sales Representatives take the least average steps per day

--checking the average daily steps taken by people of different stress levels
select Stress_Level,avg(Daily_Steps) from sleeptable group by Stress_Level order by avg(Daily_Steps) asc;
-- 7|5204.7619047619
-- 8|5589.47368421053
-- 4|6684.44444444444
-- 6|7458.13953488372
-- 5|7710.20408163265
-- 3|7750.0
-- People with stress level of 7 out of 10 take the least amount of steps every day whereas people with lowest stress level of 3 out of 10 take the most amount of steps everyday

--checking the average number of steps per gender
select Gender,avg(Daily_Steps) from sleeptable group by Gender order by avg(Daily_Steps) ;
-- Female|6425.92592592593
-- Male|6883.56164383562
--Males  take higher number of daily steps than females

--checking the average number of steps for each sleep disorder
select Sleep_Disorder,avg(Daily_Steps) from sleeptable group by Sleep_Disorder order by avg(Daily_Steps) desc;
-- None|7078.88198757764
-- Insomnia|5641.66666666667
-- Sleep Apnea|5126.66666666667
-- People with no sleep disorders take higher number of steps each day as compared to the people dealing with sleeping disorders

--checking the average daily steps per quality of sleep
select Quality_of_Sleep,avg(Daily_Steps) from sleeptable group by Quality_of_Sleep order by avg(Daily_Steps) desc;
-- 9|7500.0
-- 8|7382.79569892473
-- 7|7364.28571428571
-- 6|5723.52941176471
-- 5|4257.14285714286
-- 4|3880.0
-- People with the best quality of sleep also take the most number of steps each day on an average as compared to the people with the worst quality of sleep

--checking the  average quality of sleep for each occupation
select Occupation,avg(Quality_of_Sleep) from sleeptable group by Occupation order by avg(Quality_of_Sleep) desc;
-- Accountant|8.06451612903226
-- Lawyer|7.8936170212766
-- Engineer|7.76923076923077
-- Teacher|6.9375
-- Software Engineer|6.5
-- Doctor|6.49230769230769
-- Salesperson|6.0
-- Nurse|6.0
-- Scientist|5.0
-- Sales Representative|4.0
--Accountants have the best quality of sleep on an average whereas Sales Represntatives have the worst quality of sleep on an average

--checking the average quality of sleep for each BMI level
select BMI_Category,avg(Quality_of_Sleep) from sleeptable group by BMI_Category order by avg(Quality_of_Sleep) desc;
-- Normal|7.33939393939394
-- Obese|5.88571428571429
--normal people have a better quality of sleep on an average than obese people

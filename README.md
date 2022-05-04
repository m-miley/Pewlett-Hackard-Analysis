# Pewlett-Hackard-Analysis
Resources
   
    - PostgreSQL
    - pgAdmin4
    - csv files

## Overview

The purpose of this analysis is to help Pewlett-Hackard leadership prepare for an upcoming mass retirement, dubbed the "silver tsunami".  Reports were generated using PostgreSQL on pgAdmin4 to show retiring employee names along with their employee numbers, departments, titles, salaries, and eligibility for the new mentorship program.  Through anticipation, identification, and training, existing employees can make a smooth transition into new roles and the company can continue to succeed while minimizing impact.

## Results

- Number of employees retiring soon:  
    - 72,458  
- Most impacted Departments:
    - Development
    - Production
- Most impacted Job Titles:
    - Senior Engineer
        - 25,916
    - Senior Staff
        - 24,926
- All titles but Manager have many employees eligible to be mentors:
    - 2 Managers retiring
- Sum of Yearly Salaries:
    - $3,832,741,608

Reports showing first name, last name, birth date, title, and employee numbers are loaded to the Data File in the following files:
    - mentor_eligibility.csv
    - unique_titles.csv

![Screen Shot 2022-05-03 at 5 16 05 PM](https://user-images.githubusercontent.com/100544761/166577121-2ee5c7f4-cda2-4ea1-9a4a-52aa6b253ffe.png)


## Summary

According to our reports, 72,458 employees will be retiring over 4 years, leaving a corresponding amount of positions open.  This amounts to roughly 18,114 positions per year.  That's a lot of training and hiring!  We should focus next on training and employee development with a selected group from the eligible mentors list.  However, with only 1,549 eligible mentors, we will be far under an effective mentorship with nearly 47 students per mentor if they were all agree to participate.  Next, we should meet with the recruiting staff and make a plan on how to go about filling the available positions.  

Senior Engineer is the biggest job title category that will see the most losses.  The open positioin to mentor ratio is 153:1.  So, let's target those mid-level engineers and get them ready to step into more senior positions and start recruiting from colleges and other competitors to find talent to fill the entry to mid level positions.  We should also check in with each department and see how many employees and types of positions needed.  This information is in the dept_title_count.csv report in the Data File.  A snapshot is as follows:

![Screen Shot 2022-05-03 at 9 17 06 PM](https://user-images.githubusercontent.com/100544761/166615048-cacff0e4-8545-49ca-bbdb-8bbf886cf584.png)

#### Conclusion

Smart planning will be vital to handling this "silver tsunami".  This analysis is a great place to start.  If necessary, I can perform more grandular queries and relay additional information as needed.


## Database

#### ERD

![EmployeeDB](https://user-images.githubusercontent.com/100544761/166617843-d3c65251-3bbc-47e6-8e2d-025be0289e07.png)

#### Original Tables

 - departments.csv
 - dept_emp.csv
 - dept_manager.csv
 - employees.csv
 - salaries.csv
 - titles.csv


ERD was built on Quick DBD open source website.
All tables were created and csv files were manually imported into pgAdmin4.
Additional tables were created from query results.
All queries listed in Queries folder.
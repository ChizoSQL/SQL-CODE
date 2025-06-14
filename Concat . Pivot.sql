/**Concatenation - Is used to combine two or multiple strings together. Example 

**/ 

--Drop Table People
Create table People
 ( PeopleID Int,
 FirstName Varchar(50) Null,
 LastName Varchar (50) Null,
 Age Int)
 
 Insert into People
 ( PeopleID, FirstName, LastName, Age )
 Values 
 ( 105, 'Lisa', 'Ben', 45),
( 102, 'James', 'Len', 40),
( 106, 'Faith', 'Funmi',30),
( 107, 'Noble', 'Ola',50)

Select *
From People

/** Concatenate is used to cobine two or more strings together. Example joing text field. Like in the table Firts name and Last Nmae 
Two methods of concat 
1. +
2. Concat**/

Select Concat('Jame', ' is ', 'Doe') as FullName
From People

Select FirstName + ' ' + LastName as FullName
From People

Select*
From People

Select 
Case
When Age = 45 Then Concat(FirstName,' ', LastName, ' Oldgirl')
when Age = 40 Then Concat( FirstName,' ', LastName, ' Seniorman')
Else Concat(FirstName, ' ', LastName,' Youngman ')
End as Newage
From People


Select Concat(FirstName,' ', LastName)as FullName
From People
Where age in (30, 45)

/** What is Pivot? Is a technique used to transform rows to columns 

**/
Select*
From People

Select*
from 
(select FirstName, LastName, Age 
From People
Group by FirstName, LastName, Age
) SourceTable
Pivot(count(age)
For age in ([50], [45], [40], [30], [20])) as TargetTable

Select *
From 
(Select [DESCRIPTION], [Code], [System], [CATEGORY]
From allergies
Group by [DESCRIPTION], [Code], [System], [CATEGORY]) SourceTable
Pivot(Count(Category)
For Category in ([environment],[food] , [medication])) TargetTable



--With CTE
 with CTE as (
Select *
From 
(Select [DESCRIPTION], [Code], [System], [CATEGORY]
From allergies
Group by [DESCRIPTION], [Code], [System], [CATEGORY]) SourceTable
Pivot(Count(Category)
For Category in ([environment],[food] , [medication])) TargetTable
)
Select *
From CTE
Select [environment],[food] , [medication],
Case 
When Environment = 1 then 'Active'
Else 'NonActive'
End EnvStatus,
Case 
When Food = 1 then 'Active'
Else 'NonActive'
End FoodStatus,
Case 
When Medication = 1 then 'Active'
Else 'NonActive'
End MediStatus
From CTE

Select distinct CATEGORY
From allergies 

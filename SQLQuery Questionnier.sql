select * from QuestionnairResponses

select BUISNESS_NAME, sum(CURRENT_REMINDER_RATING) as Rating
from QuestionnairResponses
group by BUISNESS_NAME;

---	How frequently do businesses encounter late payments and unpaid invoices?
Select LATE_PAYMENT_RATE, count(LATE_PAYMENT_RATE) as Payment_Rating
from QuestionnairResponses
group by LATE_PAYMENT_RATE

---	What impact do late payments and unpaid invoices have on the cash flow of businesses?
select IMPACT_OF_LATE_PAYMENT,
	count(case when IMPACT_OF_LATE_PAYMENT = 'Negatively' then 1 else 0 End) as Impact_Rate,
	Round(count(case when IMPACT_OF_LATE_PAYMENT = 'Positive' then 1 Else 0 End) * 100.0 / 52, 2 ) as percentage
from QuestionnairResponses
---where IMPACT_OF_LATE_PAYMENT is not null
group by IMPACT_OF_LATE_PAYMENT
order by Impact_Rate desc;

---What challenges do businesses face when manually chasing up payments and sending payment reminders?
select Buisness_Name, EMPLOYEE_SIZE ,
max(PAYMENT_CHALLENGES_that_apply) over (partition by EMPLOYEE_SIZE) as challenges
  from QuestionnairResponses 
 --- order by EMPLOYEE_SIZE desc
  
   
  ---How do businesses currently remind their customers or clients of overdue payments?
  select  CURRENT_REMINDER_MODE
  from QuestionnairResponses 

  ---What pricing models are businesses willing to consider for a payment reminder software?
  select  RIS_SUBSCRIPTION
  from QuestionnairResponses

  ---What size of businesses would be the primary target market for a payment reminder software?
  select  EMPLOYEE_SIZE
  from QuestionnairResponses
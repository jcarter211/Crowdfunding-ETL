-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
Select ca.backers_count, ca.cf_id, ca.outcome
From campaign as ca
Where (ca.outcome = 'live')
Order By ca.backers_count DESC;

Select * from campaign;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
Select * from backers;

Select Count(ba.backer_id) as backer_count, ba.cf_id
From backers as ba
Group by ba.cf_id
Order by backer_count DESC;

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
Select co.first_name, co.last_name, co.email,
ca.outcome, (ca.goal - ca.pledged) as "Remaining Goal Amount"
Into email_contacts_remaining_goal_amount
From contacts as co
JOIN campaign as ca
ON (co.contact_id = ca.contact_id)
Where (ca.outcome = 'live')
Order by "Remaining Goal Amount" DESC;

Select * From email_contacts_remaining_goal_amount;

Select * from backers;

Select ba.email, ba.first_name, ba.last_name, ba.cf_id,
ca.company_name, ca.description, ca.end_date,
(ca.goal - ca.pledged) as "Left of Goal"
Into email_backers_remaining_goal_amount
From backers as ba
Left Join campaign as ca 
On (ba.cf_id = ca.cf_id)
Group by ba.email, ba.first_name, ba.last_name, ba.cf_id,
ca.company_name, ca.description, ca.end_date, "Left of Goal"
Order by ba.last_name;



/*Q1: Some of the facilities charge a fee to members, but some do not.
Write a SQL query to produce a list of the names of the facilities that do.*/

A1:
SELECT * 
FROM Facilities
WHERE membercost > 0


/*Q2: How many facilities do not charge a fee to members?*/

A2:
SELECT count(*)
FROM Facilities
WHERE membercost = 0


/*Q3: Write an SQL query to show a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost.
Return the facid, facility name, member cost, and monthly maintenance of the*/
facilities in question.

A3:

SELECT facid,name,membercost,monthlymaintenance
FROM Facilities
Where membercost > 0
And membercost < 0.2 * monthlymaintenance


/*Q4: Write an SQL query to retrieve the details of facilities with ID 1 and 5.
Try writing the query without using the OR operator.*/

A4:
SELECT *
FROM Facilities
Where facid in (1,5) 


/*Q5: Produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100. Return the name and monthly maintenance of the facilities
in question.*/

A5:
SELECT name, monthlymaintenance, 
CASE WHEN monthlymaintenance > 100 THEN 'expensive'
     ELSE 'cheap' END AS label
FROM Facilities


/*Q6: You'd like to get the first and last name of the last member(s)
who signed up. Try not to use the LIMIT clause for your solution. */

A6:
SELECT firstname, surname
FROM Members
WHERE joindate = (
SELECT MAX(joindate) 
FROM Members)

/*Q7: Produce a list of all members who have used a tennis court.
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name.*/

A7:
SELECT sub.courtname, concat(sub.firstanem, ' ',sub.lastname)
From 
(SELECT Facilities.name as courtname, Members.firstname as firstname, Members.surname as lastname
FROM Bookings
INNER JOIN Facilities ON Bookings.facid = Facilities.facid
AND Facilities.name LIKE 'Tennis Court%'
INNER JOIN Members ON Bookings.memid = Members.memid) as sub
Group by sub.courtname , sub.firstname, sub.lastname 
order by username 



/*Q8: Produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30. Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries.*/

A8:
SELECT Facilities.name AS facility, CONCAT( Members.firstname,  ' ', Members.surname ) AS name, 
CASE WHEN Bookings.memid =0
THEN Facilities.guestcost * Bookings.slots
ELSE Facilities.membercost * Bookings.slots
END AS bookingcost
FROM Bookings
INNER JOIN Facilities ON Bookings.facid = Facilities.facid
AND Bookings.starttime LIKE  '2012-09-14%'
AND (((Bookings.memid =0) AND (Facilities.guestcost * Bookings.slots >30))
OR ((Bookings.memid !=0) AND (Facilities.membercost * Bookings.slots >30)))
INNER JOIN Members ON Bookings.memid = Members.memid
ORDER BY bookingcost DESC


/*Q9: This time, produce the same result as in Q8, but using a subquery.*/

A9:
SELECT * 
FROM (
SELECT Facilities.name AS facility, CONCAT( Members.firstname,  ' ', Members.surname ) AS name, 
CASE WHEN Bookings.memid =0
THEN Facilities.guestcost * Bookings.slots
ELSE Facilities.membercost * Bookings.slots
END AS bookingcost
FROM Bookings
INNER JOIN Facilities ON Bookings.facid = Facilities.facid
AND Bookings.starttime LIKE  '2012-09-14%'
INNER JOIN Members ON Bookings.memid = Members.memid
)sub
WHERE sub.bookingcost >30
ORDER BY sub.bookingcost DESC


/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

A10:
SELECT * 
FROM (
SELECT sub.facility, SUM( sub.cost ) AS total_revenue
FROM (
SELECT Facilities.name AS facility, 
CASE WHEN Bookings.memid =0
THEN Facilities.guestcost * Bookings.slots
ELSE Facilities.membercost * Bookings.slots
END AS cost
FROM Bookings
INNER JOIN Facilities ON Bookings.facid = Facilities.facid
INNER JOIN Members ON Bookings.memid = Members.memid) as sub
GROUP BY sub.facility)as sub2
WHERE sub2.total_revenue <1000
ORDER BY sub2.total_revenue desc

/* Q11: Produce a report of members and who recommended them in alphabetic surname,firstname order */

A11:
SELECT m1.firstname,m1.surname,m2.firstname as recommendedbyfirstname,m2.surname as recommendedbysurname
FROM Members as m1
INNER JOIN Members as m2
ON m2.memid = m1.recommendedby
ORDER BY m1.surname,m1.firstname

/* Q12: Find the facilities with their usage by member, but not guests */

A12:
SELECT name,(Members.firstname || ' ' || Members.surname) as username,count(firstname) as 'usage'
FROM Facilities
INNER JOIN Bookings
ON Facilities.facid = Bookings.facid
INNER JOIN Members
ON Members.memid = Bookings.memid
AND Members.memid != 0
GROUP BY username
ORDER BY name

/* Q13: Find the facilities usage by month, but not guests */

A13:
SELECT strftime('%m',starttime) as month, name, COUNT(name) as 'usage' 
FROM Bookings 
inner join Facilities 
ON Bookings.facid = Facilities.facid
AND memid != 0 
GROUP by month, name



# Vspace - Online Assessment Portal
## Spring Boot - Hibernate - JSP


Vspace is a online assessment portal which allows users to create Simple Online Assessments(MCQ)

- **Presentation Video** : https://www.youtube.com/watch?v=8SGEtAdPUeU
- **PPT** : https://docs.google.com/presentation/d/1EZsETAfAMqfk5q8Sj_3B7dsnIvdKz-qFPiQS0QFdScY/edit?usp=sharing

## Getting Started

- Download the repo
- Open the app folder on the Spring suite IDE
- Run the app ( com.main.AppApplication.java)
- Open Browser and go to localhost:8080

## Database Setup

- Create a new database under the name **"vspace"** 
- Then download and import the database from **/db/vspace.sql** (recommended)
     - set env variable path to mysql bin   
     - Open cmd and navigate to folder containing vspace.sql
     - mysql -u root -p vspace < vspace.sql
- If you created a new database, make sure to change the **"claim"** of One user to **"admin"** to access admin interface


## Navigation through the Admin Interface

- You will be redirected to a login page
- Login using the admin credentials (Assuming you imported vspace.sql) 
- **username : admin@gmail.com**
- **password : admin**
- You can see the list of Tests.Click on the test name view questions . You can create new Test as well
- If the test status is not live, You can add questions the questions
- On the History tab, You can see the results of pervious tests and download the results as well.


## Navigation through User Interface
- If you are a new user, Sign up and login with that credentials 
- You will be redirected to user dashboard
- You will see the list of all live tests and competed test
- You can start test right away. If the test requires payment , then you have to make payment and start the test.
- On the test page , you will have questions and option and also a naviagtion bar on the side for reference
- Once you complete all the questions the test will be auto submitted and you can view your submissions on submission tab.

## Payment Credentials
For making payments, use the below test credentials
- Card : Mastercard 
- Card Number : 5267 3181 8797 5449 
- CVV : Random CVV 
- Exp Date : Any future date

You can choose if the payment is success or failure.

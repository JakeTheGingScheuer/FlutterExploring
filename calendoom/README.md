# CALENDOOM - unload your impending financial doom into a calendar application

## Overview
A simple calendar interface that keeps track of bills and paydays.
Indicates days when bills are coming out or when you get paid.
Outputs a running balance of each day over the course of a year.
Ability to add reoccurring monthly payments.

## Layout
- First page is a calendar that is displayed as a scroll view of each month based on real time.
- Each day on the calendar can be clicked on which takes you to the next screen where you can view the transactions of that day, delete transactions, and click a button to add a new transaction.
- The button takes you to a form you fill out which has a description input, amount input, a credit+ or debit- selector, and a reoccurring payment toggle switch.
- Everytime you go back to the main screen, your data is automatically saved locally on your device.

### notes
Started by using TDD with unit testing and widget testing (UI). 
Turned into a spike later on when trying to figure out how to save state locally to a device. 

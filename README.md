### Table of Contents

1. Import-/ File-Parsing Challenge
1. Notes


Import-/ File-Parsing Challenge
===============================

You are working on an application to build survey software. There is a legacy system that
you need to import data from. Survey responses are arranged in a flat file (TSV - tab
separated), with a row per user and a column per question.


|   |q14 | q17   | q18 | q18 | q23   |
| -------------- | ------------- | ---------   | ------------ | ------------ | ----------   |
|	u1	 | 1	   | 3	   | 1 | 2 | 4		  |
|	u1	 | 1	   | 3	   | 1 | 2 | 4		  |


There are 50,000 users and 400 questions in the spreadsheet (question ids do not repeat).
Your task is to import the spreadsheet into this schema (assume that user and question are
prepopulated):

![schema](http://i1.minus.com/jbfs0xljEBA0Lf.png)

Please write code to do this. You can stub out the database access class.



Notes
=====

I tried to follow the following pattern:

1. Make it work.
2. Clean up the code.
3. Make it fast.

I focused on TDD'ing everything, even the rake task.

`Parser.rb` is completely file-agnostic as it is only being passed a `row`.


##### Concerning **3. Make it fast**:

Performance could definitely be rapidly improved as of right now I am calling a fairly expensive double loop:
I am looping over every row and every question. Also, in `parser.rb` I could have chosen a different approach and not map (`.map(&:to_i`).

Right now, this will run perfectly fine as a background task where performance does not really matter. :metal:

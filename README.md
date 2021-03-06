### Table of Contents

1. Import-/ File-Parsing Challenge
1. Notes
1. Output

Import-/ File-Parsing Challenge
===============================

You are working on an application to build survey software. There is a legacy system that
you need to import data from. Survey responses are arranged in a flat file (TSV - tab
separated), with a row per user and a column per question.


|   |q14 | q17   | q18 | q18 | q23   |
| -------------- | ------------- | ---------   | ------------ | ------------ | ----------   |
|	u1	 | 1	   | 3	   | 1 | 2 | 4		  |
|	u3	 | 3	   | 6	   | 2 | 4 | 3		  |
|	u4	 | 2	   | 2	   | 6 | 46 | 2		  |

There are 50,000 users and 400 questions in the spreadsheet (question ids do not repeat).
Your task is to import the spreadsheet into this schema (assume that user and question are
prepopulated):

![schema](http://i1.minus.com/jbfs0xljEBA0Lf.png)

Please write code to do this. You can stub out the database access class.



Notes
=====

I tried to follow this pattern:

1. Make it work.
2. Clean up the code.
3. Make it fast.

I focused on TDD'ing everything, even the rake task.

`Parser.rb` is completely file-agnostic as it is only being passed a `row`.


##### Concerning **3. Make it fast**:

Performance could definitely be improved. As of right now, I am calling a fairly expensive double loop:
I am looping over every row and every question. Also, in `parser.rb` I could have chosen a different approach and not map (`.map(&:to_i`).

However, this will run perfectly fine as a background task where performance does not really matter. :metal:



Output
=======

````
{:question_id=>14, :user_id=>1, :response=>1}
{:question_id=>17, :user_id=>1, :response=>4}
{:question_id=>34, :user_id=>1, :response=>5}
{:question_id=>14, :user_id=>2, :response=>5}
{:question_id=>17, :user_id=>2, :response=>3}
{:question_id=>34, :user_id=>2, :response=>2}
{:question_id=>14, :user_id=>3, :response=>3}
{:question_id=>17, :user_id=>3, :response=>1}
{:question_id=>34, :user_id=>3, :response=>1}
 => nil
 ````
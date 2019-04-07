use "dates.sml";

(*  example tests *)
"------- example_tests";
val test1 = is_older ((1,2,3),(2,3,4)) = true;
val test2 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1;
val test3 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3;
val test4 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)];
val test5 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)];
val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there";
val test7 = date_to_string (2013, 6, 1) = "June 1, 2013";
val test8 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3;
val test9 = what_month 70 = 3;
val test10 = month_range (31, 34) = [1,2,2,2];
val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31);
"------- example_tests ok";

"------- is_older";
is_older((2014, 9, 2), (2014, 9, 2)) = false;
is_older((2014, 9, 2), (2014, 9, 1)) = false;
is_older((2014, 9, 1), (2014, 9, 2)) = true;
is_older((2014, 9, 2), (2014, 8, 1)) = false;
is_older((2014, 9, 2), (2014, 8, 2)) = false;
is_older((2014, 8, 2), (2014, 9, 2)) = true;
is_older((2014, 9, 2), (2013, 10, 2)) = false;
is_older((2012, 9, 2), (2013, 9, 2)) = true;
is_older((2014, 9, 2), (2013, 10, 2)) = false;
is_older((2013, 2, 2), (2014, 1, 1)) = true;
is_older((2000, 1, 1), (1900, 1, 1)) = false;
is_older((1900, 2, 2), (2000, 1, 1)) = true;
"------- is_older ok";

"------- number_in_month";
number_in_month(
  [(1900, 2, 45), (1900, 2, 17), (1900, 3, 54)],
  3
) = 1;
number_in_month(
  [(1900, 3, 45), (1900, 2, 17), (1900, 3, 54)],
  3
) = 2;
number_in_month([], 3) = 0;
number_in_month([(1900, 2, 17)], 3) = 0;
number_in_month([(1900, 3, 17), (1900, 3, 18)], 3) = 2;
"------- number_in_month ok";

"------- number_in_months";
number_in_months(
  [(1900, 2, 45), (1900, 2, 17), (1900, 3, 54)],
  [3]
) = 1;
number_in_months(
  [(1900, 3, 45), (1900, 2, 17), (1900, 3, 54)],
  [3, 2]
) = 3;
number_in_months([], [3]) = 0;
number_in_months([], []) = 0;
number_in_months([(1900, 2, 17)], []) = 0;
number_in_months([(1900, 2, 17)], [3]) = 0;
number_in_months([(1900, 3, 17), (1900, 3, 18)], [3]) = 2;
"------- number_in_months ok";

"------- dates_in_month";
dates_in_month(
  [(1900, 2, 45), (1900, 2, 17), (1900, 3, 54)],
  3
) = [(1900, 3, 54)];
dates_in_month(
  [(1900, 3, 45), (1900, 2, 17), (1900, 3, 54)],
  3
) = [(1900, 3, 45), (1900, 3, 54)];
dates_in_month([], 3) = [];
dates_in_month([(1900, 2, 17)], 3) = [];
dates_in_month([(1900, 3, 17), (1900, 3, 18)], 3) = [(1900, 3, 17), (1900, 3, 18)];
"------- dates_in_month ok";

"------- dates_in_months";
dates_in_months(
  [(1900, 2, 45), (1900, 2, 17), (1900, 3, 54)],
  [3]
) = [(1900, 3, 54)];
dates_in_months(
  [(1900, 3, 45), (1900, 2, 17), (1900, 3, 54)],
  [3, 2]
) = [(1900, 3, 45), (1900, 3, 54), (1900, 2, 17)];
dates_in_months([], [3]) = [];
dates_in_months([], []) = [];
dates_in_months([(1900, 2, 17)], []) = [];
dates_in_months([(1900, 2, 17)], [3]) = [];
dates_in_months([(1900, 3, 17), (1900, 3, 18)], [3]) = [(1900, 3, 17), (1900, 3, 18)];
"------- dates_in_months ok";

"------- get_nth";
get_nth(["one", "two", "three", "four"], 3) = "three";
get_nth(["one", "two", "three", "four"], 2) = "two";
get_nth(["one", "two", "three", "four"], 1) = "one";
get_nth(["one", "two", "three", "four"], 4) = "four";
"------- get_nth ok";

"------- date_to_string";
date_to_string((2014, 12, 19)) = "December 19, 2014";
date_to_string((2015, 12, 19)) = "December 19, 2015";
date_to_string((1989, 2, 28)) = "February 28, 1989";
"------- date_to_string ok";

"------- number_before_reaching_sum";
number_before_reaching_sum(10, [5, 4, 3]) = 2;
number_before_reaching_sum(3, [0, 1, 2]) = 2;
number_before_reaching_sum(3, [0, 1, 2]) = 2;
number_before_reaching_sum(9, [5, 1, 1, 1, 1]) = 4;
number_before_reaching_sum(9, [9, 1, 1, 1, 1]) = 0;
"------- number_before_reaching_sum ok";

"------- what_month";
what_month(30) = 1;
what_month(40) = 2;
what_month(59) = 2;
what_month(360) = 12;
"------- what_month ok";

"------- month_range";
month_range(29, 33) = [1, 1, 1, 2, 2];
month_range(59, 59) = [2];
month_range(360, 365) = [12, 12, 12, 12, 12, 12];
month_range(365, 364) = [];
"------- month_range ok";

"------- oldest";
oldest([(2014, 9, 2), (2014, 9, 2)]) = SOME (2014, 9, 2);
oldest([(2014, 9, 2), (2014, 9, 1)]) = SOME (2014, 9, 1);
oldest([(2014, 9, 1), (2014, 9, 2)]) = SOME (2014, 9, 1);
oldest([]) = NONE;
oldest([
  (2014, 9, 1),
  (2014, 9, 2),
  (1900, 2, 2),
  (2000, 1, 1),
  (1902, 12, 1)
]) = SOME (1900, 2, 2);
"------- oldest ok";

"------- number_in_months_challenge";
number_in_months_challenge(
  [(1900, 2, 45), (1900, 2, 17), (1900, 3, 54)],
  [3, 3]
) = 1;
number_in_months_challenge(
  [(1900, 3, 45), (1900, 2, 17), (1900, 3, 54)],
  [3, 2, 3, 2]
) = 3;
number_in_months_challenge([], [3]) = 0;
number_in_months_challenge([], []) = 0;
number_in_months_challenge([(1900, 2, 17)], []) = 0;
number_in_months_challenge([(1900, 2, 17)], [3]) = 0;
number_in_months_challenge([(1900, 3, 17), (1900, 3, 18)], [3]) = 2;
"------- number_in_months_challenge ok";

"------- dates_in_months_challenge";
dates_in_months_challenge(
  [(1900, 2, 45), (1900, 2, 17), (1900, 3, 54)],
  [3, 3]
) = [(1900, 3, 54)];
dates_in_months_challenge(
  [(1900, 3, 45), (1900, 2, 17), (1900, 3, 54)],
  [3, 2, 2]
) = [(1900, 3, 45), (1900, 3, 54), (1900, 2, 17)];
dates_in_months_challenge([], [3]) = [];
dates_in_months_challenge([], []) = [];
dates_in_months_challenge([(1900, 2, 17)], []) = [];
dates_in_months_challenge([(1900, 2, 17)], [3]) = [];
dates_in_months_challenge([(1900, 3, 17), (1900, 3, 18)], [3]) = [(1900, 3, 17), (1900, 3, 18)];
"------- dates_in_months_challenge ok";


"------- reasonable_date";
reasonable_date((1700, 2, 29)) = false; (* 1700 is not leap year *)
reasonable_date((1700, 2, 28)) = true; (* 1700 is not leap year *)
reasonable_date((1700, 13, 3)) = false;
reasonable_date((~1900, 1, 1)) = false;
reasonable_date((1900, ~1, 1)) = false;
reasonable_date((1900, 1, ~1)) = false;
reasonable_date((1900, 1, 0)) = false;
reasonable_date((2014, 12, 31)) = true;
reasonable_date((2014, 11, 31)) = false;
reasonable_date((2004, 4, 9)) = true;
reasonable_date((2004, 2, 29)) = true;
reasonable_date((2004, 1, 32)) = false;

"------- reasonable_date ok";

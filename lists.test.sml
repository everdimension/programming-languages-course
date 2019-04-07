"all should be true";

"product";
list_product([1]) = 1;
list_product([]) = 1;
list_product([2]) = 2;
list_product([2, 3]) = 6;
list_product([2, 4, 8]) = 64;
"product ok";

"countdown";
countdown(0) = [];
countdown(~1) = [];
countdown(5) = [5, 4, 3, 2, 1];
countdown(1) = [1];
countdown(2) = [2, 1];
"countdown ok";

"append";
append([1, 2], [3, 4]) = [1, 2, 3, 4];
append([], []) = [];
append([1], []) = [1];
append([], [1]) = [1];
append([1], [2]) = [1, 2];
"append ok";

"sum pairs";
sum_pairs([(1, 2), (3, 4)]) = 10;
sum_pairs([(2, 2), (16, 16)]) = 36;
sum_pairs([(2, 2), (16, 16), (200, 200)]) = 436;
"sum pairs ok";

"firsts";
firsts([(1, 2), (3, 4)]) = [1, 3];
firsts([(2, 2), (16, 16)]) = [2, 16];
firsts([(2, 2), (16, 16), (200, 200)]) = [2, 16, 200];
"firsts ok";

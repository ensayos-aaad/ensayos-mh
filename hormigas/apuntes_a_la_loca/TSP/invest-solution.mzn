int: num_projects; % number of projects to select from
int: max_budget;   % budget limit 
int: max_persons;  % persons available
int: max_projects; % max number of projects to select
% the values of each project
array[1..num_projects] of int: values;
array[1..num_projects] of int: budgets;
array[1..num_projects] of int: personnel;
% project i cannot be selected with project j
int: num_not_with;
array[1..num_not_with, 1..2] of 1..num_projects: not_with;
% project i requires project j 
int: num_requires;
array[1..num_requires, 1..2] of 1..num_projects: requires;
% decision variable: what project to select
array[1..num_projects] of var 0..1: x;
var int: total_persons  = sum(i in 1..num_projects) (x[i]*personnel[i]);
var int: total_budget   = sum(i in 1..num_projects) (x[i]*budgets[i]);
var int: total_projects = sum(i in 1..num_projects) (x[i]);
constraint
   total_budget <= max_budget
   /\
   total_persons <= max_persons
   /\
   total_projects <= max_projects
   %
   % special requirements
   %
   /\ % projects that require other projects
   forall(i in 1..num_requires) (
      x[requires[i, 1]]=1 -> x[requires[i, 2]] =1
   )
   /\ % projects excluding other projects
   forall(i in 1..num_not_with) (
      x[not_with[i, 1]]=1 ->  x[not_with[i, 2]] != 1
   )
;

var int: total_values   = sum(i in 1..num_projects) (x[i]*values[i]);

solve maximize total_values;

%
% data
%
num_projects = 15;
max_budget = 225;
max_projects = 9;
max_persons = 28;
values = [6000,4000,1000,1500, 800,1200,2000,2200, 900,3800,2900,1300, 800,2700,2800];
budgets = [35,34,26,12,10,18,32,11,10,22,27,18,16,29,22];
num_not_with = 6;
not_with = array2d(1..num_not_with, 1..2, [ 
  1, 10,
  5, 6,
  6,5,
  10, 1,
  11, 15,
  15, 11
]);
num_requires = 5;
requires = array2d(1..num_requires, 1..2, [
  3, 15,
  4, 15,
  8, 7,
  13, 2,
  14, 2
]);
personnel = [5,3,4,2,2,2,4,1,1,5,3,2,2,4,3];


output
[
  "x: " ++ show(x) ++ "\n" ++ 
  "total_persons: " ++ show(total_persons) ++ "\n" ++ 
  "total_budget: " ++ show(total_budget) ++ "\n" ++ 
  "total_projects: " ++ show(total_projects) ++ "\n" ++ 
  "total_values: " ++ show(total_values) ++ "\n"

];
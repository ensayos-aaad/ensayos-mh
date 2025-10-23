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
;

var int: total_values   = sum(i in 1..num_projects) (x[i]*values[i]);

solve maximize total_values;


output
[
  "x: " ++ show(x) ++ "\n" ++ 
  "total_persons: " ++ show(total_persons) ++ "\n" ++ 
  "total_budget: " ++ show(total_budget) ++ "\n" ++ 
  "total_projects: " ++ show(total_projects) ++ "\n" ++ 
  "total_values: " ++ show(total_values) ++ "\n"

];
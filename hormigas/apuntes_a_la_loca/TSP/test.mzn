include "globals.mzn";

int: n; % number of cities
array[1..n,1..n] of int: dist; % city distances
int: start_city;
int: end_city;
array[1..n] of var 1..n: city; % resulting order
array[1..n] of string: city_name;

constraint  city[1] = start_city;
constraint  city[n] = end_city;
constraint  all_different(city);

var int: total_distance = sum(i in 2..n)(dist[city[i-1],city[i]]);
solve minimize total_distance;
	
output[show(city)];

output [city_name[fix(city[i])] ++ " -> " | i in 1..n ] ++
            ["\nTotal hours travelled: ", show(total_distance) ];

% ==== input data ====

n=5;
dist=[|0,2,3,6,8|2,0,1,4,6|3,1,0,3,5|6,4,3,0,2|8,6,5,2,0|];
start_city=2;
end_city=1;
city_name=["milano","bologna","firenze","roma","napoli"];
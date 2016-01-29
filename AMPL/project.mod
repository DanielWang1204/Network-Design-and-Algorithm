#Indices
param V > 0 integer;

set NODES	:= 1..V;
set ARCS within {NODES,NODES};

#Constants
param s;
param t;
param Xi{(i,j) in ARCS} default 0;

#Variables
var u{ARCS} binary;

#Objective
minimize total_cost:
	sum{(i,j) in ARCS}(u[i,j] * Xi[i,j]);

#Constraints
subj to flow_balance {i in NODES}:
	sum{(i,j) in ARCS} u[i,j] - sum{(k,i) in ARCS} u[k,i] = if i = s then 1 else if i = t then -1 else 0;
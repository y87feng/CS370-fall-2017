clear T;
T = sparse(12,12);

T(2,1) = 0.38;
T(3,1) = 0.38;
T(5,1) = 0.24;
T(1,2) = 0.06;
T(3,2) = 0.41;
T(6,2) = 0.53;
T(1,3) = 0.47;
T(2,3) = 0.29;
T(4,3) = 0.34;
T(3,4) = 0.08;
T(5,4) = 0.42;
T(6,4) = 0.50;
T(1,5) = 0.09;
T(4,5) = 0.04;
T(6,5) = 0.09;
T(7,5) = 0.39;
T(12,5) = 0.39;
T(2,6) = 0.09;
T(4,6) = 0.28;
T(5,6) = 0.19;
T(8,6) = 0.22;
T(12,6) = 0.22;
T(5,7) = 0.13;
T(8,7) = 0.17;
T(9,7) = 0.23;
T(10,7) = 0.27;
T(12,7) = 0.20;
T(6,8) = 0.15;
T(7,8) = 0.21;
T(12,8) = 0.15;
T(9,8) = 0.21;
T(10,8) = 0.18;
T(11,8) = 0.10;
T(7,9) = 0.24;
T(8,9) = 0.24;
T(10,9) = 0.20;
T(11,9) = 0.32;
T(8,10) = 0.33;
T(9,10) = 0.07;
T(11,10) = 0.60;
T(8,11) = 0.40;
T(7,11) = 0.30;
T(9,11) = 0.05;
T(10,11) = 0.25;
T(5,12) = 0.06;
T(6,12) = 0.18;
T(7,12) = 0.47;
T(8,12) = 0.29;

x=categorical({'A','B','C','D','E','F','G','H','I','J','K','L'});
bar(x,PageRank(T,1));
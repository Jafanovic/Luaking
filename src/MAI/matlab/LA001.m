% Determine the spectrum of a matrix 
% and its spectral radius:
% write the matrix A
A = [2 2 0; -3 -3 5; 0 -0.25 2]
% solutions:
% d = eig(A) Returns the vector of 
% the matrix's own numbers.
vlastni_cisla = eig(A)
spektralni_polomer = max(abs(vlastni_cisla))
%======================================
% example:
% Specify your own numbers and 
% corresponding own vectors 
% of the following matrices:
A1 = [1 0.5; 3.5 4]
A2 = [3 -1; 2.5 4]
% soulutions:
[vl_vektory_mA1,vl_cisla_mA1] = eig(A1)
[vl_vektory_mA2,vl_cisla_mA2] = eig(A2)
% notes:
% vlastni cisla jsou na diagonale
% 1. sloupec vl_vektoru odpovida 
% vl_cislu v 1. sloupci
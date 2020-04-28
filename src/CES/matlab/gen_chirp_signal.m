% CHIRP Signal
% -----------------------------------------------
clear all; close all;
% generovani universalniho vektoru
  N    = 256;  % pocet prvku
  fs   = 256;  % vzorkovaci kmitocet v Hz
  fmax = 20;  % maximalni kmitocet v Hz
  Amax = 1;   % amplituda signalu
  A2   = 0.5; % amplituda signalu
% casovy vektor s N prvky  
  t    = linspace(0, (N-1)*(1/fs), N);
% generovani signalu s linearne rostoucim kmitoctem
  kosinus = chirp(t,0,1,20);
%vykresleni
figure(1)  
  stem(1:N,kosinus(1:N), 'k'); % diskretni forma
  plot(1:N,kosinus(1:N), 'k'); % spojita forma
  xlabel('n')
  ylabel('X[n]')
  title(['Chirp signal: fmax = ',num2str(fmax),' Hz, fs = ',num2str(fs),' Hz'])
  grid on;
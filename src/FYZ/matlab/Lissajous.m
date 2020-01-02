% Lissajousovy obrazce - vliv fazoveho uhlu
%--------------------------------------------
% neni - li pomer frekvenci racionalni cislo 
% neni krivka uzavrena
clear
t = 0:0.01:7;  i = 0;                         
omega1 = 2;    omega2 = 3;           % frekvence  
A   = 1;       B = 1;                % amplitudy


for fi = 0:pi/9:pi
    x = A*sin(omega1*t);             % 1. pohyb 
    y = B*sin(omega2*t + fi);        % 2. pohyb 
    i=i+1; fi=fi*180/pi;      % prevod na stupne 
    subplot(5,2,i); 
    plot(x,y,'r');
    axis('off'); 
    title(['\phi = ',num2str(fi),'°']);
end

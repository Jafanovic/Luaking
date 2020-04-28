R1=47e3
R1tol = 0.001;
R1t=[R1 * (1+R1tol), R1, R1 * (1-R1tol)]

R2=10e3
R2tol = 0.001;
R2t=[R2 * (1-R2tol), R2, R2 * (1+R2tol)]

R3=10e3
R3tol = 0.01;
R3t=[R3 * (1-R3tol), R3, R3 * (1+R3tol)]

R4=1e6
C1=47e-9
C1tol = 0.1;
C1t=[C1 * (1-C1tol), C1, C1 * (1+C1tol)]

C2=22e-9
C2tol = 0.1;
C2t=[C2 * (1-C2tol), C2, C2 * (1+C2tol)]

f=linspace(1,1e6,50000);
% f=262;
w=2*pi*f;
Xc1=1./(i.*w*C1);
Xc2=1./(i.*w*C2);


Z1=(R2.*Xc1)./(R2+Xc1);
Z2=(R4.*Xc2)./(R4+Xc2);



Zdown=(Z1.*(R3+Z2))./(Z1+R3+Z2);
Zup=R1;

Zdownt=(Z1t.*(R3t+Z2t))./(Z1t+R3t+Z2t);
Zupt=R1t;


Prenos=Zdown./(Zdown+Zup).*(Z2./(R3+Z2));


Adc= 20*log10(((R2*(R3+R4))/(R2+R3+R4))/(R1+((R2*(R3+R4))/(R2+R3+R4)))*(R4/(R3+R4)));


A = 20*log10(abs(Prenos))
At = 20*log10(abs(Prenost))

loglog(f,20*log10(abs(Prenos)),'r');

hold on;
kon = Adc - 3;
% loglog([1,10e6],[Adc-3,Adc-3],'b');
% loglog([f,f],[-10,-100],'m');
% grid on;
% str = {strcat('Prenos')};
% str = [str, strcat('A_dc - 3db =  ' , num2str(kon),' [db]')];
% str = [str, strcat('f_m =  ' , num2str(f),' [Hz]')];
% legend(str{:});
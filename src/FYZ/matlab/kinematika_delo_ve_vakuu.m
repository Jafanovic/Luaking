% ============== Zadani =========================
% Delova koule opousti hlaven zadanou rychlosti. 
% Urcete maximalni dostrel pro zadanou ustovou 
% rychlost, hranice oblasti, ve kterem lze 
% zasahnout cil a stanovte velikost potrebneho 
% nameru dela pro zasezeni libovolneho cile 
% uvnitr ochranne paraboly. 
  namer = 45;   % [°]     namer dela
  v0    = 210;  % [m/s]   ustova rychlost
  g0    = 9.81; % [m/s-2] gravitacni zrychleni
  % Angle required to hit coordinate (x,y)
  cil=[2000,300];
% ============== reseni =========================
    vx0     = v0*cos(namer/180*pi);
    vy0     = v0*sin(namer/180*pi);
% 1.Pohybove rovnice
    t_dopad = (2*vy0)/g0;
    t1= 0:t_dopad/20:t_dopad;
    r1 = [vx0*t1; 
          vy0*t1 - (1/2)*g0*t1.^2];
        
% 2. Vypocet nameru pro zasazeni zadaneho cile
    t_trefa = cil(1)/vx0;
    t2 = 0:t_trefa/20:t_trefa;
    % namer alfa  - dva koreny !!
    % Dsikriminant
    D = sqrt(v0^4 - (g0*(g0*cil(1)^2 + 2*v0^2*cil(2))));
    alfa1 = atan((v0^2-D)/(g0*cil(1)));
    alfa2 = atan((v0^2+D)/(g0*cil(1)));
    namer_alfa1 = alfa1*180/pi;
    namer_alfa2 = alfa2*180/pi;
    r2 = [vx0*t2; 
          tan(alfa1) *vx0*t2 - (g0/(2*v0^2*cos(alfa1)^2)) * (vx0*t2).^2;
          tan(alfa2) *vx0*t2 - (g0/(2*v0^2*cos(alfa2)^2)) * (vx0*t2).^2];
       
% 3. vypocet hranice dosazitelnosti cile - ochranna parabola
    vx0_max =v0*cos(45/180*pi);
    vy0_max =v0*sin(45/180*pi);
    t_max = (2*vy0_max)/g0; % max dostrel pri nameru 45°
    dostrel_max = vx0_max*t_max     % [m]
    vyska_max = v0^2/(2*g0)         % [m]
    t3 = 0:t_max/500:t_max;
    r3 = [vx0_max*t3; v0^2/(2*g0)-g0/(2*v0^2)*(vx0_max*t3).^2];
    
% graficke zpracovani vysledku
% figure;
plot(r1(1,:), r1(2,:),'-ro', cil(1), cil(2),'-bh',r2(1,:), r2(2,:),'-yo',r2(1,:), r2(3,:),'-go',r3(1,:), r3(2,:),':k.','MarkerSize',6)
    grid on;
    title({'\fontsize{16} Dostrel dela';
         ['\fontsize{12} pri ustove rychlosti ... ', num2str(v0), ' [m/s]' ] })
    xlabel('Vzdalenost [m]') 
    ylabel('Vyska [m]')
      string1 = ['Draha letu strely pro zadany namer ', num2str(namer),' [°] '];
      string2 = 'Souradnice pozadovaneho cile';
      string3 = ['Draha pro zasazeni cile s namerem ', num2str(namer_alfa1),' [°]'];
      string4 = ['Draha pro zasazeni cile s namerem ', num2str(namer_alfa2),' [°]'];
      string5 = 'Hranice dosazitelnosti cile';
    legend(string1, string2, string3, string4, string5)    
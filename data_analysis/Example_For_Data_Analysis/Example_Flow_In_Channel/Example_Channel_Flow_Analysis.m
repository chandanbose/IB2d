function Example_Channel_Flow_Analysis()

% TEMPORAL INFO FROM input2d %
dt = 1e-4;      % Time-step
Tfinal = 0.015;   % Final time in simulation
pDump=50;       % Note: 'print_dump' should match from input2d

% DATA ANALYSIS INFO %
start=0;                             % 1ST interval # included in data analysis
finish=3;                            % LAST interval # included in data analysis 
dump_Times = (start:1:finish)*pDump; % Time vector when data was printed in analysis

% SET PATH TO DESIRED viz_IB2d DATA %
path = 'viz_IB2d';

% SET PATH TO DA_BLACKBOX %
addpath('../../DA_Blackbox');

for i=start:1:finish
    
    % Points to desired data viz_IB2d data file
    if i<10
       numSim = ['000', num2str(i)];
    elseif i<100
       numSim = ['00', num2str(i)];
    elseif i<1000
       numSim = ['0', num2str(i) '.vtk'];
    else
       numSim = num2str(i);
    end
    
    % Imports immersed boundary positions %
    [xLag,yLag] = give_Lag_Positions(path,numSim);

    % Imports (x,y) grid values and ALL Eulerian Data %
    %                      DEFINITIONS 
    %          x: x-grid                y: y-grid
    %       Omega: vorticity           P: momentum
    %    uMag: mag. of velocity  
    %    uX: mag. of x-Velocity   uY: mag. of y-Velocity  
    %    U: x-directed velocity   V: y-directed velocity
    [x,y,Omega,P,uMag,uX,uY,U,V] = import_Eulerian_Data(path,numSim);
        
    
    

end
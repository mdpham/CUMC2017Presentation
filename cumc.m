%% Sierpinski Gasket

% Three map IFS affine contraction transformations in two dimension [x;y]
% s1 = [[0.5 0];[0 0.5]];  % Filling a single off diagonal with 0<s<1 will shear
s1 = [[0.5 0.42];[0 0.5]];
s2 = [[0.5 0];[0 0.5]];  % Can fill both diagonals appropriately to perform rotation transformation
s3 = [[0.5 0];[0 0.5]];  % Values s<0.5 create empty space, s>0.5 overlaps
t1 = [0;0];             % Translation change perspective (skew)
t2 = [0.5;0];
t3 = [1;sqrt(3)]./4;
w1 = @(x) s1*x + t1;
w2 = @(x) s2*x + t2;
w3 = @(x) s3*x + t3;



M = 100000;        % Number of iterations
fr = 1
x0 = [rand();rand()];   % Initial point
x = [x0];
for i = 1:M
    xn = x(:,i);
    p = rand();
    if p < 1/3
        xn = w1(xn);
    elseif p < 2/3
        xn = w2(xn);
    else
        xn = w3(xn);
    end
    x(:,end+1) = xn;
    
    if mod(i-1,floor(M/180))==0
        close all
        figure('Visible','off')
        scatter(x(1,:),x(2,:), 'k.')
        axis([0 1 0 1])
        saveas(gca,['sierpinski/',sprintf('%04d',fr),'.png'],'png');
        fr = fr+1
    end
        
end


saveas(scatter(x(1,:),x(2,:), 'k.'),'sierpinski/final.png','png')

%% BARNSLEY FERN

% Four map IFS affine contraction transformations in two dimension [x;y]
s1 = [[0 0];[0 0.16]];
s2 = [[0.85 0.04];[-0.04 0.85]];
% s2 = [[0.85 -0.04];[0.04 0.85]];
s3 = [[0.2 -0.26];[0.23 0.22]];
s4 = [[-0.15 0.28];[0.26 0.24]];
t1 = [0; 0];
t2 = [0; 1.6];
t3 = [0; 1.6];
t4 = [0; 0.44];
w1 = @(x) s1*x + t1;
w2 = @(x) s2*x + t2;
w3 = @(x) s3*x + t3;
w4 = @(x) s4*x + t4;


M = 300000;        % Number of iterations
fr = 1
x0 = [rand();rand()];   % Initial point
x = [x0];
for i = 1:M
    xn = x(:,i);
    p = rand();
    if p < 0.01
        xn = w1(xn);
    elseif p < 0.86 %0.01+0.85
%     elseif p < 0.05 + 0.6
        xn = w2(xn);
    elseif p < 0.93 %0.01+0.85+0.07
%     elseif p < (1-(1-(0.05+0.6))/2)
        xn = w3(xn);
    else
        xn = w4(xn);
    end
    x(:,end+1) = xn;
    
%      if mod(i-1,floor(M/240))==0
%           close all
%           figure('Visible','off')
%           scatter(x(1,:),x(2,:), 'k.')
%         axis([-4 4 0 10])
%           saveas(gca,['fern/',sprintf('%04d',fr),'.jpg'],'jpg');
%           fr = fr+1
%      end     
end
figure('Visible','on')
% axis([-4 4 0 10])
scatter(x(1,:),x(2,:), 'k.')
% saveas(scatter(x(1,:),x(2,:), 'k.'),'fern/fern.png','png')

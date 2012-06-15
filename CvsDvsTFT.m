clear all;
close all;
index = 0;

Pdc = 0;
Pcd = 10;
Pcc = 7;
Pdd = 3;

mu = 15;

% how fine to divide the frequencies. A value of 100 would simulate
% frequencies at intervals of 0.01.
GRANULARITY = 100;                              
for i = 0:GRANULARITY
    for j = 0:(GRANULARITY-i)
        for k = 0:(GRANULARITY-i-j)
            index = index+1;
            FreqC(index) = i/GRANULARITY;
            FreqTFT(index) = j/GRANULARITY;
        end
    end
end

% The payoff functions for each stratgy
Wtft = (1-FreqC-FreqTFT) * (((Pdc+(mu-1)*Pdd))./mu) + (FreqTFT+FreqC) * Pcc;
Wd = (1-FreqC-FreqTFT) * Pdd + FreqTFT * ((Pcd + ((mu-1)*Pdd))./mu) + FreqC * Pcd;
Wc = (1-FreqC-FreqTFT) * Pdc + (FreqTFT+FreqC) * Pcc;

% Tidy up 
clear i j k index

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the payoff to TFT.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;

colormap(jet)
[hg,htick,hcb]=tersurf(1-FreqC-FreqTFT, FreqC, FreqTFT, Wtft);
gcf = title('Payoff to TFT Strategy MU = 3');
% Add the labels
hlabels=terlabel('Frequency of D','Frequency of C','Frequency of TFT');

%--  Change the color of the grid lines
set(hg(:,3),'color','m')
set(hg(:,2),'color','c')
set(hg(:,1),'color','y')

%--  Modify the labels
set(hlabels,'fontsize',12)
set(hlabels(3),'color','m')
set(hlabels(2),'color','c')
set(hlabels(1),'color','y')

%--  Modify the tick labels
set(htick(:,1),'color','y','linewidth',3)
set(htick(:,2),'color','c','linewidth',3)
set(htick(:,3),'color','m','linewidth',3)

%--  Change the colorbar
set(hcb,'xcolor','w','ycolor','w')
%--  Modify the figure color
set(gcf,'color',[0 0 0.3])
%-- Change some defaultsfigure;

figure;
mu = 15
colormap(jet)
[hg,htick,hcb]=tersurf(1-FreqC-FreqTFT, FreqC, FreqTFT, Wtft);
gcf = title('Payoff to TFT Strategy MU = 15');
% Add the labels
hlabels=terlabel('Frequency of D','Frequency of C','Frequency of TFT');

%--  Change the color of the grid lines
set(hg(:,3),'color','m')
set(hg(:,2),'color','c')
set(hg(:,1),'color','y')

%--  Modify the labels
set(hlabels,'fontsize',12)
set(hlabels(3),'color','m')
set(hlabels(2),'color','c')
set(hlabels(1),'color','y')

%--  Modify the tick labels
set(htick(:,1),'color','y','linewidth',3)
set(htick(:,2),'color','c','linewidth',3)
set(htick(:,3),'color','m','linewidth',3)

%--  Change the colorbar
set(hcb,'xcolor','w','ycolor','w')
%--  Modify the figure color
set(gcf,'color',[0 0 0.3])
%-- Change some defaults

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the payoff to Defect.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;

colormap(jet)
[hg,htick,hcb]=tersurf(1-FreqC-FreqTFT, FreqC, FreqTFT, Wd);
gcf = title('Payoff to Defect Strategy');
% Add the labels
hlabels=terlabel('Frequency of D','Frequency of C','Frequency of TFT');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following modifications are not serious, just to illustrate how to
% use the handles:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--  Change the color of the grid lines
set(hg(:,3),'color','m')
set(hg(:,2),'color','c')
set(hg(:,1),'color','y')

%--  Modify the labels
set(hlabels,'fontsize',12)
set(hlabels(3),'color','m')
set(hlabels(2),'color','c')
set(hlabels(1),'color','y')
%--  Modify the tick labels
set(htick(:,1),'color','y','linewidth',3)
set(htick(:,2),'color','c','linewidth',3)
set(htick(:,3),'color','m','linewidth',3)

%--  Change the colorbar
set(hcb,'xcolor','w','ycolor','w')
%--  Modify the figure color
set(gcf,'color',[0 0 0.3])
%-- Change some defaults

figure;

colormap(jet)
[hg,htick,hcb]=tersurf(1-FreqC-FreqTFT, FreqC, FreqTFT, Wc);
gcf = title('Payoff to Cooperate');
% Add the labels
hlabels=terlabel('Frequency of D','Frequency of C','Frequency of TFT');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following modifications are not serious, just to illustrate how to
% use the handles:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--  Change the color of the grid lines
set(hg(:,3),'color','m')
set(hg(:,2),'color','c')
set(hg(:,1),'color','y')

%--  Modify the labels
set(hlabels,'fontsize',12)
set(hlabels(3),'color','m')
set(hlabels(2),'color','c')
set(hlabels(1),'color','y')
%--  Modify the tick labels
set(htick(:,1),'color','y','linewidth',3)
set(htick(:,2),'color','c','linewidth',3)
set(htick(:,3),'color','m','linewidth',3)

%--  Change the colorbar
set(hcb,'xcolor','w','ycolor','w')
%--  Modify the figure color
set(gcf,'color',[0 0 0.3])
%-- Change some defaults
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure
% Plot the ternary axis system
[h,hg,htick]=terplot;
% Plot the data
% First set the colormap (can't be done afterwards)
colormap(jet)
[hcont,ccont,hcb]=tercontour(1-FreqC-FreqTFT, FreqC, FreqTFT, Wd);
clabel(ccont,hcont);
set(hcont,'linewidth',2)
% Add the labels
hlabels=terlabel('Frequency of D','Frequency of C','Frequency of TFT');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The following modifications are not serious, just to illustrate how to
% use the handles:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%--  Change the color of the grid lines
set(hg(:,3),'color','m')
set(hg(:,2),'color','c')
set(hg(:,1),'color','y')

%--  Modify the labels
set(hlabels,'fontsize',12)
set(hlabels(3),'color','m')
set(hlabels(2),'color','c')
set(hlabels(1),'color','y')
%--  Modify the tick labels
set(htick(:,1),'color','y','linewidth',3)
set(htick(:,2),'color','c','linewidth',3)
set(htick(:,3),'color','m','linewidth',3)
%--  Change the color of the patch
set(h,'facecolor',[0.7 0.7 0.7],'edgecolor','w')
%--  Change the colorbar
set(hcb,'xcolor','w','ycolor','w')
%--  Modify the figure color
set(gcf,'color',[0 0 0.3])
%-- Change some defaults
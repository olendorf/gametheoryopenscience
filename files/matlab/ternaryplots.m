clear all;
close all;
index = 0;

Pdc = 0;
Pcd = 10;
Pcc = 7;
Pdd = 3;

mu = [1,5,15];

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


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate the payoffs for each strategy at each value of mu
% The payoff functions for each stratgy mu = 1
Wtft1 = (1-FreqC-FreqTFT) * (((Pdc+(mu(1)-1)*Pdd))./mu(1)) + (FreqTFT+FreqC) * Pcc;
Wd1 = (1-FreqC-FreqTFT) * Pdd + FreqTFT * ((Pcd + ((mu(1)-1)*Pdd))./mu(1)) + FreqC * Pcd;
Wc1 = (1-FreqC-FreqTFT) * Pdc + (FreqTFT+FreqC) * Pcc;

% The payoff functions for each stratgy mu = 5
Wtft5 = (1-FreqC-FreqTFT) * (((Pdc+(mu(2)-1)*Pdd))./mu(2)) + (FreqTFT+FreqC) * Pcc;
Wd5 = (1-FreqC-FreqTFT) * Pdd + FreqTFT * ((Pcd + ((mu(2)-1)*Pdd))./mu(2)) + FreqC * Pcd;
Wc5 = (1-FreqC-FreqTFT) * Pdc + (FreqTFT+FreqC) * Pcc;

% The payoff functions for each stratgy mu = 15
Wtft15 = (1-FreqC-FreqTFT) * (((Pdc+(mu(3)-1)*Pdd))./mu(3)) + (FreqTFT+FreqC) * Pcc;
Wd15 = (1-FreqC-FreqTFT) * Pdd + FreqTFT * ((Pcd + ((mu(3)-1)*Pdd))./mu(3)) + FreqC * Pcd;
Wc15 = (1-FreqC-FreqTFT) * Pdc + (FreqTFT+FreqC) * Pcc;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the ternary countour plots for TFT mu = 1

figure
% Plot the ternary axis system
[h,hg,htick]=terplot;
% Plot the data
% First set the colormap (can't be done afterwards)
colormap(jet)
[hcont,ccont,hcb]=tercontour(FreqC,FreqTFT,1-FreqC-FreqTFT,Wtft1);
clabel(ccont,hcont);
set(hcont,'linewidth',2)
% Add the labels
hlabels=terlabel('Frequency C','Frequency TFT','Frequency D');


%--  Change the color of the grid lines
set(hg(:,3),'color',[0.8, 0.0, 0.1])
set(hg(:,2),'color',[0.2, 0.6, 0.3])
set(hg(:,1),'color',[0.0, 0.1, 0.8])

%--  Modify the labels
set(hlabels,'fontsize',12)
set(hlabels(3),'color',[0.8, 0.0, 0.1])
set(hlabels(2),'color',[0.2, 0.6, 0.3])
set(hlabels(1),'color',[0.0, 0.1, 0.8])

%--  Modify the tick labels
set(htick(:,1),'color',[0.0, 0.1, 0.8],'linewidth',3)
set(htick(:,2),'color',[0.2, 0.6, 0.3],'linewidth',3)
set(htick(:,3),'color',[0.8, 0.0, 0.1],'linewidth',3)

%--  Change the color of the patch
set(h,'facecolor','w','edgecolor','k')
%--  Change the colorbar
set(hcb,'xcolor','k','ycolor','k')
%--  Modify the figure color
set(gcf,'color',[1 1 1])
%-- Change some defaults
set(gcf,'paperpositionmode','auto','inverthardcopy','off')
print (gcf, '-dpng', '/Users/olendorf/Documents/Manuscripts/GameTheoryOpenScience/files/figures/tern_tft_1.png');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the ternary countour plots for TFT mu = 5

figure
% Plot the ternary axis system
[h,hg,htick]=terplot;
% Plot the data
% First set the colormap (can't be done afterwards)
colormap(jet)
[hcont,ccont,hcb]=tercontour(FreqC,FreqTFT,1-FreqC-FreqTFT,Wtft5);
clabel(ccont,hcont);
set(hcont,'linewidth',2)
% Add the labels
hlabels=terlabel('Frequency C','Frequency TFT','Frequency D');


%--  Change the color of the grid lines
set(hg(:,3),'color',[0.8, 0.0, 0.1])
set(hg(:,2),'color',[0.2, 0.6, 0.3])
set(hg(:,1),'color',[0.0, 0.1, 0.8])

%--  Modify the labels
set(hlabels,'fontsize',12)
set(hlabels(3),'color',[0.8, 0.0, 0.1])
set(hlabels(2),'color',[0.2, 0.6, 0.3])
set(hlabels(1),'color',[0.0, 0.1, 0.8])

%--  Modify the tick labels
set(htick(:,1),'color',[0.0, 0.1, 0.8],'linewidth',3)
set(htick(:,2),'color',[0.2, 0.6, 0.3],'linewidth',3)
set(htick(:,3),'color',[0.8, 0.0, 0.1],'linewidth',3)

%--  Change the color of the patch
set(h,'facecolor','w','edgecolor','k')
%--  Change the colorbar
set(hcb,'xcolor','k','ycolor','k')
%--  Modify the figure color
set(gcf,'color',[1 1 1])
%-- Change some defaults
set(gcf,'paperpositionmode','auto','inverthardcopy','off')
print (gcf, '-dpng', '/Users/olendorf/Documents/Manuscripts/GameTheoryOpenScience/files/figures/tern_tft_5.png');
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the ternary countour plots for TFT mu = 15

figure
% Plot the ternary axis system
[h,hg,htick]=terplot;
% Plot the data
% First set the colormap (can't be done afterwards)
colormap(jet)
[hcont,ccont,hcb]=tercontour(FreqC,FreqTFT,1-FreqC-FreqTFT,Wtft15);
clabel(ccont,hcont);
set(hcont,'linewidth',2)
% Add the labels
hlabels=terlabel('Frequency C','Frequency TFT','Frequency D');

%--  Change the color of the grid lines
set(hg(:,3),'color',[0.8, 0.0, 0.1])
set(hg(:,2),'color',[0.2, 0.6, 0.3])
set(hg(:,1),'color',[0.0, 0.1, 0.8])

%--  Modify the labels
set(hlabels,'fontsize',12)
set(hlabels(3),'color',[0.8, 0.0, 0.1])
set(hlabels(2),'color',[0.2, 0.6, 0.3])
set(hlabels(1),'color',[0.0, 0.1, 0.8])

%--  Modify the tick labels
set(htick(:,1),'color',[0.0, 0.1, 0.8],'linewidth',3)
set(htick(:,2),'color',[0.2, 0.6, 0.3],'linewidth',3)
set(htick(:,3),'color',[0.8, 0.0, 0.1],'linewidth',3)

%--  Change the color of the patch
set(h,'facecolor','w','edgecolor','k')
%--  Modify the figure color
set(gcf,'color',[1 1 1])
%-- Change some defaults
set(gcf,'paperpositionmode','auto','inverthardcopy','off')
print (gcf, '-dpng', '/Users/olendorf/Documents/Manuscripts/GameTheoryOpenScience/files/figures/tern_tft_15.png');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the ternary countour plots for C mu = 1

figure
% Plot the ternary axis system
[h,hg,htick]=terplot;
% Plot the data
% First set the colormap (can't be done afterwards)
colormap(jet)
[hcont,ccont,hcb]=tercontour(FreqC, FreqTFT, 1-FreqC-FreqTFT, Wc1);
clabel(ccont,hcont);
set(hcont,'linewidth',2)
% Add the labels
hlabels=terlabel('Frequency C','Frequency TFT','Frequency D');


%--  Change the color of the grid lines
set(hg(:,3),'color',[0.8, 0.0, 0.1])
set(hg(:,2),'color',[0.2, 0.6, 0.3])
set(hg(:,1),'color',[0.0, 0.1, 0.8])

%--  Modify the labels
set(hlabels,'fontsize',12)
set(hlabels(3),'color',[0.8, 0.0, 0.1])
set(hlabels(2),'color',[0.2, 0.6, 0.3])
set(hlabels(1),'color',[0.0, 0.1, 0.8])

%--  Modify the tick labels
set(htick(:,1),'color',[0.0, 0.1, 0.8],'linewidth',3)
set(htick(:,2),'color',[0.2, 0.6, 0.3],'linewidth',3)
set(htick(:,3),'color',[0.8, 0.0, 0.1],'linewidth',3)

%--  Change the color of the patch
set(h,'facecolor','w','edgecolor','k')
%--  Change the colorbar
set(hcb,'xcolor','k','ycolor','k')
%--  Modify the figure color
set(gcf,'color',[1 1 1])
%-- Change some defaults
set(gcf,'paperpositionmode','auto','inverthardcopy','off')
print (gcf, '-dpng', '/Users/olendorf/Documents/Manuscripts/GameTheoryOpenScience/files/figures/tern_c_1.png');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the ternary countour plots for C mu = 5

figure
% Plot the ternary axis system
[h,hg,htick]=terplot;
% Plot the data
% First set the colormap (can't be done afterwards)
colormap(jet)
[hcont,ccont,hcb]=tercontour(FreqC,FreqTFT,1-FreqC-FreqTFT,Wc5);
clabel(ccont,hcont);
set(hcont,'linewidth',2)
% Add the labels
hlabels=terlabel('Frequency C','Frequency TFT','Frequency D');


%--  Change the color of the grid lines
set(hg(:,3),'color',[0.8, 0.0, 0.1])
set(hg(:,2),'color',[0.2, 0.6, 0.3])
set(hg(:,1),'color',[0.0, 0.1, 0.8])

%--  Modify the labels
set(hlabels,'fontsize',12)
set(hlabels(3),'color',[0.8, 0.0, 0.1])
set(hlabels(2),'color',[0.2, 0.6, 0.3])
set(hlabels(1),'color',[0.0, 0.1, 0.8])

%--  Modify the tick labels
set(htick(:,1),'color',[0.0, 0.1, 0.8],'linewidth',3)
set(htick(:,2),'color',[0.2, 0.6, 0.3],'linewidth',3)
set(htick(:,3),'color',[0.8, 0.0, 0.1],'linewidth',3)

%--  Change the color of the patch
set(h,'facecolor','w','edgecolor','k')
%--  Change the colorbar
set(hcb,'xcolor','k','ycolor','k')
%--  Modify the figure color
set(gcf,'color',[1 1 1])
%-- Change some defaults
set(gcf,'paperpositionmode','auto','inverthardcopy','off')
print (gcf, '-dpng', '/Users/olendorf/Documents/Manuscripts/GameTheoryOpenScience/files/figures/tern_c_5.png');
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the ternary countour plots for C mu = 15

figure
% Plot the ternary axis system
[h,hg,htick]=terplot;
% Plot the data
% First set the colormap (can't be done afterwards)
colormap(jet)
[hcont,ccont,hcb]=tercontour(FreqC,FreqTFT,1-FreqC-FreqTFT,Wc15);
clabel(ccont,hcont);
set(hcont,'linewidth',2)
% Add the labels
hlabels=terlabel('Frequency C','Frequency TFT','Frequency D');

%--  Change the color of the grid lines
set(hg(:,3),'color',[0.8, 0.0, 0.1])
set(hg(:,2),'color',[0.2, 0.6, 0.3])
set(hg(:,1),'color',[0.0, 0.1, 0.8])

%--  Modify the labels
set(hlabels,'fontsize',12)
set(hlabels(3),'color',[0.8, 0.0, 0.1])
set(hlabels(2),'color',[0.2, 0.6, 0.3])
set(hlabels(1),'color',[0.0, 0.1, 0.8])

%--  Modify the tick labels
set(htick(:,1),'color',[0.0, 0.1, 0.8],'linewidth',3)
set(htick(:,2),'color',[0.2, 0.6, 0.3],'linewidth',3)
set(htick(:,3),'color',[0.8, 0.0, 0.1],'linewidth',3)

%--  Change the color of the patch
set(h,'facecolor','w','edgecolor','k')
%--  Modify the figure color
set(gcf,'color',[1 1 1])
%-- Change some defaults
set(gcf,'paperpositionmode','auto','inverthardcopy','off')
print (gcf, '-dpng', '/Users/olendorf/Documents/Manuscripts/GameTheoryOpenScience/files/figures/tern_c_15.png');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the ternary countour plots for D mu = 1

figure
% Plot the ternary axis system
[h,hg,htick]=terplot;
% Plot the data
% First set the colormap (can't be done afterwards)
colormap(jet)
[hcont,ccont,hcb]=tercontour(FreqC, FreqTFT, 1-FreqC-FreqTFT, Wd1);
clabel(ccont,hcont);
set(hcont,'linewidth',2)
% Add the labels
hlabels=terlabel('Frequency C','Frequency TFT','Frequency D');


%--  Change the color of the grid lines
set(hg(:,3),'color',[0.8, 0.0, 0.1])
set(hg(:,2),'color',[0.2, 0.6, 0.3])
set(hg(:,1),'color',[0.0, 0.1, 0.8])

%--  Modify the labels
set(hlabels,'fontsize',12)
set(hlabels(3),'color',[0.8, 0.0, 0.1])
set(hlabels(2),'color',[0.2, 0.6, 0.3])
set(hlabels(1),'color',[0.0, 0.1, 0.8])

%--  Modify the tick labels
set(htick(:,1),'color',[0.0, 0.1, 0.8],'linewidth',3)
set(htick(:,2),'color',[0.2, 0.6, 0.3],'linewidth',3)
set(htick(:,3),'color',[0.8, 0.0, 0.1],'linewidth',3)

%--  Change the color of the patch
set(h,'facecolor','w','edgecolor','k')
%--  Change the colorbar
set(hcb,'xcolor','k','ycolor','k')
%--  Modify the figure color
set(gcf,'color',[1 1 1])
%-- Change some defaults
set(gcf,'paperpositionmode','auto','inverthardcopy','off')
print (gcf, '-dpng', '/Users/olendorf/Documents/Manuscripts/GameTheoryOpenScience/files/figures/tern_d_1.png');

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the ternary countour plots for D mu = 5

figure
% Plot the ternary axis system
[h,hg,htick]=terplot;
% Plot the data
% First set the colormap (can't be done afterwards)
colormap(jet)
[hcont,ccont,hcb]=tercontour(FreqC,FreqTFT,1-FreqC-FreqTFT,Wd5);
clabel(ccont,hcont);
set(hcont,'linewidth',2)
% Add the labels
hlabels=terlabel('Frequency C','Frequency TFT','Frequency D');


%--  Change the color of the grid lines
set(hg(:,3),'color',[0.8, 0.0, 0.1])
set(hg(:,2),'color',[0.2, 0.6, 0.3])
set(hg(:,1),'color',[0.0, 0.1, 0.8])

%--  Modify the labels
set(hlabels,'fontsize',12)
set(hlabels(3),'color',[0.8, 0.0, 0.1])
set(hlabels(2),'color',[0.2, 0.6, 0.3])
set(hlabels(1),'color',[0.0, 0.1, 0.8])

%--  Modify the tick labels
set(htick(:,1),'color',[0.0, 0.1, 0.8],'linewidth',3)
set(htick(:,2),'color',[0.2, 0.6, 0.3],'linewidth',3)
set(htick(:,3),'color',[0.8, 0.0, 0.1],'linewidth',3)

%--  Change the color of the patch
set(h,'facecolor','w','edgecolor','k')
%--  Change the colorbar
set(hcb,'xcolor','k','ycolor','k')
%--  Modify the figure color
set(gcf,'color',[1 1 1])
%-- Change some defaults
set(gcf,'paperpositionmode','auto','inverthardcopy','off')
print (gcf, '-dpng', '/Users/olendorf/Documents/Manuscripts/GameTheoryOpenScience/files/figures/tern_d_5.png');
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the ternary countour plots for D mu = 15

figure
% Plot the ternary axis system
[h,hg,htick]=terplot;
% Plot the data
% First set the colormap (can't be done afterwards)
colormap(jet)
[hcont,ccont,hcb]=tercontour(FreqC,FreqTFT,1-FreqC-FreqTFT,Wd15);
clabel(ccont,hcont);
set(hcont,'linewidth',2)
% Add the labels
hlabels=terlabel('Frequency C','Frequency TFT','Frequency D');

%--  Change the color of the grid lines
set(hg(:,3),'color',[0.8, 0.0, 0.1])
set(hg(:,2),'color',[0.2, 0.6, 0.3])
set(hg(:,1),'color',[0.0, 0.1, 0.8])

%--  Modify the labels
set(hlabels,'fontsize',12)
set(hlabels(3),'color',[0.8, 0.0, 0.1])
set(hlabels(2),'color',[0.2, 0.6, 0.3])
set(hlabels(1),'color',[0.0, 0.1, 0.8])

%--  Modify the tick labels
set(htick(:,1),'color',[0.0, 0.1, 0.8],'linewidth',3)
set(htick(:,2),'color',[0.2, 0.6, 0.3],'linewidth',3)
set(htick(:,3),'color',[0.8, 0.0, 0.1],'linewidth',3)

%--  Change the color of the patch
set(h,'facecolor','w','edgecolor','k')
%--  Modify the figure color
set(gcf,'color',[1 1 1])
%-- Change some defaults
set(gcf,'paperpositionmode','auto','inverthardcopy','off')
print (gcf, '-dpng', '/Users/olendorf/Documents/Manuscripts/GameTheoryOpenScience/files/figures/tern_d_15.png');

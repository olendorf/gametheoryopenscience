clear all; close all;

% The payoff structure for the Prisoners' Dilemma
% To explore variation certain payoffs are given as
% vectors.
cla;
Pdc = 0;                % Payoff to cooperate against defect
Pcc = 5:2:9;            % Payoff to cooperate against cooperate
Pdd = 1:2:5;            % Payoff to defect against defect
Pcd = 8:2:12;           % Payoff to defect against cooperate

% Frequency of defectors in the population
Fd = 0:0.01:1;

% Expected number of interactions in a given game.
mu = 3:3:15;         

%%%%%%%%%%%%%%%%%%
% Fitness functions
%%%%%%%%%%%%%%%%%%

% Fitness of pure Cooperate in a population of Pure Cooperators and Defectors
FitnessCvsD = (1-Fd) * Pcc(2) + Fd * Pdc;

% Fitness of Defect in a population of Cooperators and Defectors
FitnessDvsC = (1-Fd) * Pcd(2) + Fd * Pdd(2);

% Plot the fitness of cooperate and defect as a function of the frequency
% of defect in the population.

%%%%%%%%%%%%%%%%%%%%
% Plot Cooperation vs Defect
%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot1 = plot(Fd, FitnessCvsD, Fd, FitnessDvsC);
set(plot1(1),...
    'Color',[0.168627455830574 0.505882382392883 0.337254911661148]);
set(plot1(2),'Color',[0.7843137383461 0 0]);
legend('Cooperate', 'Defect', 'Location', 'Best');
legend('boxon');
xlabel(['\fontsize{12}Frequency of Defectors'])
ylabel(['\fontsize{12}Expected Payoff']);
title(['\fontsize{16}Cooperators vs Defectors']);

print (gcf, '-dpng', '/Users/olendorf/Documents/Manuscripts/GameTheoryOpenScience/files/figures/DvsC.png');
clf;
%saveas(gcf, '../figures/DvsC.png');
%saveas(gcf, 'DvsC.fig');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fitness of Defect in a population of Defectors and TFT with varying
% values for the temptation to defect (Pcd);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Fitness of TFT with high and low expected number of interactions
FitnessTFTvsD_MedCC_HiMu = (1-Fd) * Pcc(2) + Fd * (Pdc + (mu(5) - 1) * Pdd(2))./mu(5);
FitnessTFTvsD_MedCC_LowMu = (1-Fd) * Pcc(2) + (Fd * (Pdc + (mu(1) - 1) * Pdd(2)))./mu(1);

% Fitness of Defect with TFT with high and low expected number of 
% interactions. The temptation to cheat (Pcd - the pay off when defecting
% while the opponent cooperates) varies from 8, 10 or 12.
FitnessDvsTFT_HighCD_HiMu = (1-Fd) * (Pcd(3) + Pdd(2) * (mu(5) - 1))./mu(5) + Fd * Pdd(2);
FitnessDvsTFT_MedCD_HiMu = (1-Fd) * (Pcd(2) + Pdd(2) * (mu(5) - 1))./mu(5) + Fd * Pdd(2);
FitnessDvsTFT_LowCD_HiMu = (1-Fd) * (Pcd(1) + Pdd(2) * (mu(5) - 1))./mu(5) + Fd * Pdd(2);

FitnessDvsTFT_HighCD_LowMu = ((1-Fd) * (Pcd(3) + Pdd(2) * (mu(1) - 1)))./mu(1) + Fd * Pdd(2);
FitnessDvsTFT_MedCD_LowMu = ((1-Fd) * (Pcd(2) + Pdd(2) * (mu(1) - 1)))./mu(1) + Fd * Pdd(2);
FitnessDvsTFT_LowCD_LowMu = ((1-Fd) * (Pcd(1) + Pdd(2) * (mu(1) - 1)))./mu(1) + Fd * Pdd(2);

%Calculate Critical frequencies of Defect vs Mu
mu_crit = 2:40;
FdCrit_CD8 = (Pcd(1) - Pdd(2) - Pcc(2)*mu_crit + Pdd(2)*mu_crit)./(Pcd(2) + Pdc - 2*Pdd(2) - Pcc(2)*mu_crit + Pdd(2)*mu_crit);
FdCrit_CD10 = (Pcd(2) - Pdd(2) - Pcc(2)*mu_crit + Pdd(2)*mu_crit)./(Pcd(2) + Pdc - 2*Pdd(2) - Pcc(2)*mu_crit + Pdd(2)*mu_crit);
FdCrit_CD12 = (Pcd(3) - Pdd(2) - Pcc(2)*mu_crit + Pdd(2)*mu_crit)./(Pcd(2) + Pdc - 2*Pdd(2) - Pcc(2)*mu_crit + Pdd(2)*mu_crit);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create subplots 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Subplot
%subplot(2,2,[1,3]);
plot2 = plot(...
        Fd, FitnessTFTvsD_MedCC_LowMu, ...
        Fd, FitnessDvsTFT_HighCD_LowMu, ...
        Fd, FitnessDvsTFT_MedCD_LowMu,...
        Fd, FitnessDvsTFT_LowCD_LowMu ...
    );
title(['\fontsize{16}TFT vs Defectors (\mu = 3)']);

axis([0, 1, 2, 7]);
ylabel(['\fontsize{12}Expected Payoff']);

legend(...
    'TFT', ...
    'Defect  Pcd = 12', ...
    'Defect  Pcd = 10', ...
    'Defect  Pcd = 8' ...
    );

set(plot2(1), ...
    'Color',[0 0 0.82745098]);
set(plot2(2), ...
    'Color',[0.7843137383461 0 0]);
set(plot2(3), ...
    'Color',[0.7843137383461 0.5 0]);
set(plot2(4), ...
    'Color',[0.7843137383461 0.75 0]);
print (gcf, '-dpng', '/Users/olendorf/Documents/Manuscripts/GameTheoryOpenScience/files/figures/DvsTFT_mu3.png');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Subplot
%subplot(2,2,[2,4]);
figure
plot3 = plot(...
        Fd, FitnessTFTvsD_MedCC_HiMu, ...
        Fd, FitnessDvsTFT_HighCD_HiMu, ...
        Fd, FitnessDvsTFT_MedCD_HiMu, ...
        Fd, FitnessDvsTFT_LowCD_HiMu ...
    );
title(['\fontsize{16}TFT vs Defectors (\mu = 15)']);

axis([0, 1, 2, 7]);
xlabel(['\fontsize{12}Frequency of Defectors']);
ylabel(['\fontsize{12}Expected Payoff']);

legend(...
    'TFT', ...
    'Defect  Pcd = 12', ...
    'Defect  Pcd = 10', ...
    'Defect  Pcd = 8' ...
    );

set(plot3(1), ...
    'Color',[0 0 0.82745098]);
set(plot3(2), ...
    'Color',[0.7843137383461 0 0]);
set(plot3(3), ...
    'Color',[0.7843137383461 0.5 0]);
set(plot3(4), ...
    'Color',[0.7843137383461 0.75 0]);
print (gcf, '-dpng', '/Users/olendorf/Documents/Manuscripts/GameTheoryOpenScience/files/figures/DvsTFT_mu15.png');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Subplot Mu vs Critical Frequency of D
figure
%subplot(2,2,3:4);
plot4 = plot(mu_crit, FdCrit_CD8, mu_crit, FdCrit_CD10, mu_crit, FdCrit_CD12);
title(['\fontsize{16}Critical Frequencies of Defect vs. \mu']);
xlabel(['\fontsize{12}\mu']);
ylabel(['\fontsize{12}Critical Frequency of Defect']);

legend('Pcd = 8', 'Pcd = 10', 'Pcd = 12', 'Location', 'Best');
set(plot4(1), ...
    'Color',[0.7843137383461 0 0]);
set(plot4(2), ...
    'Color',[0.7843137383461 0.5 0]);
set(plot4(3), ...
    'Color',[0.7843137383461 0.75 .25]);
print (gcf, '-dpng', '/Users/olendorf/Documents/Manuscripts/GameTheoryOpenScience/files/figures/fdcrit.png');

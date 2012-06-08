% The payoff structure for the Prisoners' Dilemma
% To explore variation certain payoffs are given as
% vectors.

Pdc = 0;                % Payoff to cooperate against defect
Pcc = 5:2:9;            % Payoff to cooperate against cooperate
Pdd = 1:2:5;            % Payoff to defect against defect
Pcd = 8:2:12;           % Payoff to defect against cooperate

% Frequency of defectors in the population
Fd = 0:0.01:1;

% Expected number of interactions in a given game.
mu = 5:5:15;         

%%%%%%%%%%%%%%%%%%
% Fitness functions
%%%%%%%%%%%%%%%%%%

% Fitness of pure Cooperate in a population of Pure Cooperators and Defectors
FitnessCvsD = (1-Fd) * Pcc(2) + Fd * Pdc;

% Fitness of Defect in a population of Cooperators and Defectors
FitnessDvsC = (1-Fd) * Pcd(2) + Fd * Pdd(2);

% Plot the fitness of cooperate and defect as a function of the frequency
% of defect in the population.
DvsC = plot(Fd, FitnessCvsD, Fd, FitnessDvsC);
legend('Cooperate', 'Defect', 'Location', 'Best');
legend('boxon');
xlabel(['\fontsize{12}Frequency of Defectors'])
ylabel(['\fontsize{12}Expected Fitness']);
title(['\fontsize{16}Cooperators vs Defectors']);
saveas(gcf, 'files/figures/DvsC.png');
saveas(gcf, 'files/matlab/DvsC.fig');
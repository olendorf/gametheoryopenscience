Pdd = 3; Pcc = 7; Pdc = 0; Pcd = 10;
Wc_in_cd = (1-Fd)*Pdc + Fd*Pcc;
Fd = 0:0.01:1;
Wc_in_cd = (1-Fd)*Pcc + Fd*Pdc;
Wd_in_cd = (1-Fd)*Pcd + Fd*Pdd;
plot(Fd, Wc_in_cd, Fd, Wd_in_cd)
leg = legend('Payoff to C', 'Payoff to D');
xlabel('Frequency of D Strategy');
ylabel('Mean PayOff per Interaction');

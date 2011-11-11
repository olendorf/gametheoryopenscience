%-- 11/11/2011 12:42 PM --%
mu2 = 2; mu5 = 5; mu10 = 10;
Fd = 0:0.1:1; Pcc = 7; Pcd = 10; Pdc = 0; Pdd = 3;
Wtft_vs_d_mu2 = (1-Fd)*Pcc + Fd*((Pdc + (mu2-1)*Pdd)/mu2);
Wtft_vs_d_mu5 = (1-Fd)*Pcc + Fd*((Pdc + (mu5-1)*Pdd)/mu5);
Wtft_vs_d_mu10 = (1-Fd)*Pcc + Fd*((Pdc + (mu10-1)*Pdd)/mu10);
Wd_vstft_mu2 = (1-Fd)*((Pcd + (mu2-1)*Pdd)/mu2) + Fd*Pdd;
Wd_vstft_mu5 = (1-Fd)*((Pcd + (mu5-1)*Pdd)/mu5) + Fd*Pdd;
Wd_vstft_mu10 = (1-Fd)*((Pcd + (mu10-1)*Pdd)/mu10) + Fd*Pdd;
plot(Fd, Wtft_vs_d_mu2, '-.b',Fd, Wtft_vs_d_mu5, '--b',Fd, Wtft_vs_d_mu10, '-b');
hold all
plot(Fd, Wd_vstft_mu2, '-.g',Fd, Wd_vstft_mu5, '--g',Fd, Wd_vstft_mu10, '-g');

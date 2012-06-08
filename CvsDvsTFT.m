clear all;
close all;
index = 0;

Pdc = 0;
Pcd = 10;
Pcc = 7;
Pdd = 3;

mu = 15;

% how fine to divide the frequencies. A value of 100 would simulate
% frequencies ever 0.01
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

Wtft = (1-FreqC-FreqTFT) * ((Pdc+(mu-1) * Pdd)./mu) + (FreqTFT+FreqC) * Pcc;
Wd = (1-FreqC-FreqTFT) * Pdd + FreqTFT * ((Pcd + (mu-1)*Pdd)./mu) + FreqC * Pcd;
Wc = (1-FreqC-FreqTFT) * Pdc + (FreqTFT+FreqC) * Pcc;



clear i j k index

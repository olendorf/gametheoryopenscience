function crit = fdcrit(cd, dd, cc, dc, mu)
    crit = (cd - dd - cc*mu + dd*mu)/(cd + dc - 2*dd - cc*mu + dd*mu);

mu = 2:30;
FdCrit = fdcrit(10, 3, 7, 0, 2)
    

mhat = ...;
p2 = 0;
sigma2 = 0.03;
rho2 = 0.01;

for i = 1:300
        K = (p2 + sigma2)/(p2 + sigma2 + rho2);
        mhat = mhat + K * (z(i,1) - mhat);
        p2 = (1 - K)*(p2 + rho2);
end

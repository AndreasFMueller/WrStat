for i = 1:10000
    x = ceil(rand(3,1) * 6);
    a(i) = mean(power(x,2)) - mean(x)^2;
endfor;
mean(a)

for i = 1:10000
    x = rand(3,1);
    a(i) = mean(x);
    b(i) = median(x);
endfor;
var(a)
var(b)

positions = csvread("gps.csv");
filteredpositions = zeros(1, length(positions));
filteredvelocities = zeros(1, length(positions));

deltat = 1;
phi = [ 1, deltat; 0, 1 ];
H = [ 1, 0 ];
Q = [ 1, 0; 0, 1 ];
R = [ 9 ];
P = eye(2);
x = [ 0; 0 ];

for k = 1:length(positions)
        z = positions(1, k);

        # prediction step
        xpredict = phi * x;
        Ppredict = phi * P * phi' + Q;

        # correction step
        K = Ppredict * H' * (H * P * H' + R)^(-1);
        x = xpredict - K * (H * xpredict - z);
        P = (eye(2) - K * H) * Ppredict;

        # display new estimates
        printf("%d %f %f(+-%f) %f(+-%f)\n", k, z, x(1), sqrt(P(1,1)), \
                x(2), sqrt(P(2,2)));
        filteredpositions(k) = x(1);
        filteredvelocities(k) = x(2);
endfor


#
# kalman.m -- kalman filter implementation for 2D GPS data
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#

# read GPS data from fiel gps.csv
fid = fopen("gps.csv", "r");

# initialize everything
deltat = 5;
phi = [
    1, deltat, 0,      0;
    0,      1, 0,      0;
    0,      0, 1, deltat;
    0,      0, 0,      1
];
H = [
    1, 0, 0, 0;
    0, 0, 1, 0
];
sigmax = 0.01;
sigmav = 0.01;
Q = [
    sigmax,      0,      0,      0;
         0, sigmav,      0,      0;
         0,      0, sigmax,      0;
         0,      0,      0, sigmav
];
rho = 9;
R = [
    rho,   0;
      0, rho
];
P = zeros(4, 4);
x = zeros(4, 1);

out = fopen("filtered.csv", "w");
fprintf(out, "x,y,px,vx,vy,pv\n");

counter = 0;
while (!feof(fid))
        z = fscanf(fid, "%f,%f\n", 2);
	counter = counter + 1;

        # prediction step
        xpredict = phi * x;
        Ppredict = phi * P * phi' + Q;

        # correction step
        K = Ppredict * H' * (H * P * H' + R)^(-1);
        x = xpredict - K * (H * xpredict - z);
        P = (eye(4) - K * H) * Ppredict;

        # display new estimates
	printf("%04d %8.1f %8.1f   %8.1f %8.1f", counter, z(1), z(2), x(1), x(3));
	printf(" (%6.2f)", sqrt(P(1,1) + P(3,3)))
	printf("   %6.2f %6.2f (%6.3f)", x(2), x(4), sqrt(P(2,2) + P(4,4)));
	printf("\n")

	positions(counter, 1:2) = [ x(1), x(3) ];
	velocities(counter, 1:2) = [ x(2), x(4) ];

	fprintf(out, "%f,%f,%f,%f,%f,%f\n", x(1), x(3), sqrt(P(1,1) + P(3,3)),
		x(2), x(4), sqrt(P(2,2) + P(4,4)));

endwhile

h = plot(positions(:,1), positions(:,2));
xlabel("x");
ylabel("y");
saveas(h, "positions.eps", "eps");

h = plot(velocities(:,1), velocities(:,2));
axis([-2, 2, -2, 2], "square");
xlabel("v_x");
ylabel("v_y");
saveas(h, "velocities.eps", "eps");

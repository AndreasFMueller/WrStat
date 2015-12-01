#
# tacho.m -- Kalman-Filter fuer Orts- und Geschwindigkeitsmessung
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#

# Zeitschritt 0.1s
deltat = 0.1;
# Annahme: 3m/s^2 Beschleuning
sigmav = 3 * deltat;
# Annahme: Positionsfehler durch
# Geschwindigkeitsfehler verursacht
sigmax = sigmav * deltat;

I = eye(2);

# Systembeschreibung
phi = [ 1, deltat; 0, 1 ];
Q = diag(sigmax^2, sigmav^2);

# Messprozess, Position wird gemessen (z.B. GPS Position)
H = [ 1, 0 ];
global sigmaz = 0.7;
# Messfehler 70cm
R = [ sigmaz^2 ];

# Input 
function retval = messung(t)
	global sigmaz;
	e = normrnd(0, sigmaz);
	if (t < 10)
		retval = 0 + e;
	elseif (t < 20)
		retval = t - 10 + e;
	else
		retval = 10 + e;
	endif
endfunction

# Initialisierung
x = [ 0; 0];
P = zeros(2, 2);
t = 0;
tlimit = 30;

N = tlimit / deltat;
resultate = zeros(N, 8);
i = 1;

while (t < tlimit)
	# Vorhersage
	xpred = phi * x;
	Ppred = phi * P * phi' + Q;

	# Korrektur
	K = Ppred * H' * pinv(H * Ppred * H' + R);
	z = messung(t);
	x = (I - K * H) * xpred + K * z;
	P = (I - K * H) * Ppred;

	# Zeit
	t = t + deltat;

	# output
	printf("%3.1f, %8.4f,  %8.4f,(%8.4f),  %8.4f,(%8.4f), %8.4f, %8.4f\n", t, z, x(1), sqrt(P(1,1)), x(2), sqrt(P(2,2)), K(1,1), K(2,1))

	# in einem Array speichern
	resultate(i, 1) = t;
	resultate(i, 2) = z;
	resultate(i, 3) = x(1);
	resultate(i, 4) = 3 * sqrt(P(1,1));
	resultate(i, 5) = x(2);
	resultate(i, 6) = sqrt(P(2,2));
	resultate(i, 7) = K(1,1);
	resultate(i, 8) = K(2,1);
	i = i + 1;
endwhile

fid = fopen("curves.mp", "w");

fprintf(fid, "path zmeasured; zmeasured = (0, 0)");
for i = 1:N
	fprintf(fid, "\n--(%.4f * tunit, %.4f * xunit)", resultate(i, 1), resultate(i,2));
endfor
fprintf(fid, ";\n");

fprintf(fid, "path xfiltered; xfiltered = (0, 0)");
for i = 1:N
	fprintf(fid, "\n--(%.4f * tunit, %.4f * xunit)", resultate(i, 1), resultate(i,3));
endfor
fprintf(fid, ";\n");

fprintf(fid, "path xerror; xerror = (0, 0)");
for i = 1:N
	fprintf(fid, "\n--(%.4f * tunit, %.4f * xunit)", resultate(i, 1), resultate(i,3) - resultate(i, 4));
endfor
for i = 1:N
	fprintf(fid, "\n--(%.4f * tunit, %.4f * xunit)", resultate(N+1-i, 1), resultate(N+1-i,3) + resultate(N+1-i, 4));
endfor
fprintf(fid, "\n--cycle;\n");

fprintf(fid, "path vfiltered; vfiltered = (0, 0)");
for i = 1:N
	fprintf(fid, "\n--(%.4f * tunit, %.4f * vunit)", resultate(i, 1), resultate(i,5));
endfor
fprintf(fid, ";\n");

fprintf(fid, "path verror; verror = (0, 0)");
for i = 1:N
	fprintf(fid, "\n--(%.4f * tunit, %.4f * vunit)", resultate(i, 1), resultate(i,5) - resultate(i, 6));
endfor
for i = 1:N
	fprintf(fid, "\n--(%.4f * tunit, %.4f * vunit)", resultate(N+1-i, 1), resultate(N+1-i,5) + resultate(N+1-i, 6));
endfor
fprintf(fid, "\n--cycle;\n");




fclose(fid);

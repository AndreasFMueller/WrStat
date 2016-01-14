# Umrechnungskonstante fuer Erdbeschleunigung
g = 9.81

# Hilfsfunktion: quadrieren
function s = sqr(x)
	s = x * x;
endfunction

# Matrizen (zeitlich konstant)
# Zeitentwicklung
Deltat = 0.01
phi = [ 1, Deltat; 0, 1 ]
# Systemfehler
Q = [ sqr(Deltat * g), 0; 0, sqr(g) ]
# Messfehler
R = [ sqr(g) ]
# Messmatrix
H = [ 0, 1 ]

# Matrizen fuer die Zustandsschaetzung
# Zustandsvektor
x = [ 0; 0 ]
# Fehlerkovarianzmatrix
P = zeros(2,2)

# Datenfile oeffnen
fid = fopen("data.csv", "r")

while (!feof(fid)) 
	# Praediktorschritt
	xpred = phi * x;
	Ppred = phi * P * phi' + Q;

	# Berechnung der Kalman Matrix
	K = Ppred * H' * (H * Ppred * H' + R)^-1

	# Korrektorschritt
	z = 9.81 * fscanf(fid, "%f", 1);
	xcorr = K * z + (eye(2) - K * H) * xpred;
	Pcorr = (eye(2) - H * K) * Ppred;

	# korrigierte Werte als Startwerte fuer naechste Iteration verwenden
	x = xcorr
	P = Pcorr;
endwhile

fclose(fid);

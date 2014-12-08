#
# Auswertung zum Mandarinen-Problem erzeugen
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
graphs = mandarinen.pdf mandarinenqq.pdf

all:	$(graphs)

$(graphs) mandarinen.txt:	mandarinen.R mandarinen.csv
	R --vanilla --quiet < mandarinen.R > mandarinen.txt

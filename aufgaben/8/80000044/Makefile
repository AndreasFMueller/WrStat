#
# Makefile -- Todesfallstatistik für über 20-40-jährige
#
# (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
#

ueber.txt:	ueber.R data.csv
	R --quiet --vanilla < ueber.R  | tee ueber.txt

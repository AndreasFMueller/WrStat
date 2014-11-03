#
# Makefile -- build images for the EEVblog resistor analysis
#
# (c) 2014 Prof Dr Andreas Mueller, Hochschule Rapperswil
#

ecdf.pdf qq.pdf: eevblogresistors.R eevblogresistors.csv
	R --vanilla --quite < eevblogresistors.R

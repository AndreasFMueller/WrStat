#
# Makefile -- build parts of the script
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
parts =	skript-00-intro.pdf		\
	skript-01-chapter1.pdf		\
	skript-02-chapter2.pdf		\
	skript-03-chapter3.pdf		\
	skript-04-chapter4.pdf		\
	skript-05-chapter5.pdf		\
	skript-06-chapter6.pdf		\
	skript-07-chapter7.pdf		\
	skript-08-chapter8.pdf		\
	skript-09-verteilungen.pdf	\
	skript-10-tabellen.pdf		\
	skript-11-index.pdf

parts:	$(parts)

skript-00-intro.pdf:	../skript.pdf
	pdfjam --outfile skript-00-intro.pdf ../skript.pdf 1-12

skript-01-chapter1.pdf:	../skript.pdf
	pdfjam --outfile skript-01-chapter1.pdf ../skript.pdf 13-26 

skript-02-chapter2.pdf:	../skript.pdf
	pdfjam --outfile skript-02-chapter2.pdf ../skript.pdf 27-64

skript-03-chapter3.pdf:	../skript.pdf
	pdfjam --outfile skript-03-chapter3.pdf ../skript.pdf 65-90 

skript-04-chapter4.pdf:	../skript.pdf
	pdfjam --outfile skript-04-chapter4.pdf ../skript.pdf 91-108

skript-05-chapter5.pdf:	../skript.pdf
	pdfjam --outfile skript-05-chapter5.pdf ../skript.pdf 109-150

skript-06-chapter6.pdf:	../skript.pdf
	pdfjam --outfile skript-06-chapter6.pdf ../skript.pdf 151-164

skript-07-chapter7.pdf:	../skript.pdf
	pdfjam --outfile skript-07-chapter7.pdf ../skript.pdf 165-178

skript-08-chapter8.pdf:	../skript.pdf
	pdfjam --outfile skript-08-chapter8.pdf ../skript.pdf 179-206

skript-09-verteilungen.pdf:	../skript.pdf
	pdfjam --outfile skript-09-verteilungen.pdf ../skript.pdf 207-218

skript-10-tabellen.pdf:	../skript.pdf
	pdfjam --outfile skript-10-tabellen.pdf ../skript.pdf 219-224

skript-11-index.pdf:	../skript.pdf
	pdfjam --outfile skript-11-index.pdf ../skript.pdf 225-227

religionen = c("Christen", "Muslime", "Juden", "Andere", "Keine")
einwohner = c(250535, 20888, 4903, 6859, 80088)
schueler = c(13, 4, 1, 0, 4)
n = sum(schueler)

wahrscheinlichkeit = einwohner / sum(einwohner)
wahrscheinlichkeit

t <- data.frame(religionen = religionen, einwohner = einwohner, p = wahrscheinlichkeit, schueler = schueler)
t$npi = n * t$p
t$delta = t$schueler - t$npi
t$q = (t$delta * t$delta) / t$npi
t
sum(t$q)

chisq.test(schueler, p = wahrscheinlichkeit) 

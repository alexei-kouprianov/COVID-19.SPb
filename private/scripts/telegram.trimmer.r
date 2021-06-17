tlg.raw <- read.table("/home/tinea/Documents/H_et_S/Projects/github/COVID.2019.ru/scripts/telegram.spb/telegram.spb.examined.txt", h=TRUE, sep="\t")

tlg.trimmed <- cbind.data.frame(
	as.Date(strptime(tlg.raw$TIMECODE[1:(nrow(tlg.raw)-1)], "%d.%m.%Y %H:%M:%S")),
	tlg.raw$TESTS[2:nrow(tlg.raw)]
	)

colnames(tlg.trimmed) <- c("DATE", "TESTS")

write.table(tlg.trimmed, "/home/tinea/Documents/H_et_S/Projects/github/COVID-19.SPb/data/primary/covid.SPb.PCRtests.txt", row.names=FALSE, sep="\t")


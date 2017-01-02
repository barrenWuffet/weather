
rm(list = ls(all = T))
gc()


library(RJSONIO)

conn1 <- odbcConnect("PostgreSQL35W", uid = 'postgres')


loc1 <- read.csv("C:\\SVN\\weather\\data\\reference_data\\20170102_locations.csv", head = F)
names(loc1) <- c('City','State')


for(i in 1:nrow(loc1)){ # i = 1
	city1 <- as.character(loc1[i,'City'])
	state1 <- as.character(loc1[i,'State'])
	url1 <- paste('http://api.wunderground.com/api/1ead1116c63dc43a/geolookup/conditions/q/',state1,'/',city1,'.json', sep = '')
	raw1 <- fromJSON(url1)
	out1 <- paste('Current Temp in ', city1,', ', state1, ': ',raw1$current_observation$temperature_string, sep = '')
	print(out1);flush.console()
}


raw1 <- fromJSON('http://api.wunderground.com/api/1ead1116c63dc43a/geolookup/conditions/q/NJ/Bloomfield.json')


















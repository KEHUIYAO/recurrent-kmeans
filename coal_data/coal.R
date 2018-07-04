rm(list=ls())

######################################################################################
##
## Title:     R codes for cleaning the coal dataset
## Date:      4/2/2018
##
########################################################################################



# Change system language into English
Sys.setlocale("LC_TIME", "English")


#Read data from original form as:
#"CHOWBENT. Gib Field Pit. Atherton, Lancashire. 11th. February, 1850."
coaldata <- read.csv("coaldata.csv", header = F)
N = dim(coaldata)[1]
event <- list()
for (i in 1:N) {
  event[[i]] <- as.character(coaldata[i,])
  event[[i]]
}


# Read the first location "Lancashire"
readDateLancashire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Lancashire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                       replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# Read the second location "Durham"
readDateDurham <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Durham[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# Read the 3rd location "Fifeshire"
readDateFifeshire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Fifeshire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 4 Wales//only one data point
readDateWales <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Wales[\\.|,| ]([^>]*)", replacement="\\1", x=driver)[1]
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 5 Staffordshire
readDateStaffordshire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Staffordshire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 6 Glamorganshire
readDateGlamorganshire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Glamorganshire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 7 Renfrewshire // one data point
readDateRenfrewshire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Renfrewshire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 8 Gloucester // 2 data point
readDateGloucestershire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Gloucestershire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 9 Worcestershire // 5 events
readDateWorcestershire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Worcestershire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 10 Somersetshire // 4 events
readDateSomersetshire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Somersetshire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 11 Yorkshire 
readDateYorkshire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Yorkshire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 12 Carmarthenshire // 2 events
readDateCarmarthenshire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Carmarthenshire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 13 Monmouthshire 
readDateMonmouthshire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Monmouthshire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 14 Dunfirmline // one event
readDateDunfirmline <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Dunfirmline[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 15 Scotland // one event
readDateScotland <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Scotland[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 16 Derbyshire 
readDateDerbyshire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Derbyshire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 17 Denbighshire // 4 events
readDateDenbighshire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Denbighshire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 18 Cheshire // 7 events
readDateCheshire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Cheshire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 19 Cornwall // 7 events
readDateCornwall <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Cornwall[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 20 Shropshire // 6 events
readDateShropshire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Shropshire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}

# 21 Flintshire // 7 events
readDateFlintshire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Flintshire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 22 Northumberland // 5 events
readDateNorthumberland <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Northumberland[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}


# 23 Warwickshire // 5 events
readDateWarwickshire <- function(location){
  driver <- grep(pattern = location, x = event, ignore.case=TRUE, value = TRUE)
  #(driver1.split = strsplit(x=driver1, split="\\.|,"))
  driver.date.origin <- sub(pattern = ".*Warwickshire[\\.|,| ]([^>]*)", replacement="\\1", x=driver)
  driver.dates <- sub(pattern = " (\\d+)\\w{2}\\. (\\w+), (\\d+).*", 
                      replacement="\\2 \\1 \\3", x=driver.date.origin)
  driver.date <- as.Date(driver.dates, "%B %d %Y")
  result <- list(driver.dates, driver.date)
  return (result)
}

locations <- c("Lancashire", "Durham", "Fifeshire", "Wales", "Staffordshire", 
               "Glamorganshire", "Renfrewshire", "Gloucestershire", "Worcestershire", "Somersetshire", 
               "Yorkshire", "Carmarthenshire", "Monmouthshire", "Dunfirmline", "Scotland", 
               "Derbyshire", "Denbighshire", "Cheshire", "Cornwall", "Shropshire", 
               "Flintshire", "Northumberland", "Warwickshire")
k <- length(locations)


#get location, event_date, event_time, and cumulative_event_time
eventdate1 <- readDateLancashire(locations[1])[[1]]
eventtime1 <- readDateLancashire(locations[1])[[2]]
cumulativeet1 <- eventtime1 - as.Date("1850-01-01")

eventdate2 <- readDateDurham(locations[2])[[1]]
eventtime2 <- readDateDurham(locations[2])[[2]]
cumulativeet2 <- eventtime2 - as.Date("1850-01-01")

eventdate3 <- readDateFifeshire(locations[3])[[1]]
eventtime3 <- readDateFifeshire(locations[3])[[2]]
cumulativeet3 <- eventtime3 - as.Date("1850-01-01")

eventdate4 <- readDateWales(locations[4])[[1]]
eventtime4 <- readDateWales(locations[4])[[2]]
cumulativeet4 <- eventtime4 - as.Date("1850-01-01")

eventdate5 <- readDateStaffordshire(locations[5])[[1]]
eventtime5 <- readDateStaffordshire(locations[5])[[2]]
cumulativeet5 <- eventtime5 - as.Date("1850-01-01")

eventdate6 <- readDateGlamorganshire(locations[6])[[1]]
eventtime6 <- readDateGlamorganshire(locations[6])[[2]]
cumulativeet6 <- eventtime6 - as.Date("1850-01-01")

eventdate7 <- readDateRenfrewshire(locations[7])[[1]]
eventtime7 <- readDateRenfrewshire(locations[7])[[2]]
cumulativeet7 <- eventtime7 - as.Date("1850-01-01")

eventdate8 <- readDateGloucestershire(locations[8])[[1]]
eventtime8 <- readDateGloucestershire(locations[8])[[2]]
cumulativeet8 <- eventtime8 - as.Date("1850-01-01")

eventdate9 <- readDateWorcestershire(locations[9])[[1]]
eventtime9 <- readDateWorcestershire(locations[9])[[2]]
cumulativeet9 <- eventtime9 - as.Date("1850-01-01")

eventdate10 <- readDateSomersetshire(locations[10])[[1]]
eventtime10 <- readDateSomersetshire(locations[10])[[2]]
cumulativeet10 <- eventtime10 - as.Date("1850-01-01")

eventdate11 <- readDateYorkshire(locations[11])[[1]]
eventtime11 <- readDateYorkshire(locations[11])[[2]]
cumulativeet11 <- eventtime11 - as.Date("1850-01-01")

eventdate12 <- readDateCarmarthenshire(locations[12])[[1]]
eventtime12 <- readDateCarmarthenshire(locations[12])[[2]]
cumulativeet12 <- eventtime12 - as.Date("1850-01-01")

eventdate13 <- readDateMonmouthshire(locations[13])[[1]]
eventtime13 <- readDateMonmouthshire(locations[13])[[2]]
cumulativeet13 <- eventtime13 - as.Date("1850-01-01")

eventdate14 <- readDateDunfirmline(locations[14])[[1]]
eventtime14 <- readDateDunfirmline(locations[14])[[2]]
cumulativeet14 <- eventtime14 - as.Date("1850-01-01")

eventdate15 <- readDateScotland(locations[15])[[1]]
eventtime15 <- readDateScotland(locations[15])[[2]]
cumulativeet15 <- eventtime15 - as.Date("1850-01-01")

eventdate16 <- readDateDerbyshire(locations[16])[[1]]
eventtime16 <- readDateDerbyshire(locations[16])[[2]]
cumulativeet16 <- eventtime16 - as.Date("1850-01-01")

eventdate17 <- readDateDenbighshire(locations[17])[[1]]
eventtime17 <- readDateDenbighshire(locations[17])[[2]]
cumulativeet17 <- eventtime17 - as.Date("1850-01-01")

eventdate18 <- readDateCheshire(locations[18])[[1]]
eventtime18 <- readDateCheshire(locations[18])[[2]]
cumulativeet18 <- eventtime18 - as.Date("1850-01-01")

eventdate19 <- readDateCornwall(locations[19])[[1]]
eventtime19 <- readDateCornwall(locations[19])[[2]]
cumulativeet19 <- eventtime19 - as.Date("1850-01-01")

eventdate20 <- readDateShropshire(locations[20])[[1]]
eventtime20 <- readDateShropshire(locations[20])[[2]]
cumulativeet20 <- eventtime20 - as.Date("1850-01-01")

eventdate21 <- readDateFlintshire(locations[21])[[1]]
eventtime21 <- readDateFlintshire(locations[21])[[2]]
cumulativeet21 <- eventtime21 - as.Date("1850-01-01")

eventdate22 <- readDateNorthumberland(locations[22])[[1]]
eventtime22 <- readDateNorthumberland(locations[22])[[2]]
cumulativeet22 <- eventtime22 - as.Date("1850-01-01")

eventdate23 <- readDateWarwickshire(locations[23])[[1]]
eventtime23 <- readDateWarwickshire(locations[23])[[2]]
cumulativeet23 <- eventtime23 - as.Date("1850-01-01")


n <- c()

n[1] <- length(eventdate1)
n[2] <- length(eventdate2)
n[3] <- length(eventdate3)
n[4] <- length(eventdate4)
n[5] <- length(eventdate5)
n[6] <- length(eventdate6)
n[7] <- length(eventdate7)
n[8] <- length(eventdate8)
n[9] <- length(eventdate9)
n[10] <- length(eventdate10)
n[11] <- length(eventdate11)
n[12] <- length(eventdate12)
n[13] <- length(eventdate13)
n[14] <- length(eventdate14)
n[15] <- length(eventdate15)
n[16] <- length(eventdate16)
n[17] <- length(eventdate17)
n[18] <- length(eventdate18)
n[19] <- length(eventdate19)
n[20] <- length(eventdate20)
n[21] <- length(eventdate21)
n[22] <- length(eventdate22)
n[23] <- length(eventdate23)

# n is the count of events for each individual
n

#Combine the datas for different locations together
eventdate <- t(cbind(t(eventdate1), t(eventdate2),  t(eventdate3),  t(eventdate4),  t(eventdate5),
                     t(eventdate6), t(eventdate7),  t(eventdate8),  t(eventdate9),  t(eventdate10),
                     t(eventdate11), t(eventdate12),  t(eventdate13),  t(eventdate14),  t(eventdate15),
                     t(eventdate16), t(eventdate17),  t(eventdate18),  t(eventdate19),  t(eventdate20),
                     t(eventdate21), t(eventdate22),  t(eventdate23)))

eventtime <- as.Date(t(cbind(t(eventtime1), t(eventtime2),  t(eventtime3),  t(eventtime4),  t(eventtime5),
                             t(eventtime6), t(eventtime7),  t(eventtime8),  t(eventtime9),  t(eventtime10),
                             t(eventtime11), t(eventtime12),  t(eventtime13),  t(eventtime14),  t(eventtime15),
                             t(eventtime16), t(eventtime17),  t(eventtime18),  t(eventtime19),  t(eventtime20),
                             t(eventtime21), t(eventtime22),  t(eventtime23))), origin = "1970-01-01")

cumulativeet <- t(cbind(t(cumulativeet1), t(cumulativeet2), t(cumulativeet3), t(cumulativeet4),
                        t(cumulativeet5), t(cumulativeet6), t(cumulativeet7), t(cumulativeet8),
                        t(cumulativeet9), t(cumulativeet10), t(cumulativeet11), t(cumulativeet12),
                        t(cumulativeet13), t(cumulativeet14), t(cumulativeet15), t(cumulativeet16),
                        t(cumulativeet17), t(cumulativeet18), t(cumulativeet19), t(cumulativeet20),
                        t(cumulativeet21), t(cumulativeet22), t(cumulativeet23) ))

location <- t(cbind(t(rep(locations[1], length(eventdate1))), t(rep(locations[2], length(eventdate2))),
                    t(rep(locations[3], length(eventdate3))), t(rep(locations[4], length(eventdate4))),
                    t(rep(locations[5], length(eventdate5))), t(rep(locations[6], length(eventdate6))),
                    t(rep(locations[7], length(eventdate7))), t(rep(locations[8], length(eventdate8))),
                    t(rep(locations[9], length(eventdate9))), t(rep(locations[10], length(eventdate10))),
                    t(rep(locations[11], length(eventdate11))), t(rep(locations[12], length(eventdate12))),
                    t(rep(locations[13], length(eventdate13))), t(rep(locations[14], length(eventdate14))),
                    t(rep(locations[15], length(eventdate15))), t(rep(locations[16], length(eventdate16))),
                    t(rep(locations[17], length(eventdate17))), t(rep(locations[18], length(eventdate18))),
                    t(rep(locations[19], length(eventdate19))), t(rep(locations[20], length(eventdate20))),
                    t(rep(locations[21], length(eventdate21))), t(rep(locations[22], length(eventdate22))),
                    t(rep(locations[23], length(eventdate23)))                  ))

location_id <- t(cbind(t(rep(1, length(eventdate1))), t(rep(2, length(eventdate2))), 
                       t(rep(3, length(eventdate3))), t(rep(4, length(eventdate4))), 
                       t(rep(5, length(eventdate5))), t(rep(6, length(eventdate6))), 
                       t(rep(7, length(eventdate7))), t(rep(8, length(eventdate8))), 
                       t(rep(9, length(eventdate9))), t(rep(10, length(eventdate10))), 
                       t(rep(11, length(eventdate11))), t(rep(12, length(eventdate12))), 
                       t(rep(13, length(eventdate13))), t(rep(14, length(eventdate14))), 
                       t(rep(15, length(eventdate15))), t(rep(16, length(eventdate16))), 
                       t(rep(17, length(eventdate17))), t(rep(18, length(eventdate18))), 
                       t(rep(19, length(eventdate19))), t(rep(20, length(eventdate20))), 
                       t(rep(21, length(eventdate21))), t(rep(22, length(eventdate22))), 
                       t(rep(23, length(eventdate23)))                       ))

event_id <- t(cbind(   t(c(1:length(eventdate1))), t(c(1:length(eventdate2))), 
                       t(c(1:length(eventdate3))), t(c(1:length(eventdate4))), 
                       t(c(1:length(eventdate5))), t(c(1:length(eventdate6))), 
                       t(c(1:length(eventdate7))), t(c(1:length(eventdate8))), 
                       t(c(1:length(eventdate9))), t(c(1:length(eventdate10))), 
                       t(c(1:length(eventdate11))), t(c(1:length(eventdate12))), 
                       t(c(1:length(eventdate13))), t(c(1:length(eventdate14))), 
                       t(c(1:length(eventdate15))), t(c(1:length(eventdate16))), 
                       t(c(1:length(eventdate17))), t(c(1:length(eventdate18))), 
                       t(c(1:length(eventdate19))), t(c(1:length(eventdate20))), 
                       t(c(1:length(eventdate21))), t(c(1:length(eventdate22))), 
                       t(c(1:length(eventdate23)))                       ))


newdata <- data.frame(location=location, eventdate=eventdate, eventtime=eventtime, 
                      cumulativeet=cumulativeet, location_id=location_id, event_id=event_id)

newdata$location_id <- as.factor(newdata$location_id)
newdata$cumulative_month <- ceiling(newdata$cumulativeet/30)
newdata$cumulative_week <- ceiling(newdata$cumulativeet / 7)
str(newdata)


# Out put the data into a xlsx form (But the eventtime form would be changed)
# In case you need:
# library(xlsx)
# write.xlsx(newdata, "newdata.xlsx") 
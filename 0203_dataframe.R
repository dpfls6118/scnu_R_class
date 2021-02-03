class <-c(1,1,2,2)
class 

d_frame <- data.frame(english, math, class)
d_frame

mean(d_frame$english)

d_frame_02 <- data.frame(english = c(90, 50, 10, 30), math=c(50, 80,40,30), class=c(1,1,2,2))

d_frame_02

library(readxl)
read_data_excel <- read_excel("./teacher/Data/excel_exam.xlsx") #현재폴더에서는 ./ 를 적지 않아도 됨, 경로는 "", 대소문자 구분

View(read_data_excel)

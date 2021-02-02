install.packages("readxl")
library(readxl) #필요할때만 불러오기
test <- read_excel("./teacher/Data/excel_exam.xlsx") #./ 현재 디렉팅을 의미, 프로젝트를 만든 위치, 확장자까지 끝까지 작성
View(test)

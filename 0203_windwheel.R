library(imager)

img_path <- "./teacher/pinwheel.png" #이미지의 위치설정
img <- load.image(img_path) #이미지 불러오기

img <- resize(img, size_x = 400L, size_y=400L) #이미지 이름, x축 크기, y축 크기, 이미지 크기 조정
plot(img, xlim=c(0,400), ylim=c(0,400)) #이미지 표시하기

angle <- 0 #angle 값을 특정 값으로 지정한 뒤에 조건문
while(TRUE){
  angle <- angle + 10
  imrotate(img, angle, cx=200, cy=200) %>% plot(axes=FALSE) # %>% 동시에 적용
  Sys.sleep(0.4) #회전속도
}
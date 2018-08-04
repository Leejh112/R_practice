###데이터 프레임 생성하기

patientID <- c(1,2,3,4)
age <- c(25,34,28,52)
diabetes <- c("Type1","Type2","Type1","Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")

patientdata <- data.frame(patientID, age, diabetes, status)

patientdata[1:2] #앞에서 두 개 열까지
patientdata[,1:2] #같은결과
patientdata[1:2,] #위에서 두 개 행까지

patientdata[-1] # 맨 앞 열 빼고
patientdata[c(1,3)]

table(patientdata$diabetes, patientdata$status) # 교차분석

patientdata <- data.frame(patientID, age, diabetes, status,
                          row.names = patientID) #사례 식별자


### 요인 사용하기
diabetes <- factor(diabetes)
status <- factor(status, order = T)

patientdata <- data.frame(patientID, age, diabetes, status)
str(patientdata)

summary(patientdata)

# 연속변수는 최소, 최대, 평균, 사분위값.
#범주형 변수는 빈도값


###시각화

dose <- c(20,30,40,45,60)
drugA <- c(16,20,27,40,60)
drugB <- c(15,18,25,31,40)

plot(dose, drugA, type = 'b') # type = 'b' 점과 선.


### 그래픽 파라미터
opar <- par(no.readonly = T)
par(lty = 2, pch = 17) #lty=2 선타입:점선, pch = 17 점모양: 삼각형
plot(dose, drugA, type = "b")
par(opar) # 원래 설정 복원

plot(dose, drugA, type="b", lty =2 , pch =17, lwd = 3, cex = 2)

par(ask=F) # hit<Return> 끄는법


### 색팔레트
install.packages("RColorBrewer")
library(RColorBrewer)
n <- 7
mycolors <- brewer.pal(n, "Set1")
barplot(rep(1,n), col=mycolors)

n <- 10
mycolors<- rainbow(n)
pie(rep(1,n), labels = mycolors, col=mycolors)

mygrays <- gray(0:n/n)
pie(rep(1,n), labels =mygrays, col=mygrays)

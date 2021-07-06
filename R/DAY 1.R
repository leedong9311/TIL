# DAY 1
#PACKAGE ? -> 함수(FUNCTION) * EPDLXJTPT(DATASET)
#INSTALL.PACKAGES('해당해키지')
#LIBRARY ('해당패키지')

#디버깅 print() , paste () , sprintf() , cat()
# ?print

?print
?letters

letters
print(letters)
print(LETTERS)
month.abb
month.name

print ('하이')
print ('섭~')

?sprintf
# %d : 인수를 정수로
# %s : 인수를 문자열로
# %f : 인수를 실수로

sprintf("%d" , 123)
sprintf("Number : %s" , "123")
sprintf("Number : %d , String : %s" , 123 , 'hello')

?paste
paste('a','b','c',sep='')
paste('a','b','c',sep='-')
paste('a','b','c')

myfunc <- function () {
   total <- 0
   cat('append ...')
   for(i in 1:10) {
     total <- total + i
     #cat(i, "...")
     print(i)
   }
   cat("end!!" , "\n")
   return (total)
}

myfunc()

#변수 : 데이터를 담을 수 있는 그릇
#변수명 : (알파벳 , 숫자, _) 반드시 첫 글자는 문자 또는 . 시작해야 된다
#단일형 변수 : vector , matrix , array
#복수형 변수 : list , data.frame

# vector (정수형, 실수형, 문자형, 논리형) 
# c()

samplevec <- c(1,2,3,4,"5",TRUE)
samplevec

# sample_vec
# samplevec

x <- c(0,1,4,9,16)
x
avg <- sum(x)/length(x)
avg

mean(x)

x <- 1:10
x
y<- x^2
y
plot(x,y)
#상관계수
cor(x,y)

#변수의 데이터형을 확인하려면 str() , typeof() ,mode()
typeof(x)

#논리형 벡터
ex_vec <- c(TRUE , FALSE , TRUE , FALSE)
typeof(ex_vec)
mode(ex_vec)

str_vec <- c('가나다' , '섭섭해' , '라마바' ,'사아자' ,'차카타')
typeof(str_vec)
mode(str_vec)
str(str_vec)

sample_na_vec <- NA
print(sample_na_vec)
is.na(sample_na_vec)


sample_null_vec <- NULL
print(sample_null_vec)
is.null(sample_null_vec)


over_vec <- c(1,2,3, c(1,2,3))
over_vec
typeof(over_vec)
mode(over_vec)
str(over_vec)
class(over_vec)

# 수치형 벡터 데이터를 만들 때 start:end 형태로 만들 수 있다.

x<- 1:10
x

# 반복된 값의 벡터를 만들려면
?rep
rep(1:5 ,each=5)
rep(1:5 , 5)

?seq
seq(1,10,2)

ex_seq_vec <- seq(1, 100, by=3)
ex_seq_vec

length(ex_seq_vec)

#indexing 할 수 있다.
#indexing은 [] 대괄호 !
# 조건식 and(&) , or(|)
ex_seq_vec[2]
ex_seq_vec[length(ex_seq_vec)-4]
ex_seq_vec[ ex_seq_vec >= 10  & ex_seq_vec <= 30]
ex_seq_vec[ ex_seq_vec >= 10  | ex_seq_vec <= 30]
ex_seq_vec[ ex_seq_vec >= 10  & ex_seq_vec <= 30]

# 문제) ex_esq_vec 홀수번쨰의 값 추출
test_seq <- seq(1,34, by=2)
ex_seq_vec_odd <- ex_seq_vec[test_seq]
ex_seq_vec_odd

str(seq(1, length(ex_seq_vec),2))

# 벡터의 각 셀에 이름을 부여할 수 있다.

x <- c(1,3,5)
col <- c('feature01', 'feature02' ,'feature03')
names(x) <-col
x
x['feature01']
x[ c(1,3)]
x[ c('feature01','feature03')]

names(x)[1]

# 음수 인덱스를 사용해 특정 요소만 제외할 수 있다.
x[-1]
x[ c(-1, -3)]

# 길이 length() , nrow() , NROW()
length(x)
nrow(x)
NROW(x)

# 벡터의 연상 %in% - 어떤 값이 벡터에 포함되어있는지를 알려주는 연산자

a_vec <-'A' %in% c('a', 'b', 'c')
a_vec

#setdiff() 차집합 , union () , intersect() 교 , setequal()
setdiff( c("a", "b" , "c") , c ('a','b'))
union( c("a", "b" , "c") , c ('a','b'))
intersect( c("a", "b" , "c") , c ('a','b'))

setequal( c("a", "b" , "c") , c ('a','b','c'))
setequal( c("a", "b" , "c") , c ('a','b','d'))

#100에서 200으로 구성된 벡터 samplevec를 생성한 다음
#각 문제를 수행하는 코드를 작성하세요 ~

samplevec <- c(100:200)
samplevec
#문제 01] 인덱스가 10번째인 값을 출력하세요
samplevec[10]

#문제 02] 끝에서 10개의 값을 잘라내어 출력하세요
tail(samplevec ,10)

#문제 03] 홀수만 출력하세요
samplevec[samplevec %% 2==1]

#문제 04] 3의 배수만 출력하세요 ( %% 나머지 연산자)
samplevec[ samplevec%% 3== 0]

#문제 05] 앞에서 20개의 값을 잘라내어 변수 d.20 에 저장하고 d.20 값을 출력
d.20 <- head(samplevec ,20)
d.20

#문제 06] d.20의 5번재 값을 제외한 나머지 값들을 출력
d.20[-5]

#문제 07] d.20의 5,7,9번째 값을 제외한 나머지 값들을 출력
d.20[c(-5 ,-7,-9)]

?month.name
absent <- c(10 , 8, 14, 15, 9, 10, 15 ,12, 9 ,7 ,8, 7)
names(absent) <- month.name
absent


# 5월(MAY)의 결석생 수를 출력하시오.
absent['May']
# 7월(JUL), 9월(SEP)의 결석생 수를 출력하시오.
absent[c('July','September')]
# 상반기(1~6월)의 결석생 수의 합계를 출력하시오.
sum(absent[1:6])
# 하반기(7~12월)의 결석생 수의 평균을 출력하시오.
mean(absent[c(7:12)])

#논리형 벡터 (T , F)
# & , | , !(not)

c (T,F,T , TRUE , FALSE)
!c (T,F,T , TRUE , FALSE)

c (T,F,T) & c(TRUE ,TRUE ,TRUE )

xor (c (T,F,F) , c(TRUE ,TRUE ,TRUE ))

?runif

x <- runif(3)

x
any(x > 0.58)
all(x > 0.58)

# 문자형 벡터
c('a' ,"b" , "c" , 'd' , "e")
strvec <- c("h", "s", "t", "n", "o")
strvec
strvec[3] > strvec[5]

?paste
paste("May I" , "help y?")

month.abb
paste(month.abb , 1:12)
paste(month.abb , 1:12 ,c("st" , "nd" , rep("th",9)))

paste("/user" , "local" , "bin" , sep="/")
paste("/user" , "local" , "bin" , sep="")


# [정규표현식(regular expression)]

# *  0 or more.
# +  1 or more.
# ?  0 or 1.
# .  무엇이든 한 글자를 의미
# ^  시작 문자 지정 
# ex) ^[abc] abc중 한 단어 포함한 것으로 시작
# [^] 해당 문자를 제외한 모든 것 ex) [^abc] a,b,c 는 빼고
# $  끝 문자 지정
# [a-z] 알파벳 소문자 중 1개
# [A-Z] 알파벳 대문자 중 1개
# [0-9] 모든 숫자 중 1개
# [a-zA-Z] 모든 알파벳 중 1개
# [가-힣] 모든 한글 중 1개
# [^가-힣] 모든 한글을 제외한 모든 것
# [:punct:] 구두점 문자, ! " # $ % & ’ ( ) * + , - . / : ; < = > ? @ [ ] ^ _ ` { | } ~.
# [:alpha:] 알파벳 대소문자, 동등한 표현 [A-z]
# [:lower:] 영문 소문자, 동등한 표현 [a-z]
# [:upper:] 영문 대문자, 동등한 표현 [A-Z].
# [:digit:] 숫자, 0,1,2,3,4,5,6,7,8,9,
# [:xdigit:] 16진수  [0-9A-Fa-f]
# [:alnum:] 알파벳 숫자 문자, 동등한 표현[A-z0-9].
# [:cntrl:] \n, \r 같은 제어문자, 동등한 표현[\x00-\x1F\x7F].
# [:graph:] 그래픽 (사람이 읽을 수 있는) 문자, 동등한 표현
# [:print:] 출력가능한 문자, 동등한 표현
# [:space:] 공백 문자: 탭, 개행문자, 수직탭, 공백, 복귀문자, 서식이송
# [:blank:] 간격 문자, 즉 스페이스와 탭.

# grep
?grep

strvec <-c ("gender" , "height" , "age" , "weight" , "eight")

#ei로 시작하는 값을 추출한다면
grep("^ei" , strvec , value = T)

grep("^Ei" , strvec , value = T)

grep("^Ei" , strvec , ignore.case = T ,value = T)

#ei이라는 문자열이 있는 요소를 추출한다면
grep("^ei" , strvec , value = T)
grep( '+ei+' , strvec , value = T)

strvec[grep('ei' , strvec)]

txtvec <- c("BigData" , "Bigdata" , "bigdata" , "Data" , "datamining" , "class1" , "class2")
txtvec

#시작문자를 지정 ^
# +1 or more
# 소문자 b로 시작하는 데이터를 추출한다면?

grep('^b+' , txtvec , value =T)
grep('^b+' , txtvec , value =T , ignore.case = T)


#gsub()
#big 문자열이 있는 요소를 찾아 해당 문자열을 bigger라는 단어로  봐꾼다면?

gsub("big" , "bigger" ,  txtvec )
gsub("big" , "bigger" ,  txtvec ,ignore.case =T )

# 숫자를 제거하고 싶다면
gsub("[0-9]" , "" , txtvec)
gusb("[[:digit:]]","",txtvec)


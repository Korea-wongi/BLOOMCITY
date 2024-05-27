<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">

<div align="center">
  <h1>여행사 </h1>
</div>


#### 코로나 이후 많아진 여행 수요에 맞게 패키지를 구성해 여행을 할 수 있도록 여행사 웹 개설

## 참고 사이트
![하나투어]((https://enjoy.hanatour.com/?gad_source=1))
![노랑풍선]((https://pkg.ybtour.co.kr/index.yb))


## :mortar_board: 목차
[1. 개요](#1-개요)

[2. ERD](#2-erd)

[3. 주요 기능](#3-주요기능)


## 1. 개요
### :computer: 기술 스택
#### Platform
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![Eclipse](https://img.shields.io/badge/EclipseSTS-0078D6.svg?style=for-the-badge&logo=Eclipse&logoColor=purple)
![IntelliJ](https://img.shields.io/badge/IntelliJ-0078D6.svg?style=for-the-badge&logo=intellijidea&logoColor=#000000)

![apachetomcat](https://img.shields.io/badge/tomcat-0078D6.svg?style=for-the-badge&logo=apachetomcat&logoColor=yellow)
#### RDBMS
![MySQL](https://img.shields.io/badge/MySQL-0078D6?style=for-the-badge&logo=mysql&logoColor=white)

<img src="https://img.shields.io/badge/MyBatis-0078D6?style=for-the-badge&logo=MyBatis&logoColor=white">

#### Templates
![JSP](https://img.shields.io/badge/JSP-0078D6.svg?style=for-the-badge&logo=Laravel&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-0078D6.svg?style=for-the-badge&logo=css3&logoColor=white)
 ![BOOTSTRAP](https://img.shields.io/badge/Bootstrap-0078D6?style=for-the-badge&logo=bootstrap&logoColor=#7952B3)
#### Application Development / Skills
![Java](https://img.shields.io/badge/Java-0078D6?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring](https://img.shields.io/badge/Spring-0078D6?style=for-the-badge&logo=spring&logoColor=#6DB33F)
![Java](https://img.shields.io/badge/springboot-0078D6?style=for-the-badge&logo=springboot&logoColor=#)


![JavaScript](https://img.shields.io/badge/javascript-0078D6.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
 ![Jquery](https://img.shields.io/badge/jQuery-0078D6?style=for-the-badge&logo=jquery&logoColor=white)
 ![Logback](https://img.shields.io/badge/Logback-0078D6?style=for-the-badge&logo=loopback&logoColor=white)


 
<hr>

 ### :watch: 프로젝트 기간
 2024-05-01 ~ 2024-05-20
 ![프로젝트 스케쥴](https://github.com/gidopa/SpringTeamProject/assets/120196095/2a23aded-c8c4-45f8-a966-36f4cd968734)
 
 
<hr>

### :busts_in_silhouette: 팀원 소개
- 팀장 - 장원보 :walking:  [Github](https://github.com/Onestepp1)     
- 팀원 - 박기도 :full_moon:
- 팀원 - 김원기 [Github](https://github.com/TrendFollow)
- 팀원 - 장영훈 [Github](https://github.com/jangyoung-hoon)
<hr>

### :flags: 기본 규칙
- Naming Convention
  - JAVA : Camel Case
  - DB, JS : snake_case
  - 최대한 변수의 의미에 중점을 둔 네이밍
    
- Comment
  - 클래스와 메소드가 어떤 역할을 하는지
  - 다중 if/for 등 로직이 복잡한 경우 / 특별한 제약이 필요한 경우
  - 변수의 이름만으로 설명이 부족한 경우
 
- Debug용 콘솔 출력
  - System.out.println 보다는 Logback 적극 활용

- RESTful
  - REST API를 구현 하진 않았지만 이후 REST API 설계를 위해 최대한 RESTful 하도록 uri 구성
 
- 기타
  - Spring MVC
  - Spring Boot
  - SRP(단일 책임 원칙)을 준수하여 함수와 클래스가 하나의 책임만을 갖도록 설계
  - 함수나 클래스는 작고 명확하게 유지하면서 코드의 중복을 줄여 유지보수를 용이하도록 설계
  - 진행 상태확인 및 대략적인 소모차트 예상 , 간단한 스크럼 회의 이후 스프린트 진행, 스프린트 리뷰 등의 방법으로 지속적인 커뮤니케이션 유지
  - 혼자 해결하기 어려운 부분들은 팀원들과 소통을 통해 다각적인 해결 시도
 
<hr>
    
## 2. Erd
![팀플 ERD](https://github.com/gidopa/SpringTeamProject/assets/120196095/0c76729a-c127-4a71-b892-7467a15de997)

## 3. 주요기능
:arrow_right: 로그인 
일반적인 로그인 및 카카오 로그인 API, 네이버 로그인 API 활용

:arrow_right: 패키지 관련 CRUD
패키지 하위의 호텔, 관광지, 패키지 일정, 식당 CRUD

:arrow_right: 패키지 조회 / 예약
생성된 패키지 조회 및 결제 후 예약

:arrow_right: 이메일
SMTP 프로토콜을 이용한 회원 메일 서비스

:arrow_right: 결제
포트원의 KG 이니시스 V1 모듈을 이용한 결제 시스템 구현











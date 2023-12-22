csv파일로 다운로드 받기위한 링크생성:

![image](https://github.com/twingay96/CSV_project/assets/64403357/ef838a04-e5d5-4bf1-b21f-5b88f8121040)
![image](https://github.com/twingay96/CSV_project/assets/64403357/4bdaa329-f74e-40d6-a6e1-f64633b8aa69)

format: :csv 파라미터로 인해, 컨트롤러는 요청을 CSV형식으로 응답해야함을 인식하게됨
이에대해 응답하는 방법으로는 총 3개가지가 있음.

1. ".csv.erb"형식의 템플릿사용:

![image](https://github.com/twingay96/CSV_project/assets/64403357/c0e7a0e8-7f5d-4804-9d99-9a8bacce584c)

이상태에서 "CSV 파일로 다운로드받기" 링크 클릭시 다음과같은 파일이 다운로드됨 :

![image](https://github.com/twingay96/CSV_project/assets/64403357/6fe3d2a0-1c78-434a-904f-0887aca211bf)

실제 원본 csv 파일처럼 행구조로 표현하기 위해서 배열을 사용:
![image](https://github.com/twingay96/CSV_project/assets/64403357/6cd4f56e-0cba-4a54-ad83-0aa6448dbbc0)

<img width="253" alt="image" src="https://github.com/twingay96/CSV_project/assets/64403357/41b05745-e571-45ab-a833-c5437d86b634">


이때 붉은밑줄로 표시한 부분은 큰따옴표(")를 HTML에서 안전하게 표현하기 위한 문자 엔티티 코드, CSV 파일을 생성할 때, 
데이터 값에 큰따옴표가 문자열로 포함되어 있으면, 이를 HTML 엔티티 코드로 변환해서 보여주는 경우가 있기때문에 

to_s 메서드를 사용한 후에 join(",")를 사용하여 배열의 각 원소를 문자열로 변환한 뒤, 이들을 콤마(,)로 구분하여 하나의 문자열로 합쳐줘야함. 
이방법은 CSV 데이터를 생성할 때 각 행의 값을 특정 구분자로 연결할 필요가 있을 때 유용합니다.
따라서 코드를 다음과 같이 수정:

![image](https://github.com/twingay96/CSV_project/assets/64403357/fba26420-0c5f-4d64-91f0-fec35e7b1cd4)

이때 join(",")을 사용하는 이유는 CSV파일에서 각 데이터 값을 콤마(,)로 구분하기 위함임.

![image](https://github.com/twingay96/CSV_project/assets/64403357/efa5bc33-6de9-419d-8428-93ef1e533b67)

이제 이상태에서 CSV파일의 맨 위에 

![image](https://github.com/twingay96/CSV_project/assets/64403357/4a8af62a-40d1-42e9-a118-5a63e6568bd6)

와 같이 CSV파일에서 각 컬럼을 설명하기위해 
First Name ,Last Name ,Email Address, Favorite Food 와 같은 헤더 행을 추가해야함.
CSV파일의 첫 번째 행은 일반적으로 컬럼 이름을 포함하는 헤더 행으로 사용됨.

![image](https://github.com/twingay96/CSV_project/assets/64403357/94f7b92a-cc74-46eb-9b62-c47862443e7c)

![image](https://github.com/twingay96/CSV_project/assets/64403357/8f64eb22-126c-4784-b688-c6256a1c4782)

csv파일 다운로드시 파일명을 변경하기 위해 다음과 같이 "CSV 파일로 다운로드받기" 링크 수정:

![image](https://github.com/twingay96/CSV_project/assets/64403357/208e9e70-21ed-43e3-8eb9-60d6618b5d86)

이때 "download"옵션은 브라우저에 파일을 다운로드할 때 사용할 기본 파일 이름을 지정하는 용도.
'download: ["Users", Date.today].join(",")'는 "Users"문자열과 현재 날짜를 가져와서 ("_")로 연결해서 파일이름을 생성함
![image](https://github.com/twingay96/CSV_project/assets/64403357/a49e087f-88f6-452d-8c68-55c95db6934a)

2. 루비 CSV를 사용한 방법:
























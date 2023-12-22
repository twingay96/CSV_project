![image](https://github.com/twingay96/CSV_project/assets/64403357/12ad9a4a-6dcb-434d-8760-ab626ed2426a)![image](https://github.com/twingay96/CSV_project/assets/64403357/01ad7d06-cfba-47c5-9446-1b127d5e066f)![image](https://github.com/twingay96/CSV_project/assets/64403357/b84e00bd-8fd8-4b89-ad87-0fe6d70dea15)![image](https://github.com/twingay96/CSV_project/assets/64403357/d491e29c-b090-4433-b654-15cf71d1b56e)![image](https://github.com/twingay96/CSV_project/assets/64403357/6d505cee-0b32-436a-84b8-06862229dc1f)![image](https://github.com/twingay96/CSV_project/assets/64403357/2b0904e5-13ad-4808-a2b8-15d304b6dd3a)![image](https://github.com/twingay96/CSV_project/assets/64403357/8c937898-235b-4a5b-b9a0-a360893910b0)![image](https://github.com/twingay96/CSV_project/assets/64403357/90ce84d7-407a-4617-ad61-0e4ce1fdd4c2)csv파일로 다운로드 받기위한 링크생성:

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

![image](https://github.com/twingay96/CSV_project/assets/64403357/f7f11251-ec0e-4527-bea1-1683910ca937)



respond_to 블록을 사용하여 요청에 따라 다른 포맷의 응답을 반환할 수 있습니다. 
컨트롤러의 index 액션에서 format.csv가 정의되어 있기 때문에, .csv 요청이 들어오면 CsvImportUsersService를 통해 CSV 데이터를 처리하여 반환합니다

이 경우엔 index.csv.erb 템플릿을 사용하지 않고, ruby의 내장 csv라이브러리를 사용하여 데이터를 
csv문자열로 변환하고 send_data메서드를 통해 이를 클라이언트측에 전송하는 방식

또는 format.csv에대한 csv파일을 생성하는 코드를 직접 정의하는 방식이 있음:



CSV.generate_line(["id", "email"]) 코드는 
CSV 파일의 첫 번째 줄로 컬럼 이름을 포함하는 헤더 행을 생성합니다. 
이 헤더 행은 데이터의 각 컬럼이 무엇을 나타내는지 정의하는 역할을 함

CSV 파일은 텍스트 기반의 파일 형식으로, 각각의 컬럼은 일반적으로 쉼표나 다른 특정 문자로 구분됩니다. 

들여쓰기는 CSV의 데이터 필드에 영향을 주지 않으며, 데이터의 구조나 정렬 상태에 영향을 미치지 않습니다. 그러나, 코드의 가독성과 유지 관리를 위해서는 들여쓰기를 적절하게 하는 것이 좋습니다.


![image](https://github.com/twingay96/CSV_project/assets/64403357/c05f24e7-d7b6-4b79-9e99-f404a30247e2)


User 모델의 self.to_csv 메소드 내에서 attributes 메소드가 사용, 
attributes 메소드는 해당 객체의 모든 속성(어트리뷰트)과 그 값을 해시 형태로 반환합니다.

![image](https://github.com/twingay96/CSV_project/assets/64403357/66d845d2-0f0b-4576-883a-ced0579877c6)

이 코드에서 record.attributes.values는 특정 사용자 레코드의 모든 속성 값을 배열로 가져옵니다. 

![image](https://github.com/twingay96/CSV_project/assets/64403357/08dc4e8d-02b4-4c2b-9278-4aa6633599dd)

이 배열은 CSV.generate 블록 내의 csv << 라인에 의해 CSV 파일의 한 행으로 추가되는데, 
이렇게 하여 각 사용자의 모든 속성 값이 CSV 파일에 순서대로 기록됩니다.

attribute_names는 Rails의 ActiveRecord 모델에 정의되어 있으며, 해당 모델의 모든 속성(컬럼) 이름을 문자열의 배열로 반환합니다.
User 모델의 모든 속성 이름을 가져오고, csv << attribute_names는 CSV 파일의 첫 번째 행으로 이 속성 이름들을 삽입하여 헤더로 사용합니다

즉, attribute_names는 모델의 모든 속성(헤더) 이름을 배열로 반환, 이는 CSV 파일의 첫 번째 행에 컬럼 헤더로 사용됩니다.
attributes 메소드는 특정 레코드의 속성 이름과 그에 해당하는 값을 해시로 반환합니다. 
attributes.values를 호출하면 이 해시에서 모든 값들을 배열로 추출합니다. 이 값들은 CSV 파일의 데이터 행에 해당하며, 각 헤더(속성 이름) 아래에 위치하게 됩니다.

![image](https://github.com/twingay96/CSV_project/assets/64403357/26e72f8b-b615-4cde-a82e-1a2e23e9fba7)

![image](https://github.com/twingay96/CSV_project/assets/64403357/117f251b-a51a-49ef-aa14-24befee478c3)

send_data 메소드는 클라이언트에 데이터를 보낼 때 사용되며, 주로 파일을 다운로드할 때 사용됩니다.
예를 들어, CSV 데이터를 생성하여 사용자가 그 데이터를 CSV 파일로 다운로드할 수 있도록 하고 싶을 때 send_data 메소드를 사용합니다.

3. users모델 말고 다른 모델에 대해서 csv파일 조작하기:

![image](https://github.com/twingay96/CSV_project/assets/64403357/3e32d4bb-a6e3-4619-b4ce-e9a0a40c14d4)

![image](https://github.com/twingay96/CSV_project/assets/64403357/c5e5a73e-8484-4f93-b409-1e19f03e33ae)

여기서 to.csv(collection)메소드는 user모델에 정의되어 있기때문에 model/concerns에 메소드를 정의해서 모듈로사용해야함 

models/concerns는 모델 계층에서 사용할 공통 기능을 모듈로 정의하여 각 모델 클래스에 포함시킬 수 있는 공간, 

모듈은 ActiveSupport::Concern을 사용하여 구현되며, 이를 통해 모델의 코드를 DRY(Don’t Repeat Yourself) 원칙에 따라 재사용가능

![image](https://github.com/twingay96/CSV_project/assets/64403357/54a39aef-0b76-40fa-a731-0cb3bd626a04)

예를 들어, CSV 파일로 데이터를 내보내는 기능을 여러 모델에서 사용해야 한다면, 
이 기능을 to_csv 메소드를 포함하는 모듈로 정의하고 models/concerns에 저장할 수 있습니다. 
그런 다음 해당 모듈을 필요한 모델 클래스에 포함(mixin)시켜 코드 중복을 방지하고, 관리를 용이하게 할 수 있습니다.

![image](https://github.com/twingay96/CSV_project/assets/64403357/20c58dc0-5de5-4f42-86b0-4265fcf495f7)



































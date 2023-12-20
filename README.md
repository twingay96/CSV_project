  참조1: https://www.youtube.com/watch?v=EJ8FZMLsVVQ (~14:31)

  참조2: https://blog.corsego.com/import-csv-to-rails-database

  참조3: https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV.html 
  
  

Ruby on Rails에는 CSV 파일을 읽고 쓸 수 있는 기능을 제공하는 Ruby의 표준 라이브러리인 CSV가 포함되어 있습니다. 
이 라이브러리는 Ruby의 표준 라이브러리이므로 별도의 gem을 추가하지 않고도 사용할 수 있습니다.

    rake db:create
  
    rails g scaffold users email:text

명령어를 실행해서 비어있는 데이터베이스를 생성하고  email이라는 컬럼을 가지는 users테이블을 생성후
  
root라우트를 설정후 rails s:
  
![image](https://github.com/twingay96/CSV_project/assets/64403357/c6090c94-9adb-496a-a840-7197914d0021)
  
![image](https://github.com/twingay96/CSV_project/assets/64403357/a08b3b02-efd4-43ef-9e13-3f5b76f01efb)

이번 프로젝트에서는 create액션은 사용 안하고, csv파일 업로드를 통한 users 테이블의 변화를 관찰 할 것이기 때문에 index.html.erb를 다음과 같이 수정:
  
![image](https://github.com/twingay96/CSV_project/assets/64403357/95b5cc67-f0cf-407a-8557-193c1505f4b1)
![image](https://github.com/twingay96/CSV_project/assets/64403357/15089c74-8b42-4b6e-be16-8396cbfdba49)

그 후에 csv파일을 업로드할 버튼 및 라우트를 생성:

![image](https://github.com/twingay96/CSV_project/assets/64403357/70215f98-6598-4c30-bff2-4c1ca08ebb45)
![image](https://github.com/twingay96/CSV_project/assets/64403357/5c08f91e-a02a-47e8-9296-da863ffb1ab8)
![image](https://github.com/twingay96/CSV_project/assets/64403357/f7a1d8bd-1be0-47bf-bc2a-37309a1abf4f)
![image](https://github.com/twingay96/CSV_project/assets/64403357/b859bd37-4d96-4fd8-b3f7-ee1b61cd95df)

사용할 csv 파일을 엑셀에서 생성후 다른이름저장: 

![image](https://github.com/twingay96/CSV_project/assets/64403357/06f41c77-45ec-4021-9986-6354d066786e)
![image](https://github.com/twingay96/CSV_project/assets/64403357/7a6dccf1-1ee2-41c7-868f-34dfcbd27fcc)

후에 import라우트에 대응하는 import 액션을 정의, 이때 import 액션에서 debug gem을 사용:
![image](https://github.com/twingay96/CSV_project/assets/64403357/89a0dc4e-0103-47f7-9981-091d3ec885a7)
![image](https://github.com/twingay96/CSV_project/assets/64403357/534cd97b-34fc-4ac6-bdd9-21296d1135ef)

이렇게 코드를 작성한 상태에서 특정파일을 업로드한 후에 import 버튼을 클릭하면: 
![image](https://github.com/twingay96/CSV_project/assets/64403357/b7a2a329-185f-4c35-a355-5f9df13e55b1)
![image](https://github.com/twingay96/CSV_project/assets/64403357/316e55d4-7ccf-44b2-98aa-0d31652ffbb3)

binding.irb를 호출하면 Ruby 코드의 해당 지점에서 IRB 세션을 시작하게 되어 코드를 단계별로 실행하고, 변수 값을 검사하고, 코드를 실험할 수 있게 됩니다. 
간단히 말해서, binding.b는 코드의 실행을 일시 중지하고 디버깅 세션을 시작하는 데 사용됩니다. 
이를 통해 개발자는 애플리케이션의 상태를 더 잘 이해하고, 버그를 발견하며, 코드의 흐름을 추적할 수 있습니다.

params[:file]을 통해서 파라미터확인:
![image](https://github.com/twingay96/CSV_project/assets/64403357/f5bdd52a-2206-4666-a6d1-a4a62ec5e3f4)
![image](https://github.com/twingay96/CSV_project/assets/64403357/9ba4c9a8-a2a6-4bd8-a5fd-f37b1634fe66)

그리고 업로드한 파일의 형식이 csv인지 확인하고 아니면 리다이렉트되는 로직을 import 액션에 추가:
![image](https://github.com/twingay96/CSV_project/assets/64403357/6b8b26c0-e480-4876-84e2-bb03289c5f48)

그리고나서 서버측(백엔드측)에 csv파일형식이 아닌 임의의파일을 업로드하고 import할 경우 redirect되는 로직을 추가:
![image](https://github.com/twingay96/CSV_project/assets/64403357/4b106dea-7ac9-4001-a39c-918d74bf25b5)
![image](https://github.com/twingay96/CSV_project/assets/64403357/802bf398-ed57-4738-bcfd-33388d6a6993)

만약 csv파일형식을 import할 경우의 로직을 추가:
![image](https://github.com/twingay96/CSV_project/assets/64403357/88703536-29b8-4250-b5fa-616dec607319)

csv파일을 import하면 : 
![image](https://github.com/twingay96/CSV_project/assets/64403357/2da1d171-b6e6-4a5b-bb48-bc6bf1435c42)

여기에 클라이언트측(프론트엔드측)에서 csv파일형식 이외에는 업로드 할 수 없도록 제약을 추가:
![image](https://github.com/twingay96/CSV_project/assets/64403357/1f73fcb1-7d6e-41ae-a4a9-7c86929d6377)

accept: ".csv"을 하게되면 csv파일이외에는 조회가 안됨:
![image](https://github.com/twingay96/CSV_project/assets/64403357/7ad3c0c9-36a1-44a3-9f18-0d635a2a8990)
![image](https://github.com/twingay96/CSV_project/assets/64403357/8daca474-5763-45af-89b2-798b3e70e81f)

그리고나서 첨부한 csv파일을 다루는방법을 찾기위해 binding.b으로 디버깅 실행:
![image](https://github.com/twingay96/CSV_project/assets/64403357/74324a06-0db0-445d-a9a9-b3f42c0bb7fa)
![image](https://github.com/twingay96/CSV_project/assets/64403357/a76c1fa8-f9b3-4a10-84c0-3ca4e67032e8)

여기서 빨간색으로 밑줄 친 부분은 임시 파일의 경로와 이름입니다. 이 파일은 Ruby on Rails 애플리케이션에서 업로드된 파일을 처리할 때 생성됨
Rack::Multipart는 HTTP 요청으로부터 멀티파트 폼 데이터를 파싱하는 Rack의 컴포넌트입니다. 
파일 업로드 시, 업로드된 파일은 일반적으로 서버의 임시 디렉토리에 저장되고, 이는 후속 처리를 위해 애플리케이션에서 참조함
이 파일은 후속 처리(예: 데이터베이스로의 데이터 가져오기)를 위해 열리거나 읽힐 수 있습니다.

저 파일을 다루기위해서는 require CSV를 추가해야함:
![image](https://github.com/twingay96/CSV_project/assets/64403357/243494b5-1ccd-4312-83e8-953ecab218ae)
![image](https://github.com/twingay96/CSV_project/assets/64403357/50b11169-665f-458b-97ca-eca5430e3067)

이제 CSV를 통해서 저파일을 파싱할 수 있게됨:
![image](https://github.com/twingay96/CSV_project/assets/64403357/bca0aec2-49b1-4dec-a49c-d08b82836408)
![image](https://github.com/twingay96/CSV_project/assets/64403357/d754f5d8-5a14-4552-b0d0-4122d1f5ea6b)
![image](https://github.com/twingay96/CSV_project/assets/64403357/e53b5d30-4239-46a0-9436-9602dccf238e)
여기서 구분자는 ',' 쉼표임을 확인

이제 파싱되는 데이터들을 코드로 다뤄주기 위해서 import 액션수정 후 다시 import하면:
![image](https://github.com/twingay96/CSV_project/assets/64403357/4de15398-22ad-479a-8571-e4f709b265f5)
![image](https://github.com/twingay96/CSV_project/assets/64403357/c3fab18b-1612-4163-8fc3-7cc0244974ba)

이 에러를 수정하려면, 업로드된 파일의 내용을 문자열로 읽어들인 후에 CSV로 파싱해야 합니다.
현재 import액션은 params[:file]에서 직접 파일을 파싱하려고 하고 있는데, params[:file]은 ActionDispatch::Http::UploadedFile의 인스턴스입니다. 
CSV.parse 메서드는 CSV 데이터가 담긴 문자열이나 read 메서드에 응답하는 객체(예: IO 객체)를 기대합니다.
단순히 말하면 , uploaded_file.read 메서드를 호출하면 ActionDispatch::Http::UploadedFile 객체의 내용이 전체 문자열로 읽혀집니다.
따라서 import 액션을 다음과 같이 수정:

![image](https://github.com/twingay96/CSV_project/assets/64403357/c1baa42e-988e-4a4b-8079-4e1b57f0f47f)

CSV.parse(file_contents, headers: true) 코드에서 headers: true 부분은 CSV.parse 메서드에게 제공되는 
CSV 데이터의 첫 번째 행을 헤더로 취급하라고 지시합니다. 
이 헤더 행은 각 열의 이름을 나타냅니다.

콘솔에서 csv데이터 확인하여 headers와 구분자가 잘 적용되었는지확인:

![image](https://github.com/twingay96/CSV_project/assets/64403357/33a3ad76-5ddf-4473-809c-53bc0e827e02)
![image](https://github.com/twingay96/CSV_project/assets/64403357/242854ac-9e65-4789-9999-7a831d5db3d4)

만약 구분자가 제대로 적용되어있지 않을경우 수정 : 
![image](https://github.com/twingay96/CSV_project/assets/64403357/04e2af79-c295-4bf1-992b-4d8cd68dce3c)

헤더를 제외한 나머지 데이터확인:
![image](https://github.com/twingay96/CSV_project/assets/64403357/363b2e69-e7d2-4499-8fd2-f1e71e8cb57e)

그리고 csv.each {|row| p row.to_hash}를 실행하면:
![image](https://github.com/twingay96/CSV_project/assets/64403357/36c6b653-22fe-4ffc-8eeb-5868cf4658e2)

"{헤더 => 해당헤더의값1,헤더 => 해당헤더의값2 }"형태의 hash를 반환함( python에서의 디렉토리처럼 {key1:value1, key2:value2... }형태의 데이터타입 )

해당 코드들을 import 액션에 추가:
![image](https://github.com/twingay96/CSV_project/assets/64403357/ad577669-0db1-40d9-ac1d-29c8f5093c52)

row가 어떤 데이터를 가지는지 확인해보기:
![image](https://github.com/twingay96/CSV_project/assets/64403357/14a6ebd6-c26f-4ead-a13e-865e22a70ce5)

users 테이블을 채울 데이터가 올바르게 존재하는 것을 확인후, 현재 나의 데이터베이스 컬럼과 csv파일을 매칭시켜야함:
![image](https://github.com/twingay96/CSV_project/assets/64403357/e6f27db0-7656-455b-8e8e-dadd750170f4)
![image](https://github.com/twingay96/CSV_project/assets/64403357/a18aefca-c0dc-46f7-86e2-9dda2e426e89)
![image](https://github.com/twingay96/CSV_project/assets/64403357/88093aad-716a-446e-9c5d-cce7f656934a)

이 해시를 통해서 데이터베이스의 테이블에 데이터를 생성할 수 있음:
![image](https://github.com/twingay96/CSV_project/assets/64403357/1b6ca9ea-dd8e-459e-b486-e765d857c7ea)
![image](https://github.com/twingay96/CSV_project/assets/64403357/a862a70b-200a-4695-8a67-118f0e797775)








































































  

  



 

네이버 영화 정보 수집
==========

* Mac os x 상에서 Cookie 정보를 추출 하기 위해선, 별도의 작업이 필요하다.
- Safari 5.x 이상 부터는 cookies.txt 혹은 cookie.plist 의 형태가 아닌 Cookies.binarycookies 를 사용한다.
- wget 에서 loading 할 cookies.txt 를 생성하기 위해선 naver cookie 정보를 따로 추출하여 text 형태로 저장할 필요가 있다.
- ${CRAWLER_HOME}/libs/dumpsafaricookies.py script 를 사용해서 naver site의 cookie 정보를 추출할 수 있다.
- 추출 된 cookie를 loading 하여 수집을 진행 하면된다.	

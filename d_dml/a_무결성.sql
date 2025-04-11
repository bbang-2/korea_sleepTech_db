### 무결성 (Integrity) ###
# : 데이터에 결함이 없음
# : 정확성, 일관성, 신뢰성을 보장하는 개념

### 제약 조건 (Constraints) ###
# : 데이터의 '무결성'을 지키기 위해 제한하는 조건
# - 데이터가 유효하고 신뢰할 수 있도록 필수 조건을 부여

# 무결성의 종류 #
# : 개체, 참조, 도메인, 사용자 정의 무결성

# 1. 개체 무결성
# : 모든 테이블이 고유한 행을 가짐
# - 기본 키(Primary Key)를 통해 구현: Null 불가, 고유성(중복 불가)
# ex) 학번, 아이디, 주민등록번호, 제품코드, 주문 번호 등

# 2. 참조 무결성
# : 데이터 간의 관계를 정의 할 때
# : , 한 테이블이 다른 테이블의 값을 '참조'하는 경우
# : , 참조값이 반드시! 존재해야 함을 뜻함.
# - 외래 키(Foreign Key)를 통해 구현
# ex) 학생 - 수강, 고객 - 주문, 게시글 - 댓글 ('해당 데이터에서' - '값을 참조')

# 3. 도메인 무결성
# : 테이블의 각 필드(열, 컬럼)가 정의된 도메인에 맞는 값을 가져야 함을 뜻함
# : 데이터 타입, 포맷, 범위 등이 적절하게 유지
# : 도메인은 '데이터 타입, 길이, 가능한 값의 범위'로 구성
# - 데이터 타입 지정, unsigned, 제한 조건(check) 등을 통해 구현
# ex) 은행 계좌에 입금되는 금액 - 양의 정수만 허용 (unsigned)
#		이메일 데이터 - 문자열 + 형식 체크 (6~8자리 이내 문자열)

# 4. 사용자 정의 무결성
# : 특정 애플리케이션의 규칙에 따라 정의
# : 구현하고자 하는 비즈니스 규칙에 따라 애플리케이션의 특정 요구사항을 반영
# ex) 회원가입 시 비밀번호 설정을 6 ~ 10자 이내, 영문자-숫자-특수기호를 반드시 포함
#		연령 제한 - 성인만 가입 가능 ,학생만 가입 가능
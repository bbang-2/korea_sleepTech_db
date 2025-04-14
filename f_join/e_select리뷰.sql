# korea_db 스키마를 기반으로
# select ~ from ~ where ~ group by ~ having ~ order by ~ limit 구문의 전체 흐름과 처리 순서
# +) join

use `korea_db`;

/*
	지역 (area_code)별로 -- group by
    여성 회원들의 -- where
    총 구매 금액(purchases.amount 합계)을 구하되, -- sum() 집계 함수
    총액이 30,000원 이상인 지역만 추출하고, -- having(+ join을 사용한 purchases 테이블 접근)
    총액 기주능로 내림차순 정렬해서 상위 3개 지역 조회 -- order by
*/

select M.area_code "지역", sum(P.amount) "총 구매 금액", count(distinct M.member_id) "회원 수"
from `members` M
	join `purchases` P
    on M.member_id = P.member_id
where gender = 'Female'
group by M.area_code
having sum(P.amount) >= 30000
order by "총 구매 금액" desc
limit 3;


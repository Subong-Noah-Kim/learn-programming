/*
  ## 동적쿼리, 계층형 쿼리를 별도 학습하지 않아 Discussion의 의견을 참고하여 작성되었음.
  1) LPAD, RPAD : 문자열의 길이를 동일하게 유지하도록 "특정문자를 채움"
    - LPAD(적용할 문자(컬럼), 문자열길이, 채울문자)
    - LPAD는 왼쪽(시작)으로 채움, RPAD는 오른쪽(끝)으로 채움.
    
  2) connect by level < 20 (<= 가능)
    - select 절에서 level 변수를 사용할 수 있으며, 행 별로 1씩 감소함
    - 여기에 +, * 등을 두어 적용하고자 하는 변수를 마음대로 조정 가능
*/

select rpad('*',(41-2*level),' *') from dual connect by level <=20;
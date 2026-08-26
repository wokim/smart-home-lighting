## 단계별 체크리스트

<table class="tight" style="font-size:.58em">
<tr><th>설계</th><th>기기 선정</th><th>전기공사 전</th><th>준공 후</th></tr>
<tr>
 <td>공간별로 씬·시나리오 초안을 잡는다</td>
 <td>광원 스펙 확인. CRI(Ra) 90, R9 50 이상</td>
 <td>스위치 박스마다 <strong>중성선</strong></td>
 <td>준공 시나리오는 초안이라는 걸 서로 합의한다</td></tr>
<tr>
 <td>조명 그룹을 나눈다</td>
 <td>디밍 레인지와 최소 레벨 안정성</td>
 <td><strong>제어선 2C</strong>를 드라이버와 스위치 박스까지</td>
 <td>피드백 루프를 계약과 기대치에 반영한다</td></tr>
<tr>
 <td><strong>제어 방식</strong>을 정한다. 유선이면 이 시점뿐이다</td>
 <td>플리커 수준</td>
 <td>조명 분전함 자리. 제어선이 모이는 곳</td>
 <td>건축주가 직접 만질 수 있는 구조인지 확인한다</td></tr>
<tr>
 <td>플랫폼 방향을 정한다</td>
 <td>드라이버와 제어 방식의 호환</td>
 <td>빌트인 가구 조명 배선을 가구 발주 전에</td>
 <td></td></tr>
<tr>
 <td></td>
 <td>상세 결선도를 시공 전에 확보한다</td>
 <td>일괄소등은 씬 스위치로 대체. 물리 차단 회로를 두지 않는다</td>
 <td></td></tr>
</table>

Note: 여기까지 한 얘기를 표로 모았다. 화면에서 다 읽을 필요는 없다. 강조할 것 셋만. 제어 방식은 유선이면 전기공사 전이 마지막 기회다. 중성선은 스위치 박스마다 넣어야 나중에 무엇이든 할 수 있다. 그리고 준공 시점의 시나리오는 초안이라는 걸 계약 단계에서 서로 합의해 두는 것.


===

## 참고: 대략적인 단가

<table class="tight" style="font-size:.62em">
<tr><th>품목</th><th>대략 단가</th><th>비고</th></tr>
<tr><td class="grp">CC 디밍 드라이버 (DALI)</td><td>개당 3만~4만 원</td><td>다운라이트마다 하나. 개수가 곧 비용이다</td></tr>
<tr><td class="grp">CV 디밍 드라이버 (DALI, 24V)</td><td>36W 약 4만 원, 150W 약 6.5만 원</td><td>간접등 구간마다 하나. 용량에 따라</td></tr>
<tr><td class="grp">DALI 푸시버튼 커플러</td><td>개당 약 8만 원</td><td>스위치 박스마다 하나. 스위치 기구는 별도</td></tr>
<tr><td class="grp">이너 릴레이 (Shelly i4)</td><td>개당 약 2만 원</td><td>무선형. 중성선 필요</td></tr>
<tr><td class="grp">DALI 모션·조도 센서</td><td>개당 약 15만 원</td><td>버스에 바로 붙는 타입 기준</td></tr>
<tr><td class="grp">DALI 버스 전원 공급 장치</td><td>개당 약 8만 원</td><td>버스(64주소)마다 하나</td></tr>
<tr><td class="grp">DALI 컨트롤러</td><td>약 15만~25만 원</td><td>버스 수에 따라. 플랫폼 허브는 별도</td></tr>
<tr><td class="grp">DALI 추가 입선 시공비</td><td>평당 약 8만 원</td><td>전기공사에서 버스 포설 명목으로 추가 청구받은 금액</td></tr>
</table>

<p class="muted" style="font-size:.58em;margin-top:.6em">2022년 구매가 기준. 환율, 수량, 채널 수, 시공사에 따라 달라진다. 광원과 등기구, 스위치 기구는 어차피 들어가는 비용이라 제외</p>

Note: 우리 집 기준 숫자다. 다운라이트 약 80개, DALI 버스 4개, 60평. 조명 제어 쪽 합계가 대략 1,200만 원이었고 그중 입선 시공비가 480만 원, CC 드라이버가 280만 원으로 가장 크다. 단가보다 개수가 비용을 정한다는 얘기. 4년 전 가격이라 지금은 다를 수 있고, 시공비는 시공사 협의에 따라 크게 다르다.


===

## 계산 예: 60평 주택, 다운라이트 70개

<table class="tight" style="font-size:.58em">
<tr><th>품목</th><th>수량</th><th>소계</th><th></th></tr>
<tr><td class="grp">CC 디밍 드라이버</td><td>70개</td><td>245만 원</td><td class="d">전체의 21%</td></tr>
<tr><td class="grp">CV 디밍 드라이버</td><td>10개</td><td>50만 원</td><td class="d"></td></tr>
<tr><td class="grp">DALI 푸시버튼 커플러</td><td>10개</td><td>80만 원</td><td class="d">스위치 기구는 별도</td></tr>
<tr><td class="grp">DALI 모션·조도 센서</td><td>10개</td><td>150만 원</td><td class="d"></td></tr>
<tr><td class="grp">DALI 버스 전원 공급 장치</td><td>4개</td><td>32만 원</td><td class="d">버스 4개로 나눈 경우</td></tr>
<tr><td class="grp">DALI 컨트롤러 + 라즈베리파이</td><td>1식</td><td>62만 원</td><td class="d"></td></tr>
<tr><td class="grp">플랫폼 허브</td><td>1대</td><td>47만 원</td><td class="d">조명 외 기기도 여기에 붙는다</td></tr>
<tr><td class="grp">DALI 추가 입선 시공비</td><td>60평</td><td><strong>480만 원</strong></td><td class="d"><strong>전체의 42%</strong></td></tr>
<tr><td class="grp"><strong>합계</strong></td><td></td><td><strong>약 1,150만 원</strong></td><td class="d">1,100만~1,200만</td></tr>
</table>

<p class="muted" style="font-size:.58em;margin-top:.6em">조명 자체(등기구·광원)는 별도. 설계 인건비와 장치 설치·커미셔닝 인건비도 제외. 입선 시공비는 배선 공사비이지 장치 설치비가 아니다</p>

Note: 숫자를 다 읽을 필요는 없고 두 가지만. 첫째, 선을 넣는 값이 42%로 가장 크고 CC 드라이버가 21%로 그다음이다. 기기 단가보다 조명 개수와 배선이 비용을 정한다. 둘째, 집 전체를 묶는 허브와 컨트롤러를 다 합쳐도 109만 원으로 10%가 안 된다. 제어 시스템이 비싸서 못 하는 게 아니라는 얘기다. 우리 집은 다운라이트 80개에 버스 4개로 약 1,200만 원이었다. 여기에 설계와 설치 인건비, 등기구값은 빠져 있다.



===

<!-- .slide: class="title" data-background-color="#0a0c10" -->
<div class="over">한국패시브건축협회 세미나</div>

# 감사합니다

Note: 체크리스트 한 장은 시공 들어가기 전에 다시 보시면 된다. 질문 받는다.

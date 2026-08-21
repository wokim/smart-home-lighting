<!-- .slide: class="act" -->
<div class="no">3</div>

## 조명제어의 구조

===

## 조명 품질을 결정하는 세 개의 레이어 — 광원, 드라이버, 제어

<img class="diagram" src="assets/diagrams/three-layers.svg">

Note: 광원, 드라이버, 제어 — 이 세 레이어는 서로를 대신하지 못한다. 한 레이어에서 문제가 생기면 다른 레이어의 좋은 부품으로 못 덮는다. 이 구조를 모르면 원인을 엉뚱한 데서 찾게 된다.

===

## 광원

- **CRI(Ra)** — 색이 얼마나 제대로 보이는가. 주거는 90 이상을 권장한다
- **R9** — CRI에 안 잡히는 빨강 재현력. 50 이상이어야 음식과 피부색이 산다
- **SDCM** — 같은 색온도 제품끼리의 색 편차. 3 이하면 육안으로 구분이 어렵다
- **배광·눈부심** — 빛이 퍼지는 모양과 광원 노출. 스펙 시트보다 등기구 구조가 결정한다

Note: 광원은 스펙 시트로 비교가 되는 편이라 오히려 제일 다루기 쉽다. 숫자는 주거 기준의 통상 권장치. 문제는 다음 두 레이어에서 터진다.

===

## 드라이버

<div class="cols2">
<div class="good">
<h4>좋은 디밍</h4>
100%에서 0.1%까지<br>
계단 없이 매끄럽게 내려간다
</div>
<div class="bad">
<h4>나쁜 디밍</h4>
20%쯤에서 <strong>툭</strong> 꺼져버린다<br>
밝기가 계단처럼 뚝뚝 끊긴다<br>
카메라에 줄이 가는 미세한 플리커
</div>
</div>

<video class="full" muted autoplay loop playsinline poster="assets/video/bad-dimming.jpg" style="max-height:220px;margin-top:.4em"><source src="assets/video/bad-dimming.mp4"></video>
<p class="muted" style="font-size:.6em">[영상 자리 — 나쁜 디밍: 팝콘 현상 · 계단 디밍 · low-end에서 툭]</p>

Note: 디밍 레인지, low-end 컷오프, fade 곡선, 플리커 — 이 넷이 드라이버의 핵심이다. 스펙에 "디밍 가능"이라고만 적혀 있어도 이 사진 같은 결과가 나올 수 있다. 색 안정성(디밍 중 색 틀어짐)도 드라이버 몫이다.

===

## 제어 방식 — 무엇이 어디까지 와 있어야 하는가

<table>
<tr><th>구분</th><th>방식</th><th>스위치 박스에 필요한 것</th><th>조명(드라이버)까지 필요한 것</th></tr>
<tr><td class="grp" rowspan="3">제어 지점<br>(입력 장치)</td>
  <td><span class="nm">일반 스위치</span><br><span class="d">전원을 직접 끊고 잇는다. 켜고 끄기만</span></td>
  <td>L 왕복 2가닥 — 기존 그대로</td><td>스위치를 거친 L + N</td></tr>
<tr><td><span class="nm">스마트 스위치</span><br><span class="d">스위치 자리에 통신 기능. 무선형이 대부분</span></td>
  <td><strong>중성선</strong> — 상시 전원이 필요하므로</td><td>상시 전원 L·N</td></tr>
<tr><td><span class="nm">이너 릴레이</span><br><span class="d">기존 스위치 뒤 입력 모듈. 일반 스위치를 스마트하게</span></td>
  <td><strong>중성선</strong>(Wi-Fi·Zigbee형) 또는 <strong>DALI 버스 2가닥</strong>(커플러형, L·N 불필요)</td><td>상시 전원 L·N</td></tr>
<tr><td class="grp" rowspan="3">명령 전달<br>(통신 방식)</td>
  <td><span class="nm">0-10V</span> <span class="d">유선</span><br><span class="d">아날로그 전압으로 밝기 지시</span></td>
  <td>—</td><td>전원선 + <strong>신호선 2가닥</strong>(극성 있음)</td></tr>
<tr><td><span class="nm">DALI</span> <span class="d">유선</span><br><span class="d">드라이버마다 주소, 디지털 버스로 명령</span></td>
  <td>커플러를 쓰면 버스 2가닥</td><td>전원선 + <strong>DALI 버스 2가닥</strong>(극성 무관)</td></tr>
<tr><td><span class="nm">Zigbee · Wi-Fi · Matter</span> <span class="d">무선</span><br><span class="d">허브 기반. 스마트 스위치도 이걸로 말한다</span></td>
  <td>—</td><td>상시 전원만. 추가 배선 없음 — 대신 전파 환경</td></tr>
</table>

Note: 두 범주를 섞지 않는 게 핵심이다. 위는 사람이 만지는 제어 지점(장치), 아래는 그 명령이 조명까지 가는 길(통신). 스마트 스위치가 Zigbee일 수도 있다 — 장치와 통신은 다른 축이다. 각 칸의 배선 요구가 곧 전기공사 때 정해야 할 것들이고, 뒤 슬라이드에서 하나씩 짚는다.

===

## 일반 스위치

<img class="diagram" src="assets/diagrams/plain-switch.svg" style="max-height:290px">

- 국내 주거의 기본값 — 대부분의 집이 여기서 시작한다
- 하는 일은 L을 끊고 이어서 L1을 만드는 것뿐이다. N은 스위치를 거치지 않는다
- 그래서 **fade out이 원리적으로 불가능하다** — 끊는 순간, 어두워질 에너지가 없다

Note: 어두워지려면 에너지가 서서히 줄어야 하는데, 일반 스위치는 전원을 끊는 순간 에너지 자체가 없다. 이건 부품을 바꿔서 해결할 문제가 아니라 방식 자체의 한계다. L/L1 표기는 스위치 단자(COM·L1·L2)에 찍힌 그 표기다.

===

## 일괄소등 스위치

<div class="cols2">
<div class="bad">
<h4>아날로그</h4>
모든 등의 전원을 물리적으로 차단한다<br>
스마트 기기까지 통째로 오프라인이 된다
</div>
<div class="good">
<h4>스마트</h4>
"전체 소등"이라는 씬에<br>버튼 하나를 매핑할 뿐이다
</div>
</div>

그래서 "일괄소등이 꺼져 있어 불이 안 들어온다"는 상황 자체가 존재하지 않는다

Note: 전원을 끊는 제어에서 명령을 보내는 제어로 바뀌는 걸 제일 친숙한 스위치로 설명한 거다. 함정 하나 — 기존 일괄소등 릴레이를 물리 차단으로 그대로 남겨두면 스마트 기기에 상시 전원이 끊긴다. 이건 뒤에 나올 체크리스트로 이어진다.

===

## 중성선

<img class="diagram" src="assets/diagrams/switchbox-neutral.svg">

Note: 이 발표에서 실무적으로 제일 큰 이슈다. 전기공사 때 N 한 가닥만 같이 넣으면 끝날 일인데, 그걸 안 하면 나중엔 벽을 다시 뜯어야 한다.

===

## 이너 릴레이 — 일반 스위치를 스마트 스위치로

<img class="diagram" src="assets/diagrams/inner-relay.svg" style="max-height:440px">

- 기존 스위치 뒤의 **입력 모듈**이 조작을 신호로 보내고, 조명은 별도의 스마트 드라이버가 켜고 끈다 — 스위치는 전원을 끊지 않으니 봉인 불필요. 조건: 박스에 **중성선** 또는 **DALI 버스**

Note: 예를 들면 Shelly i4 같은 Wi-Fi 입력 모듈. L·N으로 모듈에 상시 전원을 주고, 기존 스위치는 L과 SW1 사이에 물려 "눌렸다"를 알린다. 모듈이 그 신호를 무선으로 보내면 등기구 쪽 스마트 드라이버가 반응한다. 벽에서도 앱에서도 켜고 끌 수 있고 상태가 동기화된다. DALI 푸시버튼 커플러는 같은 역할을 DALI 버스 위에서 한다 — 다음 슬라이드. 전용 스위치(제조사 전용선·프로토콜)는 또 다른 길이다.

===

## DALI — 유선 제어

<img class="diagram" src="assets/diagrams/dali-bus.svg" style="max-height:380px">

드라이버마다 주소를 갖고, 벽 스위치도 **푸시버튼 커플러**로 같은 버스에 올라탄다 — 커플러는 버스 전원으로 동작해 L·N이 필요 없다

Note: 전원선과 별도로 DALI 버스 2가닥을 드라이버까지, 그리고 스위치 박스까지 미리 포설해야 한다는 게 조건이다. 대신 조명 전용 표준이라 표현력이 풍부하고 유선이라 안정적이다. "DALI라서 빛이 좋다"는 오해 — DALI의 강점은 빛이 아니라 제어의 표준화다. Tridonic·Helvar·eldoLED 같은 상급 드라이버가 DALI 현장에 많아 생긴 상관관계일 뿐, 싸구려 DALI 드라이버보다 좋은 Zigbee 드라이버의 빛이 나을 수 있다.

===

## 조명 관점에서 — DALI · Zigbee · Matter

<table>
<tr><th></th><th>DALI</th><th>Zigbee</th><th>Matter</th></tr>
<tr><td class="grp">무엇인가</td><td>조명 전용 유선 표준 (IEC 62386)</td><td>범용 무선 메시 — 조명 클러스터 포함</td><td>기기 연동 표준 — 어느 허브에나 붙도록</td></tr>
<tr><td class="grp">주소 · 그룹 · 씬</td><td>라인당 64주소 · 16그룹 · 16씬, 버스에 내장</td><td>그룹·씬 클러스터 있음, 허브가 관리</td><td>그룹·씬 있으나 생태계마다 구현 편차</td></tr>
<tr><td class="grp">페이드 · 전환</td><td>fade time·rate가 표준 명령 — 드라이버가 직접 부드럽게</td><td>전환 시간 지정 가능 (0.1초 단위)</td><td>전환 시간 지정 가능, 세밀한 곡선 제어는 제한적</td></tr>
<tr><td class="grp">상태 피드백</td><td>드라이버에 질의 — 램프 고장까지 보고</td><td>상태 보고 있음, 기기마다 다름</td><td>상태 보고 표준화, 깊이는 기기 의존</td></tr>
<tr><td class="grp">동시성</td><td>버스 브로드캐스트 — 수십 개가 <strong>정확히 같이</strong> 움직인다</td><td>그룹캐스트로 거의 동시, 메시 지연 가능</td><td>Zigbee·Thread·Wi-Fi 위에 얹힘 — 하부망 따라</td></tr>
<tr><td class="grp">배선</td><td>버스 2가닥 포설 필수 — <strong>지금</strong></td><td>상시 전원만 — 나중에도</td><td>상시 전원만 — 나중에도</td></tr>
<tr><td class="grp">생태계</td><td>조명 제조사 중심, 인증(DALI-2)</td><td>허브 종속 경향, 범용 허브로 완화</td><td>가장 젊다 — 호환은 넓고 깊이는 진행 중</td></tr>
</table>

Note: 표현력은 DALI가 압도적이다 — 조명만을 위해 만들어진 표준이라 페이드, 씬, 상태 질의, 동시성이 전부 버스 수준에서 해결된다. 대신 배선을 지금 정해야 한다. Zigbee는 실용적 중간, Matter는 "어디에나 붙는다"가 장점이고 깊이는 아직 따라오는 중이다. 어느 게 낫다가 아니라, 집의 규모·배선 시점·원하는 연출 수준에 따라 고르는 문제다.

===

## 세 레이어는 각자의 몫이 있다

- **광원**이 나쁘면 어떤 드라이버와 제어 방식을 써도 빛이 좋아지지 않는다
- 광원이 좋아도 **드라이버**가 나쁘면 디밍·페이드·플리커 같은 구동 품질이 떨어진다
- **제어 방식**은 빛 자체가 아니라, 명령이 얼마나 신뢰성 있고 정확하고 빠르게 전달되는지를 결정한다

Note: 이 구분이 이번 막 전체의 기준이다. "비싼 제어 방식을 쓰면 빛이 좋아진다"는 혼동이 여기서 생긴다 — 제어는 명령의 품질이고, 빛의 품질은 광원과 드라이버 몫이다. 여기까지가 구조. 다음은 이걸 무엇으로 묶느냐 — 플랫폼.

===

## 플랫폼

- 조명 앱 따로, 냉난방 앱 따로 — 앱이 기기마다 **파편화**된다
- 자사 허브에만 붙거나 해외 서버를 거치는 **벤더 종속**도 있다
- Matter가 **푸는 것**(기기 연동)과 **못 푸는 것**(씬·자동화의 깊이)을 구분해야 한다
- Home Assistant 같은 범용 허브는 종속을 벗는 대신, 통합자 역할을 사용자가 떠안는다

Note: 조명만 따로 놀 수 없다. 센서, 냉난방과 같은 플랫폼 위에 있어야 씬이라는 게 성립한다.

===

## 비가역성의 축

<img class="diagram" src="assets/diagrams/irreversibility.svg">

Note: 3막 전체가 여기로 착지한다. 벽이 닫히는 순간 전에 정해야 할 것들이다.

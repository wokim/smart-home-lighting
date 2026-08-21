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

## CC 드라이버와 CV 드라이버 — 왜 두 가지인가

<div class="cols2">
<div class="card">
<h4 style="color:#ffb454;font-size:.72em;letter-spacing:.1em;margin-bottom:.5em">CC — 정전류</h4>
<span class="muted" style="font-size:.85em">LED에 흐르는 전류를 일정하게 유지한다. 다운라이트·스폿처럼 <b>점광원, 등기구 1:1</b></span><br><br>
<span style="font-size:.85em">+ LED 전류를 직접 다루므로 <b>미세한 디밍에 유리</b>하다 — 아주 낮은 밝기까지 부드럽게 · 선로 거리에 둔감 · 타공 안에 들어가 점검이 쉽다<br>− 등기구 수만큼 드라이버가 필요하고, 등기구별 전류 규격(mA)을 맞춰야 한다</span>
</div>
<div class="card">
<h4 style="color:#58b7ff;font-size:.72em;letter-spacing:.1em;margin-bottom:.5em">CV — 정전압 (보통 24V)</h4>
<span class="muted" style="font-size:.85em">24V를 일정하게 공급하고, 전류 제한은 스트립 쪽에서 한다. 스트립·간접등처럼 <b>길이가 가변인 선광원</b></span><br><br>
<span style="font-size:.85em">+ <b>쓰기 편하다</b> — 드라이버 하나로 여러 스트립, 길이 조절과 교체가 자유롭다<br>− 전압을 끊어 조절하는 방식이라 <b>세밀한 디밍은 상대적으로 약하다</b>(저가품은 low-end·플리커가 아쉽다) · 거리가 길수록 전압강하 → 부하 가까이 · 부피가 커서 보관 자리가 필요하다</span>
</div>
</div>

<p class="muted" style="font-size:.62em;margin-top:.6em">어느 쪽이 좋다가 아니라 등기구 종류가 정한다 — 점광원은 CC, 선광원은 CV. 둘 다 한 집에 같이 쓴다</p>

Note: 드라이버 레이어 안의 두 부류. CC는 전류원이라 선이 길어져도 드라이버가 전압을 올려 전류를 지키고, CV는 전압원이라 선이 길면 끝에서 전압이 떨어진다 — 이게 4막에서 "드라이버 위치"를 따로 얘기하는 이유다. CV 저가품은 PWM 주파수가 낮아 카메라에 줄이 가는 플리커가 흔하다.

===

## 드라이버가 밝기를 줄이는 방법 — PWM, CCR, 하이브리드

- **PWM** (펄스폭 변조) — 전류를 아주 빠르게 켰다 껐다 하며, 켜진 시간의 비율로 밝기를 만든다. 색이 변하지 않고 0.1%까지 내려가기 쉽다. 대신 주파수가 낮으면(수백 Hz) 카메라에 줄이 가고 움직일 때 깜빡임이 느껴진다 — 수 kHz 이상이어야 한다
- **CCR** (정전류 감소, 아날로그 디밍) — 전류의 크기 자체를 줄인다. 깜빡임이 없고 효율이 좋다. 대신 전류가 아주 낮아지면 색온도가 틀어지고, 어느 선 아래로는 안 내려간다(low-end 컷오프)
- **하이브리드** — 밝은 영역은 CCR, 아주 어두운 영역만 PWM. 상급 드라이버가 쓰는 방식
- 스펙의 "디밍 가능"만으로는 어느 방식인지 모른다 — **PWM 주파수**와 **최소 디밍 레벨**을 확인한다

Note: 앞 슬라이드의 '나쁜 디밍' 세 증상이 여기서 나온다. 계단처럼 끊기는 건 디밍 해상도, 20%에서 툭 꺼지는 건 CCR의 low-end 컷오프, 카메라 줄은 낮은 주파수 PWM. 드라이버 스펙에서 PWM 주파수(kHz)와 최소 디밍 레벨(1%냐 0.1%냐)만 읽어도 절반은 걸러진다.

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

## 중성선

<img class="diagram" src="assets/diagrams/switchbox-neutral.svg">

Note: 이 발표에서 실무적으로 제일 큰 이슈다. 전기공사 때 N 한 가닥만 같이 넣으면 끝날 일인데, 그걸 안 하면 나중엔 벽을 다시 뜯어야 한다.

===

## 이너 릴레이 — 일반 스위치를 스마트 스위치로

<img class="diagram" src="assets/diagrams/inner-relay.svg" style="max-height:395px">

- 스위치 뒤의 **이너 릴레이**가 조명 제어 신호를 보내고, 드라이버가 이를 받아 조명을 제어한다

Note: 예를 들면 Shelly i4 같은 Wi-Fi 입력 모듈. L·N으로 모듈에 상시 전원을 주고, 기존 스위치는 L과 SW1 사이에 물려 "눌렸다"를 알린다. 모듈이 그 신호를 무선으로 보내면 등기구 쪽 스마트 드라이버가 반응한다. 벽에서도 앱에서도 켜고 끌 수 있고 상태가 동기화된다. DALI 푸시버튼 커플러는 같은 역할을 DALI 버스 위에서 한다 — 다음 슬라이드. 전용 스위치(제조사 전용선·프로토콜)는 또 다른 길이다.

===

## DALI — 유선 제어

<img class="diagram" src="assets/diagrams/dali-bus.svg" style="max-height:380px">

드라이버마다 주소를 갖고, 벽 스위치는 **푸시버튼 커플러**를 통해 같은 버스에 연결된다 — 커플러는 버스 전원으로 동작하므로 스위치 박스에 L·N이 필요 없다

Note: 전원선과 별도로 DALI 버스 2가닥을 드라이버까지, 그리고 스위치 박스까지 미리 포설해야 한다는 게 조건이다. 대신 조명 전용 표준이라 표현력이 풍부하고 유선이라 안정적이다. "DALI라서 빛이 좋다"는 오해 — DALI의 강점은 빛이 아니라 제어의 표준화다. Tridonic·Helvar·eldoLED 같은 상급 드라이버가 DALI 현장에 많아 생긴 상관관계일 뿐, 싸구려 DALI 드라이버보다 좋은 Zigbee 드라이버의 빛이 나을 수 있다.

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

## 플랫폼 — 조명을 묶는 중앙 컨트롤러

<img class="diagram" src="assets/diagrams/platform-stack.svg" style="max-height:300px">

- 스위치·센서·조명이 모두 연결되는 **허브** — 씬, 자동화, 센서 로직이 여기서 돈다
- 조명만 보고 정하면 안 된다 — 냉난방·커튼·센서가 **나중에 같은 자리**에 붙는다
- 플랫폼이 갈리면 씬이 성립하지 않는다. 허브끼리 끌어오기는 쉽지 않다 — **하나 정하고 전부 모은다**

Note: 앞에서 제어 방식(DALI·Zigbee·Matter)이 "명령이 조명까지 가는 길"이었다면, 플랫폼은 그 명령을 만들어내는 머리다. 스위치 눌림과 센서 감지가 여기 들어와서 "어떤 조명을 몇 %로"라는 명령으로 바뀐다. 중앙 컨트롤러를 정하는 순간 앞으로 붙을 모든 기기의 조건이 정해지므로, 조명 공사 때 가장 멀리 내다봐야 하는 결정이다.

===

## 플랫폼의 두 갈래

<div class="cols2">
<div class="card">
<h4 style="color:#ffb454;font-size:.75em;letter-spacing:.1em;margin-bottom:.6em">벤더 생태계</h4>
Hue, Aqara처럼 한 제조사의 허브·조명·스위치·센서·앱을 한 벌로 쓴다<br><br>
<span class="muted">자사 기기끼리는 가장 잘 맞는다. 대신 자사 허브에 묶이고, 해외 서버를 거치기도 한다</span>
</div>
<div class="card">
<h4 style="color:#58b7ff;font-size:.75em;letter-spacing:.1em;margin-bottom:.6em">범용 허브</h4>
Home Assistant 같은 플랫폼에 제조사를 가리지 않고 모은다<br><br>
<span class="muted">종속에서 벗어난다. 대신 호환성을 관리하는 통합자 역할을 사용자가 떠안는다</span>
</div>
</div>

Note: 어느 쪽이 옳다는 게 아니다. 건축주가 직접 만질 사람인지, 맡길 사람인지에 따라 갈린다. 벤더 생태계는 시작이 쉽고 끝이 닫혀 있고, 범용 허브는 시작이 어렵고 끝이 열려 있다. 참고로 DALI는 출발점이 다르다 — 인증 드라이버면 제조사를 섞어도 한 버스에서 동작하도록 만든 표준이라, 조명 레이어 안에서는 종속 문제가 덜하다.

===

## 그 위에 휴대폰과 음성

- 플랫폼은 보통 **Apple Home · Google Home과 양방향 연동**된다 — 일상 조작은 별도 앱 없이 폰 기본 앱과 음성으로
- 경향: 화면 조작은 Apple Home이, 음성은 Google이 낫다는 평이 많다
- **Matter**는 이 연동을 표준화하는 방향이다 — 기기 연동은 풀어주지만, 씬·자동화의 깊이는 여전히 플랫폼 몫이다

Note: 건축주 입장에서 실제로 매일 만지는 건 플랫폼 앱이 아니라 폰 기본 앱과 음성이다. 그래서 "플랫폼이 Apple Home·Google Home으로 잘 내보내주는가"가 실사용 품질을 좌우한다. DALI→KNX→Matter처럼 여러 단계를 거치는 구성도 있지만 오늘은 생략.

===

## 전기공사 전에 정해야 하는 것, 나중에 바꿀 수 있는 것

<div class="decide">
<div class="col now">
<h4>전기공사 전에 <small>공사가 끝나면 고정된다 — 바꾸려면 벽을 뜯어야 한다</small></h4>
<div class="row"><b>중성선</b> <span>— 스위치 박스마다. 없으면 스마트 스위치·입력 모듈에 상시 전원을 줄 수 없다</span></div>
<div class="row"><b>제어선</b> <span>— DALI 버스 2가닥, 0-10V 신호선. 유선 제어는 이 선이 없으면 선택지에서 사라진다</span></div>
<div class="row"><b>조명 분전함 자리</b> <span>— DALI 파워·마스터, 컨트롤러가 들어갈 자리. 모든 제어선이 여기로 모이므로 위치를 먼저 정한다</span></div>
<div class="row"><b>빌트인 가구 조명 배선</b> <span>— 가구 발주 전에 확정해야 한다</span></div>
<div class="row"><b>일괄소등 회로</b> <span>— 씬 스위치로 대체한다. 물리 차단 회로를 두지 않는다</span></div>
</div>
<div class="col later">
<h4>나중에 바꿀 수 있는 것 <small>기기와 설정 — 단, 왼쪽의 배선 조건 안에서</small></h4>
<div class="row"><b>스위치</b> <span>— 일반 → 스마트, 입력 모듈 추가. 중성선만 있으면</span></div>
<div class="row"><b>센서</b> <span>— 모션·조도. 붙이고 떼는 게 자유롭다</span></div>
<div class="row"><b>조명 기구 · 드라이버</b> <span>— 교체 가능. 제어 방식은 깔린 선이 정한다</span></div>
<div class="row"><b>허브 · 플랫폼</b> <span>— 바꿀 수 있다. 수고는 크지만 벽은 안 뜯는다</span></div>
<div class="row"><b>씬 · 시나리오</b> <span>— 어떤 버튼·센서에 조명이 어떻게 반응할지의 정의. 살면서 계속 바뀐다. 바뀌어야 정상이다</span></div>
</div>
</div>

Note: 3막 전체가 여기로 착지한다. 왼쪽은 전기공사가 끝나는 순간 고정되는 것들이고, 오른쪽은 살면서 바꿔도 되는 것들이다. 오늘 드리는 체크리스트의 본문이 왼쪽 열이다. 유선이냐 무선이냐의 선택도 결국 "왼쪽에 무엇을 넣어둘 것인가"의 문제다 — 선을 넣어두면 나중에 유선도 무선도 고를 수 있고, 안 넣어두면 무선만 남는다.
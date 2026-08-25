<!-- .slide: class="act" -->
<div class="no">2</div>

## 조명제어의 구조

===

## 조명 품질을 결정하는 세 개의 레이어: 제어, 드라이버, 광원

<img class="diagram" src="assets/diagrams/three-layers.svg">

Note: 제어, 드라이버, 광원. 이 세 레이어는 서로를 대신하지 못한다. 그림은 명령이 위에서 내려와 빛이 되는 순서로 읽는다. 한 레이어에서 문제가 생기면 다른 레이어의 좋은 부품으로 못 덮는다. 이 구조를 모르면 원인을 엉뚱한 데서 찾게 된다.

===

## 광원

- **CRI(Ra)**: 색이 얼마나 제대로 보이는가. 주거는 90 이상을 권장한다
- **R9**: CRI에 안 잡히는 빨강 재현력. 50 이상이어야 음식과 피부색이 산다
- **SDCM**: 같은 색온도 제품끼리의 색 편차. 3 이하면 육안으로 구분이 어렵다
- **배광·눈부심**: 빛이 퍼지는 모양과 광원 노출. 스펙 시트보다 등기구 구조가 결정한다

Note: 광원은 스펙 시트로 비교가 되는 편이라 오히려 제일 다루기 쉽다. 숫자는 주거 기준의 통상 권장치. 문제는 다음 두 레이어에서 터진다.

===

## 드라이버

- **전원을 바꾼다.** 220V 교류를 등기구가 요구하는 직류로 만든다. 전류(mA)나 전압(24V)이 안 맞으면 등기구가 제 밝기를 내지 못한다
- **밝기를 만든다.** DALI, 0-10V 같은 제어 신호를 받아 그만큼의 빛을 낸다. 페이드도 드라이버가 실행한다
- **씬 값을 갖고 있다.** DALI, Zigbee 같은 디지털 방식의 드라이버는 자기 주소와 씬별 밝기를 기억한다. 그룹 명령 하나에 여러 등이 각자 정해진 밝기로 움직이는 이유다. 0-10V는 저장하지 못해 연결된 등이 다 같이 움직인다
- 등기구마다 하나씩 붙는 부품이라 **개수가 곧 비용**이고, 나중에 교체할 수 있어야 한다

Note: 광원이 빛의 재료라면 드라이버는 그 빛을 실제로 만들어내는 장치다. 전원 변환만 하는 게 아니라 밝기와 페이드를 실행하고, DALI라면 씬 값까지 들고 있다. 1막에서 말한 분산형이 여기서 성립한다. 씬 저장은 DALI만의 것이 아니라 Zigbee(씬 클러스터), KNX도 같다. 0-10V는 주소도 저장도 없어서 한 신호선에 물린 드라이버가 전부 같은 밝기가 된다. 그룹 명령 한 번에 여러 등이 각자 다른 밝기로 움직이는 건 드라이버가 자기 몫을 기억하고 있어서다.


===

## 좋은 디밍과 나쁜 디밍

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

<p class="muted" style="font-size:.7em;margin-top:.6em">이 차이는 스펙 시트의 "디밍 가능"으로는 보이지 않는다. 다음 두 장이 그 이유다</p>

Note: 디밍 레인지, 최소 레벨 컷오프, 페이드 곡선, 플리커. 이 넷이 드라이버 품질의 핵심이다. 스펙에 "디밍 가능"이라고만 적혀 있어도 이 사진 같은 결과가 나올 수 있다. 색 안정성(디밍 중 색 틀어짐)도 드라이버 몫이다.

===

## CC 드라이버와 CV 드라이버: 왜 두 가지인가

<img class="diagram" src="assets/diagrams/cc-cv.svg" style="max-height:330px">

<div class="cols2" style="font-size:.72em">
<div class="card"><h4 style="color:#ffb454;font-size:.8em;letter-spacing:.1em;margin-bottom:.5em">CC, 점광원용</h4>다운라이트·스폿. 등기구 1:1. LED 전류를 직접 다루므로 <strong>미세한 디밍에 유리</strong>. 거리에 둔감. 등기구별 전류 규격(mA)을 맞춰야 한다</div>
<div class="card"><h4 style="color:#58b7ff;font-size:.8em;letter-spacing:.1em;margin-bottom:.5em">CV, 선광원용</h4>스트립·간접등. 하나로 여러 스트립, 길이 조절과 교체가 자유. 전압을 끊어 조절하므로 <strong>세밀한 디밍은 약한 편</strong>. 전압강하 때문에 부하 가까이</div>
</div>

<p class="muted" style="font-size:.6em">어느 쪽이 좋다가 아니라 등기구 종류가 정한다. 점광원은 CC, 선광원은 CV. 둘 다 한 집에 같이 쓴다</p>

Note: 드라이버 레이어 안의 두 부류. CC는 전류원이라 선이 길어져도 드라이버가 전압을 올려 전류를 지키고, CV는 전압원이라 선이 길면 끝에서 전압이 떨어진다 — 이게 4막에서 "드라이버 위치"를 따로 얘기하는 이유다. CV 저가품은 PWM 주파수가 낮아 카메라에 줄이 가는 플리커가 흔하다.

===

## CC 드라이버와 CV 드라이버, 실물

<div class="photos">
<figure><img src="assets/photos/cc-driver-downlight.jpg"><figcaption>CC 드라이버. 다운라이트 하나에 하나씩 붙고, 등기구 타공 구멍으로 천장 속에 들어간다. 1차측 L·N, 2차측 LED+·LED−</figcaption></figure>
<figure><img src="assets/photos/cv-driver.jpg"><figcaption>CV 드라이버(24V, 150W, DALI·푸시 디밍). 스트립 여러 개를 병렬로 물리므로 길쭉하고 크다. 타공이 없어 보관 위치를 따로 잡아야 한다</figcaption></figure>
</div>

Note: 왼쪽이 CC, 오른쪽이 CV. 크기 차이가 곧 역할 차이다. CC는 등기구마다 하나라 작고, 타공 구멍이 점검구가 된다. CV는 한 대가 스트립 여러 개를 먹으니 용량이 크고, 어디에 둘지 도면에 잡아야 한다. 오른쪽 라벨에 "Flicker Free, Dimmable 0.1%~100%"가 보이는데, 이런 항목이 앞 장에서 말한 '스펙 시트로 확인할 것'이다.


===

## 드라이버가 밝기를 줄이는 방법: PWM, CCR, 하이브리드

- **PWM**(펄스폭 변조): 전류를 아주 빠르게 켰다 껐다 하며, 켜진 시간의 비율로 밝기를 만든다. 색이 변하지 않고 0.1%까지 내려가기 쉽다. 대신 주파수가 낮으면(수백 Hz) 카메라에 줄이 가고 움직일 때 깜빡임이 느껴진다. 수 kHz 이상이어야 한다
- **CCR**(정전류 감소, 아날로그 디밍): 전류의 크기 자체를 줄인다. 깜빡임이 없고 효율이 좋다. 대신 전류가 아주 낮아지면 색온도가 틀어지고, 어느 선 아래로는 안 내려간다(low-end 컷오프)
- **하이브리드**: 밝은 영역은 CCR, 아주 어두운 영역만 PWM. 상급 드라이버가 쓰는 방식
- 스펙의 "디밍 가능"만으로는 어느 방식인지 모른다. **PWM 주파수**와 **최소 디밍 레벨**을 확인한다

Note: 앞 슬라이드의 '나쁜 디밍' 세 증상이 여기서 나온다. 계단처럼 끊기는 건 디밍 해상도, 20%에서 툭 꺼지는 건 CCR의 low-end 컷오프, 카메라 줄은 낮은 주파수 PWM. 드라이버 스펙에서 PWM 주파수(kHz)와 최소 디밍 레벨(1%냐 0.1%냐)만 읽어도 절반은 걸러진다.

===

## 제어 방식별 배선 조건

<table>
<tr><th>구분</th><th>방식</th><th>스위치 박스에 필요한 것</th><th>조명(드라이버)까지 필요한 것</th></tr>
<tr><td class="grp" rowspan="3">제어 지점<br>(입력 기기)</td>
  <td><span class="nm">일반 스위치</span><br><span class="d">전원을 직접 끊고 잇는다. 켜고 끄기만</span></td>
  <td>L 왕복 2가닥(기존 그대로)</td><td>스위치를 거친 L + N</td></tr>
<tr><td><span class="nm">스마트 스위치</span><br><span class="d">스위치 자리에 통신 기능. 무선형이 대부분</span></td>
  <td><strong>중성선</strong>(상시 전원이 필요하므로)</td><td>상시 전원 L·N</td></tr>
<tr><td><span class="nm">이너 릴레이</span><br><span class="d">기존 스위치 뒤에 숨는 모듈. 일반 스위치를 스마트하게</span></td>
  <td><strong>중성선</strong>(Wi-Fi·Zigbee형) 또는 <strong>DALI 버스 2가닥</strong>(커플러형, L·N 불필요)</td><td>상시 전원 L·N</td></tr>
<tr><td class="grp" rowspan="3">명령 전달<br>(통신 방식)</td>
  <td><span class="nm">0-10V</span> <span class="d">유선</span><br><span class="d">아날로그 전압으로 밝기 지시</span></td>
  <td>없음</td><td>전원선 + <strong>신호선 2가닥</strong>(극성 있음)</td></tr>
<tr><td><span class="nm">DALI</span> <span class="d">유선</span><br><span class="d">드라이버마다 주소, 디지털 버스로 명령</span></td>
  <td>커플러를 쓰면 버스 2가닥</td><td>전원선 + <strong>DALI 버스 2가닥</strong>(극성 무관)</td></tr>
<tr><td><span class="nm">Zigbee · Wi-Fi · Matter</span> <span class="d">무선</span><br><span class="d">허브 기반. 스마트 스위치도 이걸로 말한다</span></td>
  <td>없음</td><td>상시 전원만. 추가 배선 없음. 대신 전파 환경을 탄다</td></tr>
</table>

Note: 두 범주를 섞지 않는 게 핵심이다. 위는 사람이 만지는 제어 지점(기기), 아래는 그 명령이 조명까지 가는 길(통신). 스마트 스위치가 Zigbee일 수도 있다 — 기기와 통신은 다른 축이다. 각 칸의 배선 요구가 곧 전기공사 때 정해야 할 것들이고, 뒤 슬라이드에서 하나씩 짚는다.

===

## 일반 스위치

<img class="diagram" src="assets/diagrams/plain-switch.svg" style="max-height:290px">

- 국내 주거의 기본값. 대부분의 집이 여기서 시작한다
- 하는 일은 L을 끊고 이어서 L1을 만드는 것뿐이다. N은 스위치를 거치지 않는다
- 그래서 **fade out이 원리적으로 불가능하다**. 끊는 순간 어두워질 에너지가 없다

Note: 어두워지려면 에너지가 서서히 줄어야 하는데, 일반 스위치는 전원을 끊는 순간 에너지 자체가 없다. 이건 부품을 바꿔서 해결할 문제가 아니라 방식 자체의 한계다. L/L1 표기는 스위치 단자(COM·L1·L2)에 찍힌 그 표기다.

===

## 중성선

<img class="diagram" src="assets/diagrams/switchbox-neutral.svg">

Note: 이 발표에서 실무적으로 제일 큰 이슈다. 전기공사 때 N 한 가닥만 같이 넣으면 끝날 일인데, 그걸 안 하면 나중엔 벽을 다시 뜯어야 한다.

===

## 이너 릴레이: 일반 스위치를 스마트 스위치로

<img class="diagram" src="assets/diagrams/inner-relay.svg" style="max-height:395px">

- 스위치 뒤의 **이너 릴레이**가 조명 제어 신호를 보내고, 드라이버가 이를 받아 조명을 제어한다

Note: 예를 들면 Shelly i4 같은 Wi-Fi 입력 모듈. L·N으로 모듈에 상시 전원을 주고, 기존 스위치는 L과 SW1 사이에 물려 "눌렸다"를 알린다. 모듈이 그 신호를 무선으로 보내면 등기구 쪽 스마트 드라이버가 반응한다. 벽에서도 앱에서도 켜고 끌 수 있고 상태가 동기화된다. DALI 푸시버튼 커플러는 같은 역할을 DALI 버스 위에서 한다 — 다음 슬라이드. 전용 스위치(제조사 전용선·프로토콜)는 또 다른 길이다.

===

## DALI, 유선 제어

<p style="font-size:.8em">조명 전용 유선 표준(IEC 62386). 등기구마다 드라이버가 <strong>주소</strong>를 갖고, <strong>2가닥 버스 하나</strong>로 전부를 개별·그룹·씬으로 제어한다</p>

<img class="diagram" src="assets/diagrams/dali-bus.svg" style="max-height:315px">

벽 스위치는 **푸시버튼 커플러**를 통해 같은 버스에 연결된다. 커플러는 버스 전원으로 동작하므로 스위치 박스에 L·N이 필요 없다

Note: 전원선과 별도로 DALI 버스 2가닥을 드라이버까지, 그리고 스위치 박스까지 미리 포설해야 한다는 게 조건이다. 대신 조명 전용 표준이라 표현력이 풍부하고 유선이라 안정적이다. "DALI라서 빛이 좋다"는 오해 — DALI의 강점은 빛이 아니라 제어의 표준화다. Tridonic·Helvar·eldoLED 같은 상급 드라이버가 DALI 현장에 많아 생긴 상관관계일 뿐, 싸구려 DALI 드라이버보다 좋은 Zigbee 드라이버의 빛이 나을 수 있다.

===

## 이너 릴레이와 DALI 푸시버튼 커플러, 실물

<div class="photos">
<figure><img src="assets/photos/shelly-inner-relay.jpg"><figcaption>Shelly 모듈. 스위치 박스 안, 기존 스위치 뒤에 들어간다. 상시 전원 L·N을 받고 S1·S2 단자로 스위치 눌림을 읽는다. 박스에 N이 있어야 한다</figcaption></figure>
<figure><img src="assets/photos/jung-dali-coupler.jpg"><figcaption>Lunatone DALI 푸시버튼 커플러와 JUNG 스위치 기구. 버스 2가닥(DALI)과 스위치 접점 T1~T4, COM뿐이다. L·N이 없다</figcaption></figure>
</div>

Note: 둘 다 "스위치 뒤에 숨는 모듈"이다. 차이는 전원. 왼쪽은 Wi-Fi라 상시 전원이 필요하고, 그래서 중성선 얘기가 나온다. 오른쪽은 DALI 버스에서 전원을 받으니 박스에 전원선이 없어도 된다. 스위치 자체는 둘 다 그냥 무전원 접점이다.


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

## 세 레이어는 각자의 몫이 있다

- **광원**이 나쁘면 어떤 드라이버와 제어 방식을 써도 빛이 좋아지지 않는다
- 광원이 좋아도 **드라이버**가 나쁘면 디밍·페이드·플리커 같은 구동 품질이 떨어진다
- **제어 방식**은 빛 자체가 아니라, 명령이 얼마나 신뢰성 있고 정확하고 빠르게 전달되는지를 결정한다

Note: 이 구분이 이번 막 전체의 기준이다. "비싼 제어 방식을 쓰면 빛이 좋아진다"는 혼동이 여기서 생긴다 — 제어는 명령의 품질이고, 빛의 품질은 광원과 드라이버 몫이다. 여기까지가 구조. 다음은 시중 시스템을 이 구조로 읽어본다.

===

## 시중 스마트 조명 시스템 비교

<table class="tight" style="font-size:.48em">
<tr><th></th><th>Philips Hue</th><th>Aqara</th><th>Tuya · eWeLink 계열</th><th>DALI</th></tr>
<tr><td class="grp">통신</td><td>Zigbee</td><td>Zigbee. 최신 허브는 Matter 브릿지·Thread 지원</td><td>Wi-Fi 또는 Zigbee</td><td>유선 버스, 개방 표준</td></tr>
<tr><td class="grp">광원 · 드라이버</td><td>광원+드라이버+무선 <strong>일체형</strong>, 통째로 구매</td><td>일체형 등기구와 <strong>별도 드라이버·모듈</strong> 둘 다</td><td>대부분 일체형 저가 등기구</td><td>드라이버 제조사 자유, 광원과 별도 선택</td></tr>
<tr><td class="grp">허브 · 앱</td><td>자사 브릿지. 타사 전구 일부, 스위치·센서는 자사</td><td>자사 허브+앱(해외 서버). 타사 기기 거의 불가</td><td>제조사 앱, <strong>클라우드 경유</strong></td><td>컨트롤러 위에 무엇이든 (KNX·범용 허브)</td></tr>
<tr><td class="grp">기존 스위치 활용</td><td>스위치 뒤 배터리식 <strong>월 스위치 모듈</strong>(중성선 불필요). JUNG 등 무전원 스위치로 교체도 가능</td><td>스위치 뒤 <strong>릴레이 모듈 T2</strong>, 무선 스위치 모드(중성선 필요). 또는 자사 스마트 스위치로 교체(무중성선 버전 있음)</td><td>스마트 스위치는 많음. 기존 스위치를 물리는 릴레이 모듈도 있으나, 스위치를 신호 전용으로 쓰는 기능은 제품마다 다름</td><td>푸시버튼 커플러 (버스 전원, L·N 불필요)</td></tr>
<tr><td class="grp">필요한 배선</td><td>조명 상시 전원. 스위치 박스 중성선 불필요</td><td>조명 상시 전원. 스위치 박스 <strong>중성선 필요</strong></td><td>조명 상시 전원</td><td>전원선 + <strong>버스 2가닥, 지금 시공</strong></td></tr>
<tr><td class="grp">동시성</td><td>룸·존 그룹 명령으로 동시. HA에서도 그룹 엔티티로 쏘면 동시, 등 하나씩 호출하면 팝콘</td><td>허브 안 그룹·씬은 동시. HA·Matter로 붙이면 등이 개별로만 올라와 <strong>팝콘</strong>. 허브 씬을 내보내 호출하면 해결</td><td>Wi-Fi형은 기기별 개별 제어라 <strong>팝콘이 기본</strong>. Zigbee형은 허브 그룹 가능</td><td>그룹·씬 명령은 버스 전체 동시, <strong>누락 없음</strong></td></tr>
<tr><td class="grp">규모</td><td>브릿지당 50 (Pro 150)</td><td>허브당 64~128</td><td>공유기 한계</td><td>라인당 64, 라인 증설</td></tr>
<tr><td class="grp">제어 경로</td><td>로컬 무선 (전파 영향)</td><td>허브 자동화 로컬, 앱은 클라우드</td><td><strong>클라우드 왕복</strong> (인터넷 끊기면 앱 불가)</td><td><strong>로컬 유선</strong> (전파·인터넷 무관)</td></tr>
<tr><td class="grp">생태계</td><td>가장 성숙, 브릿지 자사 위주</td><td>기기 폭 넓음, 허브 종속</td><td>가장 싸고 많음, 클라우드 종속</td><td>조명 제조사 중심, DALI-2 인증. 벤더 종속 없음</td></tr>
</table>

<p class="muted" style="font-size:.5em;margin-top:.5em">그 밖에: Lutron (전용 sub-GHz 무선, 동시성·디밍 최상, 국내 드묾) · Casambi (BLE 메시, 허브 없음, DALI 드라이버를 무선 제어하는 조합 흔함) · IKEA (Zigbee, 저가) · 헤이홈 (Tuya 기반) · SmartThings · Google Home · Apple Home (플랫폼)</p>

Note: 그룹·씬·페이드 시간 지정은 Hue·Aqara·DALI 셋 다 된다. 차이는 어떤 조건에서 깨지느냐다. Hue 브릿지는 50개(하드리밋 63, Pro는 150). 방·존 단위 조작은 Zigbee 그룹 명령 하나라 실제로 동시에 움직인다. 등 하나하나에 따로 명령을 보내면 Zigbee가 초당 25~50 명령뿐이라 50개에 1~2초가 걸리고, 브릿지는 이때 실행 시각을 예약해 보내서 동시처럼 보이게 한다. 팝콘은 이 개별 명령 경로에서 난다. 반대로 그룹 명령은 응답 확인 없이 쏘는 거라 전파가 안 닿은 드라이버 하나는 못 듣고 켜진 채 남을 수 있다(메시 재방송과 허브의 재전송으로 줄이지만 0은 아니다). 유선 버스는 모든 드라이버가 같은 전기 신호를 물리적으로 받으니 이 고민 자체가 없다. Aqara는 허브 안에서 씬을 돌리면 괜찮고, HA나 Matter로 개별 명령을 보내면 팝콘이 난다(Aqara 포럼 공식 답변). Tuya·eWeLink 계열은 앱 조작이 클라우드를 왕복하고 LAN 제어는 일부 기기만. DALI도 주소별로 하나씩 명령하면 팝콘이 난다. 버스가 1200bps라 명령당 20~40ms, 50개면 1~2초다. 그래서 표준에 그룹 16개·씬 16개가 있다. 씬은 드라이버마다 저장돼 있고 '씬 3'이라는 명령 하나가 버스 전체에 가니 50개가 각자 다른 밝기로 동시에 움직인다. Zigbee와의 진짜 차이는 속도가 아니라, 그 그룹 명령을 못 듣는 드라이버가 없다는 것. 페이드 시간도 표준 명령이다. 기존 벽 스위치(융 등)를 그대로 두고 싶다면 — Hue는 배터리식 월 스위치 모듈을 스위치 뒤에 넣거나 JUNG이 내는 Friends of Hue 무전원 스위치를 쓰고, Aqara는 릴레이 모듈 T2를 무선 스위치 모드로 두면 된다(이건 중성선 필요). Hue와 Aqara가 같은 Zigbee인데 안 섞이는 건 허브가 자사 기기만 받아서이고, 범용 허브로 묶으면 붙는다 — 대신 통합자 역할. Lutron은 전용 sub-GHz 무선으로 팝콘을 설계 단계에서 없앤 시스템이지만 국내 유통이 거의 없고, Casambi는 허브 없이 노드마다 로직을 갖는 BLE 메시라 건축 조명 쪽에서 쓴다.

===

## 플랫폼: 조명을 묶는 중앙 컨트롤러

<img class="diagram" src="assets/diagrams/platform-stack.svg" style="max-height:300px">

- 스위치·센서·조명이 모두 연결되는 **허브**. 씬, 자동화, 센서 로직이 여기서 돈다
- 조명만 보고 정하면 안 된다. 냉난방·커튼·센서가 **나중에 같은 자리**에 붙는다
- 플랫폼이 갈리면 씬이 성립하지 않는다. 허브끼리 끌어오기는 쉽지 않다. **하나 정하고 전부 모은다**

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

- 플랫폼은 보통 **Apple Home · Google Home과 양방향 연동**할 수 있고, 일반적인 조작은 별도 앱 없이 폰 기본 앱과 음성으로 할 수 있다
- 음성 제어는 Google이, 홈 앱의 완성도는 Apple이 낫다는 평이 많다
- **Matter**는 이 연동을 표준화하는 규격이다. 매터 브릿지를 쓰면 플랫폼의 기기를 Matter 기기처럼 Apple Home·Google Home에 노출할 수 있다. 다만 기기가 보이는 것과 씬·자동화로 유기적으로 엮이는 것은 별개라, 그 깊이는 여전히 플랫폼 몫이다

Note: 3막은 여기까지. 다음 막은 이 구조를 실제 집에 넣는 절차다. 건축주 입장에서 실제로 매일 만지는 건 플랫폼 앱이 아니라 폰 기본 앱과 음성이다. 그래서 "플랫폼이 Apple Home·Google Home으로 잘 내보내주는가"가 실사용 품질을 좌우한다. DALI→KNX→Matter처럼 여러 단계를 거치는 구성도 있지만 오늘은 생략.
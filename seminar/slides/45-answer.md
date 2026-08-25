<!-- .slide: class="act" -->
<div class="no">4</div>

## 그래서 무엇을 어떻게 하면 되는가

===

## 원하는 것과 그것을 결정하는 곳

<table class="tight" style="font-size:.6em">
<tr><th>원하는 것</th><th>어디서 결정되는가</th><th>무엇을 해야 하는가</th></tr>
<tr><td class="grp">스르륵 켜지고 꺼진다</td><td>드라이버, 배선</td><td>디밍 드라이버를 쓰고, 벽 스위치가 전원을 끊지 않게 상시 전원으로 배선한다</td></tr>
<tr><td class="grp">디밍이 매끄럽다</td><td>드라이버</td><td>최소 디밍 레벨과 플리커 스펙을 확인한다. 구동 방식은 다음이 아니라 이게 먼저다</td></tr>
<tr><td class="grp">버튼 하나로 여러 등이 동시에</td><td>통신 방식</td><td>그룹·씬 명령이 있는 방식을 고른다. 유선(DALI)이 가장 확실하고, 무선은 허브 안 그룹으로</td></tr>
<tr><td class="grp">벽, 스마트폰, 태블릿 PC, 음성 전부</td><td>플랫폼</td><td>스위치와 조명을 한 플랫폼에 모으고, Apple Home·Google Home과 연동한다</td></tr>
<tr><td class="grp">끊기지 않는다</td><td>통신 방식, 플랫폼</td><td>제어 경로가 로컬인 구성을 고른다. 유선은 전파·인터넷과 무관하고, 무선은 허브 자동화가 로컬이어야 한다</td></tr>
<tr><td class="grp">계단·복도는 알아서</td><td>센서, 플랫폼</td><td>모션센서를 같은 플랫폼에 붙이고 시간·밝기 로직을 설정한다</td></tr>
<tr><td class="grp">살면서 바꿀 수 있다</td><td>플랫폼</td><td>설정을 건축주가 직접 만질 수 있는 플랫폼을 고른다. 배선은 바꿀 수 없으니 여유 있게</td></tr>
</table>

Note: 0막에서 정리한 것과 건축주가 실제로 원하는 것을 2막의 레이어에 대응시킨 표. 왼쪽이 건축주의 말, 가운데가 어느 레이어의 일인지, 오른쪽이 실제로 할 일. 대부분 드라이버·통신 방식·플랫폼 셋 중 하나로 귀결된다. 광원은 빛의 품질이지 제어가 아니라 이 표에 없다.


===

## 답안 하나: 유선(DALI)으로 한다면

<div class="decide">
<div class="col now">
<h4>전기공사 전에 <small>도면에 들어가야 하는 것</small></h4>
<div class="row"><b>배선.</b> <span>스위치 박스마다 중성선. 모든 드라이버와 스위치 박스까지 DALI 버스 2C. 버스는 64주소 단위로 나눈다</span></div>
<div class="row"><b>분전함.</b> <span>버스마다 전원 공급 장치와 게이트웨이가 들어갈 자리. 제어선이 전부 여기로 온다</span></div>
<div class="row"><b>기기.</b> <span>다운라이트마다 DALI CC 드라이버, 간접등 구간마다 DALI CV 드라이버, 스위치 박스마다 푸시버튼 커플러, 동선에 DALI 센서</span></div>
</div>
<div class="col later">
<h4>공사 후에 <small>설정으로 하는 것</small></h4>
<div class="row"><b>플랫폼.</b> <span>DALI 게이트웨이를 받아 주는 허브를 고른다. 범용 허브(Home Assistant, Homey 등)나 KNX</span></div>
<div class="row"><b>커미셔닝.</b> <span>드라이버마다 주소를 부여하고 허브에 등록한다. 전문 업체나 직접</span></div>
<div class="row"><b>그룹, 씬, 매핑.</b> <span>공간별 그룹을 만들고, 씬을 짜고, 각 버튼과 센서에 건다</span></div>
<div class="row"><b>연동.</b> <span>허브를 Apple Home·Google Home에 연결하면 스마트폰, 태블릿 PC, 음성이 따라온다</span></div>
</div>
</div>

<p class="muted" style="font-size:.6em;margin-top:.6em">얻는 것: 동시성과 신뢰성, 전파·인터넷 무관, 벤더 종속 없음. 치르는 것: 배선의 비가역성, 입선 비용, 국내에 익숙한 시공사가 적음</p>

Note: 우리 집 구성이 이것이다. 0막 영상이 이 답안의 결과물. 왼쪽은 벽을 닫기 전에 끝나야 하는 것, 오른쪽은 살면서 계속 만지는 것. 커미셔닝을 누가 하느냐가 국내에서는 현실적인 걸림돌이고, 그래서 4막에서 시공 주체 얘기를 했다.


===

## 답안 둘: 무선으로 한다면

<div class="decide">
<div class="col now">
<h4>전기공사 전에 <small>도면에 들어가야 하는 것</small></h4>
<div class="row"><b>배선.</b> <span>스위치 박스마다 중성선. 모든 등기구에 상시 전원. 제어선은 없다</span></div>
<div class="row"><b>기기.</b> <span>Zigbee 드라이버 또는 일체형 스마트 등기구, 스위치 뒤 이너 릴레이(Shelly i4 등) 또는 스마트 스위치, 무선 모션센서</span></div>
<div class="row"><b>전파.</b> <span>허브 위치와 중계 기기를 감안한다. 콘크리트 벽과 층을 넘는 구간이 약점이다</span></div>
</div>
<div class="col later">
<h4>공사 후에 <small>설정으로 하는 것</small></h4>
<div class="row"><b>플랫폼.</b> <span>벤더 생태계(Hue, Aqara)로 한 벌을 맞추거나, 범용 허브에 섞어 모은다</span></div>
<div class="row"><b>페어링.</b> <span>기기를 허브에 하나씩 등록한다. 앱으로 할 수 있어 문턱이 낮다</span></div>
<div class="row"><b>그룹, 씬, 매핑.</b> <span>허브 안에서 그룹을 만들어야 동시에 움직인다. 등 하나씩 호출하면 팝콘이 된다</span></div>
<div class="row"><b>연동.</b> <span>Matter 브릿지나 허브 연동으로 스마트폰·음성까지</span></div>
</div>
</div>

<p class="muted" style="font-size:.6em;margin-top:.6em">얻는 것: 배선 부담이 적고 나중에 시작할 수 있음, 시공사 문턱이 낮음. 치르는 것: 규모와 동시성의 한계, 전파 환경, 허브와 앱에 대한 종속</p>

Note: 배선을 미리 못 깐 집, 리모델링, 규모가 작은 집의 현실적인 답. 중성선만은 여기서도 필요하다. 무선이라고 배선이 없는 게 아니라 제어선이 없는 것.


===

## 플랫폼을 고르는 기준

- 허브 안 자동화가 **로컬**로 도는가. 인터넷이 끊겨도 벽 스위치와 씬이 동작해야 한다
- 조명 외에 **냉난방, 블라인드, 센서**가 같은 허브에 붙을 수 있는가. 나중에 전부 한 곳에 모인다
- **Apple Home, Google Home**과 연동되는가. 스마트폰, 태블릿 PC, 음성은 이 연동으로 해결된다
- 설정을 **건축주가 직접** 바꿀 수 있는가. 앱에서 씬과 버튼 매핑을 고칠 수 있어야 살면서 바꾼다
- 선택한 제어 방식의 기기가 붙는가. DALI면 게이트웨이, 무선이면 해당 프로토콜

<p class="muted" style="font-size:.62em;margin-top:.8em">이 기준을 넘는 플랫폼 위에 그룹과 씬을 설정하면, 처음에 보신 영상이 그대로 된다. 설정 자체는 기술이 아니라 취향의 문제라 살면서 계속 고쳐 쓰면 된다</p>

Note: 브랜드를 찍어 주는 대신 기준을 준다. 로컬 동작과 확장성, 폰·음성 연동, 직접 수정 가능 여부. 이 넷을 만족하는 후보가 몇 안 되니 여기까지만 말해도 선택은 좁혀진다.

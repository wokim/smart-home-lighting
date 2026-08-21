<!-- .slide: class="title" data-background-color="#0a0c10" -->
<div class="over">한국패시브건축협회 세미나</div>

# 주거 <strong>조명제어</strong>의 실제

<div class="meta">설계 · 시공 · 운영</div>
<div class="meta" style="margin-top:.6em;color:#98a1b5">김원식 — 건축주 / 소프트웨어 엔지니어</div>

Note: 인사 두 문장. 외국계 IT에서 20년, 지금은 해외 업체 CTO. 그리고 인증주택을 지은 건축주. 오늘은 그 두 입장이 겹치는 자리에서 말씀드린다.

===

<!-- .slide: class="statement" -->
> 해외와 달리, 국내 주거 시공에는<br>스마트홈 조명의 표준 도면이나 관행이 아직 없습니다.

**오늘 내용은 집을 지으며 직접 겪은 시행착오의 정리입니다**

Note: 해외엔 KNX나 DALI 기반의 설계 관행이 있다(유럽 상업·하이엔드 주택). 국내 일반 주거엔 그게 없다. "오늘 입선한대" 하면 쪽대본 도면 들고 전기 사장님께 부랴부랴 설명했고, 호환 여부를 몰라 일단 사서 꽂아봤다. 그 시행착오를 정리해서 드린다.

===

<video class="full" muted autoplay loop playsinline poster="assets/video/opening-scenes.jpg"><source src="assets/video/opening-scenes.mp4"></video>

Note: 그 결과물부터 먼저 보여드리는 게 빠르겠습니다. opening-scenes.mp4 = 거실 씬 스위치 전환 + 아이패드 제어 (한 테이크). 계단 센서는 1막에서 별도 클립으로 다룬다.

===

## 방금 화면에서 보신 것

1. 조명이 **스르륵** 켜지고 꺼진다 — 페이드 인/아웃
2. 수십 개가 **동시에** 움직인다 — 그룹 제어
3. 모션센서가 조명 밝기를 **2단계**로 제어한다
4. 벽 스위치, 모션센서, 태블릿PC, 음성 등 — **제어 지점이 하나가 아니다**

Note: 이 네 가지가 오늘 이야기 전체의 복선이다. 뒤에서 하나씩 다시 만난다.


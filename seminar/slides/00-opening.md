<!-- .slide: class="title" data-background-color="#0a0c10" -->
<div class="over">한국패시브건축협회 세미나</div>

# 주거 <strong>조명제어</strong>의 실제

<div class="meta">설계 · 시공 · 운영</div>
<div class="meta" style="margin-top:.6em;color:#98a1b5">김원식 — 건축주 / 소프트웨어 엔지니어</div>

Note: 인사 두 문장. 외국계 IT에서 20년, 지금은 해외 업체 CTO. 그리고 인증주택을 지은 건축주. 이어서: 해외와 달리 국내 주거 시공에는 스마트홈 조명의 표준 도면이나 관행이 아직 없다 — 유럽은 KNX(건물 자동화)·DALI(조명 제어) 기반 설계 관행이 상업·하이엔드 주거에 자리 잡은 지 오래. "오늘 입선한대" 하면 쪽대본 도면 들고 전기 사장님께 부랴부랴 설명했고, 호환 여부를 몰라 일단 사서 꽂아봤다. 오늘 내용은 집을 지으며 직접 겪은 그 시행착오의 정리다. 그 결과물부터 먼저 보여드리겠다 → 영상.

===

<video class="full" muted autoplay loop playsinline poster="assets/video/opening-scenes.jpg"><source src="assets/video/opening-scenes.mp4"></video>

Note: 그 결과물부터 먼저 보여드리는 게 빠르겠습니다. opening-scenes.mp4 = 거실 씬 스위치로 취침·파티·영화 모드 전환, 수십 개 조명이 한 번에 바뀌고 취침 모드엔 블라인드까지 내려온다 (44초). 계단 센서 클립(stairs-sensor.mp4, 59초)은 Q&A용으로 준비돼 있다.

===

## 방금 화면에서 보신 것

1. 조명이 **스르륵** 켜지고 꺼진다 — 페이드 인/아웃
2. 수십 개가 **동시에, 각자 정해진 밝기로** 움직인다 — 그룹·씬 제어
3. 모션센서가 조명 밝기를 **2단계**로 제어한다
4. 벽 스위치, 모션센서, 태블릿PC, 음성 등 — **제어 지점이 하나가 아니다**

Note: 이 네 가지가 오늘 이야기 전체의 복선이다. 뒤에서 하나씩 다시 만난다. (그룹과 씬 구분: 그룹은 묶어서 같은 명령을 한 번에, 씬은 조명마다 각자 다른 값을 저장해둔 조합을 한 번에 — 영상에서 본 건 씬이다.)



===

## 제어 지점 — 태블릿PC, 음성, 벽 스위치

<video class="full" muted autoplay loop playsinline poster="assets/video/controls.jpg" style="max-height:560px"><source src="assets/video/controls.mp4"></video>

Note: 벽에 붙은 태블릿PC, 시리, 그리고 도서관의 벽 스위치 — 꾹 누르면 가구 조명이 디밍된다. 같은 조명을 여러 지점에서 제어한다는 게 네 번째 복선. (controls.mp4 = 0008 + 0009 + 0010 이어붙임, 64초 — 발표 때는 앞부분만 보여주고 넘어가도 된다.)
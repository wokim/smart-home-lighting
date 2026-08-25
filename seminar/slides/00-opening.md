<!-- .slide: class="title" data-background-color="#0a0c10" -->
<div class="over">한국패시브건축협회 세미나</div>

# 주거 <strong>조명제어</strong>의 실제와 실무

<div class="meta">설계 · 시공 · 운영</div>
<div class="meta" style="margin-top:.6em;color:#98a1b5">김원식 — 건축주 / 소프트웨어 엔지니어</div>

Note: 인사 두 문장. 외국계 IT에서 20년, 지금은 해외 업체 CTO. 그리고 인증주택을 지은 건축주. 이어서: 해외와 달리 국내 주거 시공에는 스마트홈 조명의 표준 도면이나 관행이 아직 없다 — 유럽은 KNX(건물 자동화)·DALI(조명 제어) 기반 설계 관행이 상업·하이엔드 주거에 자리 잡은 지 오래. "오늘 입선한대" 하면 쪽대본 도면 들고 전기 사장님께 부랴부랴 설명했고, 호환 여부를 몰라 일단 사서 꽂아봤다. 오늘 내용은 집을 지으며 직접 겪은 그 시행착오의 정리다. 그 결과물부터 먼저 보여드리겠다 → 영상.

===

## 벽의 씬 스위치로 모드 전환

<video class="full" controls muted autoplay loop playsinline poster="assets/video/opening-scenes.jpg" style="max-height:470px"><source src="assets/video/opening-scenes.mp4"></video>

<p class="muted" style="font-size:.6em;margin-top:.4em">벽의 씬 스위치 하나로 취침·파티·영화 모드 전환. 수십 개의 조명이 각자 정해진 밝기로 스르륵 바뀌고, 취침 모드에는 블라인드까지 내려감</p>

Note: 말로 설명하는 것보다 저희 집을 먼저 보여드리는 게 빠르겠습니다. 여기서 볼 것 — 버튼 하나, 수십 개가 동시에, 각자 다른 밝기로, 부드럽게. 조명이 블라인드와 같은 플랫폼에 있으니 한 버튼에 같이 걸린다.

===

## 계단 모션센서, 2단계 점등

<video class="full" controls muted autoplay loop playsinline poster="assets/video/stairs-sensor.jpg" style="max-height:470px"><source src="assets/video/stairs-sensor.mp4"></video>

<p class="muted" style="font-size:.6em;margin-top:.4em">올라가면 켜지고, 잠시 후 살짝 어두워졌다가 꺼짐. 다시 움직이면 원래 밝기로</p>

Note: 2단계 밝기. 켜짐 → 감광 → 소등. 귀찮음이 사라지는 예이자, 센서 로직도 설정의 일부라는 복선.

===

## 태블릿 PC로 제어

<div class="vpair"><video class="full" controls muted autoplay loop playsinline poster="assets/video/ipad-wide.jpg"><source src="assets/video/ipad-wide.mp4"></video><video class="full" controls muted autoplay loop playsinline poster="assets/video/ipad-close.jpg"><source src="assets/video/ipad-close.mp4"></video></div>

<p class="muted" style="font-size:.6em;margin-top:.4em">벽에 붙여둔 태블릿 PC에서도 같은 조명을 제어. 앱을 따로 깔 것 없이 집 안 어디서나</p>

Note: 제어 지점이 하나가 아니라는 첫 번째 예. 폰을 꺼내는 게 아니라 벽에 붙은 화면.

===

## 음성으로 제어

<video class="full" controls muted autoplay loop playsinline poster="assets/video/siri.jpg" style="max-height:470px"><source src="assets/video/siri.mp4"></video>

<p class="muted" style="font-size:.6em;margin-top:.4em">Siri로 음성 제어. 집의 스마트홈 허브가 Apple Home과 연동돼 있으면 별도 설정 없이 가능</p>

Note: 두 번째 예. 3막 플랫폼 슬라이드에서 "그 위에 휴대폰과 음성"으로 다시 만난다.

===

## 벽 스위치로 가구 조명 제어

<video class="full" controls muted autoplay loop playsinline poster="assets/video/library.jpg" style="max-height:470px"><source src="assets/video/library.mp4"></video>

<p class="muted" style="font-size:.6em;margin-top:.4em">도서관 가구에 설치된 조명을 벽 스위치로. 꾹 누르고 있으면 디밍. 가구 발주 전에 배선이 잡혀 있어야 가능</p>

Note: 세 번째 예. 벽 스위치로 가구 조명을 제어하려면 전기공사 때 선이 가 있어야 한다는 4막 복선.

===

## 정리하면

1. 조명이 **스르륵** 켜지고 꺼진다 (페이드 인/아웃)
2. 수십 개가 **동시에, 각자 정해진 밝기로** 움직인다 (그룹·씬 제어)
3. 모션센서가 조명 밝기를 **2단계**로 제어한다
4. 벽 스위치, 태블릿 PC, 음성 등 **제어 지점이 하나가 아니다**
5. 이러한 동작의 정의는 **벽을 뜯지 않고** 바꿀 수 있다 (설정)

Note: 영상 다섯 개를 한 장으로 묶는다. 이 네 가지가 오늘 이야기 전체의 복선이다. 뒤에서 하나씩 다시 만난다. (그룹과 씬 구분: 그룹은 묶어서 같은 명령을 한 번에, 씬은 조명마다 각자 다른 값을 저장해둔 조합을 한 번에 — 영상에서 본 건 씬이다.)


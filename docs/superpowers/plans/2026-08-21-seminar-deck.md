# 조명제어 세미나 reveal.js 덱 구현 계획

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 한국패시브건축협회 세미나용 오프라인 동작 reveal.js 발표 덱(5막 + 부록, 37~47장)과 체크리스트 유인물을 만든다.

**Architecture:** reveal.js를 저장소 안에 vendor하고, 막별 마크다운 파일을 외부 로드하는 단일 `index.html`. 다이어그램은 토큰 색상을 공유하는 SVG 파일. 영상은 Git LFS로 관리하고 poster 스틸로 폴백. 로컬 HTTP 서버로 발표·검증한다 (`file://`은 마크다운 fetch가 막히므로 불가).

**Tech Stack:** reveal.js 5.x (vendored), Pretendard Variable (vendored), 순수 CSS 테마, Python http.server, Git LFS.

**스펙:** `docs/superpowers/specs/2026-08-19-lighting-control-seminar-design.md` — 모든 내용 판단의 원본. 충돌 시 스펙이 이긴다.

## Global Constraints

- **오프라인 동작**: `seminar/` 안에서 외부 URL 로드 금지. CDN·웹폰트·외부 이미지 없음
- **범위**: 스마트홈 연동을 고려한 조명 제어. 조명 밖 주제는 "그건 다음 기회에"
- **영업 금지**: 자사 제품·서비스 소개 없음. AI 여담은 4막 한 줄 + 부록 1장뿐
- **제품명**: 구조 설명에 필요할 때만 (Tridonic·Helvar·eldoLED 등). 국내 제품명 금지
- **색온도 전환을 대표 기능처럼 내세우지 않는다**
- **sources/의 제3자 사진·글 사용 금지** (동의 전까지)
- 다이어그램은 SVG, 사진은 직접 촬영분만, 영상은 Git LFS
- 슬라이드 텍스트는 최소, 말은 speaker note(`Note:`)에
- 한국어 카피는 마지막에 humanizer/grammar/style 패스를 통과해야 함

## 파일 구조

    seminar/
      index.html              진입점. 막별 md를 외부 로드
      theme.css               디자인 토큰 + 커스텀 테마
      serve.sh                로컬 서버 실행
      slides/
        00-opening.md         0막
        10-gap.md             1막
        20-why-now.md         2막
        30-structure.md       3막
        40-process.md         4막
        50-checklist.md       5막
        90-appendix.md        부록 (Q&A 예비)
      assets/
        diagrams/*.svg        다이어그램 7종
        photos/               직접 촬영 사진 (사용자 제공 대기)
        video/                mp4 (LFS) + poster jpg
      vendor/reveal/          reveal.js dist + plugin
      vendor/fonts/           PretendardVariable.woff2
      notes.md                진행표 (막별 시간 배분표)
    docs/
      checklist.md            유인물 원본

---

### Task 1: 스캐폴드 + reveal.js vendor + 스모크 슬라이드

**Files:**
- Create: `seminar/index.html`, `seminar/serve.sh`, `seminar/slides/00-opening.md`(스모크용 1장), `seminar/vendor/reveal/**`

**Interfaces:**
- Produces: `serve.sh` (포트 8080, 저장소 루트 서빙), `index.html`의 md 로드 규약: `<section data-markdown="slides/XX.md" data-separator="^\n===\n$">`, speaker note는 `Note:` 줄부터

- [ ] **Step 1: reveal.js 다운로드·vendor**

```bash
cd seminar
curl -fsSL https://github.com/hakimel/reveal.js/archive/refs/tags/5.1.0.tar.gz -o /tmp/reveal.tgz
mkdir -p vendor/reveal && tar -xzf /tmp/reveal.tgz -C /tmp
cp -r /tmp/reveal.js-5.1.0/dist vendor/reveal/dist
cp -r /tmp/reveal.js-5.1.0/plugin vendor/reveal/plugin
cp /tmp/reveal.js-5.1.0/LICENSE vendor/reveal/LICENSE
```

5.1.0이 404면 `git ls-remote --tags https://github.com/hakimel/reveal.js`로 최신 5.x 태그를 골라 같은 방식으로 받는다.

- [ ] **Step 2: index.html 작성**

```html
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>조명제어 — 사다 다는 제품이 아니라 설계입니다</title>
  <link rel="stylesheet" href="vendor/reveal/dist/reveal.css">
  <link rel="stylesheet" href="theme.css">
</head>
<body>
  <div class="reveal">
    <div class="slides">
      <section data-markdown="slides/00-opening.md" data-separator="^\n===\n$"></section>
      <section data-markdown="slides/10-gap.md" data-separator="^\n===\n$"></section>
      <section data-markdown="slides/20-why-now.md" data-separator="^\n===\n$"></section>
      <section data-markdown="slides/30-structure.md" data-separator="^\n===\n$"></section>
      <section data-markdown="slides/40-process.md" data-separator="^\n===\n$"></section>
      <section data-markdown="slides/50-checklist.md" data-separator="^\n===\n$"></section>
      <section data-markdown="slides/90-appendix.md" data-separator="^\n===\n$"></section>
    </div>
  </div>
  <script src="vendor/reveal/dist/reveal.js"></script>
  <script src="vendor/reveal/plugin/markdown/markdown.js"></script>
  <script src="vendor/reveal/plugin/notes/notes.js"></script>
  <script>
    Reveal.initialize({
      hash: true, transition: 'fade', transitionSpeed: 'slow',
      width: 1280, height: 720, margin: 0.06,
      plugins: [ RevealMarkdown, RevealNotes ]
    });
  </script>
</body>
</html>
```

구분자는 `===` 단독 줄이다 (md 내용의 `---` 수평선과 충돌 방지). Task 1 시점에는 아직 없는 md 6개(10~90)의 `<section>` 줄을 주석 처리해 두고, 각 Task에서 해제한다.

- [ ] **Step 3: 스모크 슬라이드 + serve.sh**

`seminar/slides/00-opening.md`:

```markdown
# 스모크 테스트

renders OK

Note: speaker note 확인용
```

`seminar/serve.sh`:

```bash
#!/usr/bin/env bash
cd "$(dirname "$0")/.." && exec python3 -m http.server "${1:-8080}"
```

```bash
chmod +x seminar/serve.sh
```

- [ ] **Step 4: 검증**

```bash
seminar/serve.sh 8080 & sleep 1
curl -sf http://localhost:8080/seminar/ | grep -q reveal && echo HTML_OK
curl -sf http://localhost:8080/seminar/vendor/reveal/dist/reveal.js >/dev/null && echo JS_OK
curl -sf http://localhost:8080/seminar/slides/00-opening.md | grep -q 스모크 && echo MD_OK
kill %1
```

Expected: HTML_OK, JS_OK, MD_OK. 그리고 브라우저에서 http://localhost:8080/seminar/ 열어 슬라이드 렌더와 `S`(speaker view) 확인.

- [ ] **Step 5: 오프라인 가드 검증**

```bash
grep -nE 'https?://' seminar/index.html && echo FAIL || echo OFFLINE_OK
```

Expected: OFFLINE_OK

- [ ] **Step 6: 커밋**

```bash
git add seminar && git commit -m "Scaffold reveal.js deck with vendored dist and smoke slide"
```

---

### Task 2: 테마 (디자인 토큰 + Pretendard)

**Files:**
- Create: `seminar/theme.css`, `seminar/vendor/fonts/PretendardVariable.woff2`

**Interfaces:**
- Produces (이후 모든 슬라이드 태스크가 쓰는 규약):
  - CSS 토큰: `--bg #101319`, `--surface #1a1e27`, `--text #e9ecf2`, `--muted #98a1b3`, `--amber #ffb454`(조명·강조), `--blue #58b7ff`(제어·기술), `--red #ff6b6b`(경고·나쁜 예), `--green #7dd97b`(좋은 예)
  - 클래스: `.act` (막 전환 표지: 큰 번호+제목), `.statement` (한 문장 슬라이드), `.cols2` (2단 그리드), `.bad`/`.good` (대비 카드), `.src` (출처 캡션, muted 60%)
  - 영상 슬라이드 규약: md 안 raw HTML `<video class="full" muted autoplay loop playsinline poster="assets/video/X.jpg"><source src="assets/video/X.mp4"></video>`

- [ ] **Step 1: Pretendard vendor**

```bash
curl -fsSL "https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/woff2/PretendardVariable.woff2" -o seminar/vendor/fonts/PretendardVariable.woff2
ls -la seminar/vendor/fonts/   # ~2MB 확인
```

- [ ] **Step 2: theme.css 작성**

```css
@font-face {
  font-family: 'Pretendard';
  src: url('vendor/fonts/PretendardVariable.woff2') format('woff2-variations');
  font-weight: 45 920; font-display: swap;
}
:root {
  --bg:#101319; --surface:#1a1e27; --text:#e9ecf2; --muted:#98a1b3;
  --amber:#ffb454; --blue:#58b7ff; --red:#ff6b6b; --green:#7dd97b;
  --r-background-color:var(--bg); --r-main-color:var(--text);
  --r-heading-color:var(--text); --r-link-color:var(--blue);
  --r-main-font:'Pretendard','Apple SD Gothic Neo',sans-serif;
  --r-heading-font:'Pretendard','Apple SD Gothic Neo',sans-serif;
  --r-main-font-size:34px;
}
.reveal { font-weight:450; letter-spacing:-0.01em; }
.reveal h1 { font-size:1.9em; font-weight:800; }
.reveal h2 { font-size:1.4em; font-weight:700; }
.reveal h3 { font-size:1.1em; font-weight:700; color:var(--amber); }
.reveal .slides section { text-align:left; }
.reveal ul { margin-left:0.2em; } .reveal li { margin:0.35em 0; }
.reveal strong { color:var(--amber); font-weight:700; }
.reveal blockquote { background:var(--surface); border-left:4px solid var(--amber);
  padding:0.5em 0.8em; font-style:normal; width:100%; box-shadow:none; }
section.act { text-align:center; }
section.act .no { font-size:5em; font-weight:900; color:var(--amber); opacity:.9; line-height:1; }
section.act h2 { font-size:2em; margin-top:.2em; }
.statement { display:flex; align-items:center; justify-content:center; min-height:12em; }
.statement p { font-size:1.6em; font-weight:700; text-align:center; line-height:1.5; }
.cols2 { display:grid; grid-template-columns:1fr 1fr; gap:1em; }
.bad,.good { background:var(--surface); border-radius:12px; padding:.7em .9em; }
.bad { border-top:4px solid var(--red); } .good { border-top:4px solid var(--green); }
.src { font-size:.55em; color:var(--muted); position:absolute; bottom:-1.5em; }
video.full { width:100%; max-height:620px; border-radius:10px; background:#000; }
img.diagram { width:100%; max-height:600px; object-fit:contain; }
```

- [ ] **Step 3: 스모크 슬라이드에 테마 요소 임시 추가 후 검증**

00-opening.md에 `.statement`, `.cols2`, `.bad/.good` 샘플 블록을 잠깐 넣고 브라우저에서 폰트(Pretendard 적용 여부: 자간·ㄹ 형태로 판별)와 각 클래스 렌더 확인. 확인 후 샘플 제거.

```bash
grep -nE 'https?://' seminar/theme.css && echo FAIL || echo OFFLINE_OK
```

- [ ] **Step 4: 커밋**

```bash
git add seminar/theme.css seminar/vendor/fonts && git commit -m "Add dark theme with design tokens and vendored Pretendard"
```

---

### Task 3: 미디어 파이프라인 (Git LFS + poster 폴백)

**Files:**
- Create: `.gitattributes`, `seminar/assets/video/README.md`, poster 플레이스홀더 3장

**Interfaces:**
- Produces: 영상 파일명 규약 — `opening-scenes.mp4`(0막 오프닝), `stairs-sensor.mp4`(계단 센서), `bad-dimming.mp4`(나쁜 예, 확보 시). 같은 이름 `.jpg`가 poster
- Consumes: Task 2의 `<video class="full">` 규약

- [ ] **Step 1: LFS 설정**

```bash
git lfs install
git lfs track "seminar/assets/video/*.mp4" "seminar/assets/photos/*.jpg" "seminar/assets/photos/*.jpeg"
git add .gitattributes
```

- [ ] **Step 2: poster 플레이스홀더 생성**

영상이 오기 전까지 덱이 깨지지 않도록 1280×720 어두운 단색 + 라벨 텍스트 jpg 3장을 만든다.

```bash
python3 - <<'PY'
# Pillow 없이 순수 파이썬으로 최소 JPEG를 만들 수 없으므로 sips 활용
import subprocess, os
os.makedirs('seminar/assets/video', exist_ok=True)
# 1x1 PNG (dark) base64 → sips로 리사이즈
import base64
png = base64.b64decode(b'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==')
open('/tmp/dark.png','wb').write(png)
for name in ['opening-scenes','stairs-sensor','bad-dimming']:
    subprocess.run(['sips','-z','720','1280','/tmp/dark.png','--setProperty','format','jpeg',
                    '--out',f'seminar/assets/video/{name}.jpg'],check=True,capture_output=True)
print('ok')
PY
ls seminar/assets/video/
```

- [ ] **Step 3: 촬영 가이드 README**

`seminar/assets/video/README.md`에 스펙의 촬영 규칙(고정, AE/AWB 잠금, 손+스위치 프레임, 가로 1080p30, 파일명 규약)을 그대로 옮겨 적는다. 사용자가 폰에서 파일을 부을 때 보는 문서다.

- [ ] **Step 4: 커밋**

```bash
git add .gitattributes seminar/assets && git commit -m "Set up Git LFS and video poster placeholders with shooting guide"
```

---

### Task 4: 개념 다이어그램 4종 (SVG)

**Files:**
- Create: `seminar/assets/diagrams/three-layers.svg`, `control-map.svg`, `process-flow.svg`, `irreversibility.svg`

**Interfaces:**
- Produces: 슬라이드에서 `<img class="diagram" src="assets/diagrams/X.svg">`로 참조
- 공통 규약: `viewBox="0 0 1200 675"`, 배경 투명, 텍스트 `font-family="Pretendard, Apple SD Gothic Neo, sans-serif"`, 색은 테마 토큰 값 하드코딩(#e9ecf2 텍스트, #1a1e27 면, #ffb454 강조, #58b7ff 기술, #98a1b3 보조선)

- [ ] **Step 1: three-layers.svg — 조명의 세 겹**

가로 3단 스택. 위→아래: [제어 — "말을 잘 듣는다" / 그룹·씬·동기화·신뢰성 (#58b7ff 상단 보더)] → [드라이버 — "부드럽다" / 디밍 레인지·low-end·fade·플리커 (#ffb454)] → [광원 — "빛이 좋다" / CRI·R9·배광·눈부심 (#e9ecf2)]. 각 층 오른쪽에 층을 관통하지 못하는 화살표와 "층은 서로를 대신하지 못한다" 캡션. 스타일 예:

```svg
<svg viewBox="0 0 1200 675" xmlns="http://www.w3.org/2000/svg" font-family="Pretendard, Apple SD Gothic Neo, sans-serif">
  <g><rect x="150" y="80" width="700" height="150" rx="14" fill="#1a1e27" stroke="#58b7ff" stroke-width="3"/>
     <text x="190" y="145" fill="#e9ecf2" font-size="40" font-weight="700">제어 — "말을 잘 듣는다"</text>
     <text x="190" y="195" fill="#98a1b3" font-size="27">그룹 · 씬 · 동기화 · 명령 신뢰성 · 확장성</text></g>
  <!-- 드라이버(#ffb454), 광원(#e9ecf2) 동일 패턴으로 y=255, y=430 -->
</svg>
```

- [ ] **Step 2: control-map.svg — 제어 방식 지도**

왼쪽→오른쪽 스펙트럼 축: "지금 정해야 한다(유선) ←→ 나중에도 된다(무선)". 노드 6개: 접점 스위치 / 스마트 스위치(중성선!) / 인너 릴레이 / 0-10V / DALI / Zigbee·Matter. 유선군은 #ffb454 계열 테두리, 무선군은 #58b7ff. 각 노드 아래 한 줄 특성.

- [ ] **Step 3: process-flow.svg — 절차 6단계**

설계 → 조명 제어 도면 → 제품 선정 → 시공 → 설정 → 피드백 루프. 마지막 노드에서 "설정"으로 되돌아가는 곡선 화살표(#ffb454, 점선)로 루프 표현. "피드백 루프" 노드만 rx 크게(살아 있는 문서 느낌), 아래 캡션 "도면은 고정되고, 시나리오는 계속 바뀐다".

- [ ] **Step 4: irreversibility.svg — 비가역성의 축**

좌우 2패널. 왼쪽(#ff6b6b 보더) "지금뿐": 중성선 / 제어선 / 제어함 직결 배선 / 분전함 자리 / 가구 조명 배선. 오른쪽(#7dd97b) "나중에도": 스위치 / 센서 / 허브 / 플랫폼 / 씬 설정. 가운데 세로 점선 = 콘크리트 타설선 느낌의 라벨 "벽이 닫히는 순간".

- [ ] **Step 5: 검증 + 커밋**

```bash
for f in seminar/assets/diagrams/*.svg; do xmllint --noout "$f" && echo "OK $f"; done
grep -l 'http' seminar/assets/diagrams/*.svg && echo FAIL || echo OFFLINE_OK
```

브라우저로 각 SVG 직접 열어 텍스트 겹침·폰트 확인 후:

```bash
git add seminar/assets/diagrams && git commit -m "Add four concept diagrams as SVG"
```

---

### Task 5: 배선도 3종 (SVG)

**Files:**
- Create: `seminar/assets/diagrams/switchbox-neutral.svg`, `dali-bus.svg`, `dc24v-cct.svg`

**Interfaces:**
- Produces: Task 4와 동일 참조 규약. 전기 기호는 단순화하되 틀리면 안 됨 — L(활선) 갈색/#c8824a, N(중성선) 파랑/#58b7ff, 제어선 보라/#b48cff, DC +/- 빨강·검정 계열. 선 라벨 필수

- [ ] **Step 1: switchbox-neutral.svg — 3막의 핵심 한 장**

좌우 대비. 왼쪽 "중성선 없는 박스(국내 다수)": 분전반→등기구로 L·N이 가고, 스위치 박스에는 L과 등으로 가는 연락선뿐. 스마트 스위치 그림에 ✕ 와 "상시 전원을 만들 수 없다". 오른쪽 "중성선 있는 박스": L·N이 모두 스위치 박스 경유, 스마트 스위치 ✓ "전자회로가 늘 깨어 있다". 하단 캡션: "전기공사 때 N 한 가닥 — 나중엔 벽을 뜯어야 한다".

- [ ] **Step 2: dali-bus.svg**

분전함(DALI PSU + 마스터) → 버스 2가닥(#b48cff, 극성 무관 표기)이 드라이버 4개에 데이지체인. 각 드라이버에서 등기구로. 별도로 L·N 전원선이 각 드라이버에 도달하는 것도 표기(전원≠버스 구분이 핵심). 캡션: "한 라인 64주소 · 16그룹 · 16씬".

- [ ] **Step 3: dc24v-cct.svg**

AC 220V → SMPS → (DC 24V) → CCT 드라이버/컨트롤러 → 등기구로 3가닥 [V+ / Warm / Cold] 라벨. 거리 화살표와 "24V는 거리가 길수록 전압강하 — 드라이버는 부하 근처에" 캡션.

- [ ] **Step 4: 검증 + 커밋**

Task 4 Step 5와 동일 검증. 추가로: 배선도 3종은 사용자(전기 지식 보유) 눈으로 확인받는 체크포인트를 태스크 리뷰에 명시.

```bash
git add seminar/assets/diagrams && git commit -m "Add three wiring diagrams as SVG"
```

---

### Task 6: 0막 + 1막 슬라이드

**Files:**
- Create(덮어쓰기): `seminar/slides/00-opening.md`, Create: `seminar/slides/10-gap.md`
- Modify: `seminar/index.html` (10-gap 섹션 주석 해제)

**Interfaces:**
- Consumes: Task 2 클래스 규약, Task 3 영상 규약

- [ ] **Step 1: 00-opening.md 작성 (4장)**

```markdown
<!-- .slide: class="statement" data-background-color="#0a0c10" -->
# 조명제어,<br>사다 다는 제품이 아니라 설계입니다

한국패시브건축협회 세미나 · 김원식

Note: 인사 두 문장. 외국계 IT에서 20년, 지금은 해외 업체 CTO. 그리고 인증주택을 지은 건축주. 오늘은 그 두 입장이 겹치는 자리에서 말씀드린다.

===

<video class="full" muted autoplay loop playsinline poster="assets/video/opening-scenes.jpg"><source src="assets/video/opening-scenes.mp4"></video>

Note: 말로 설명하는 것보다 저희 집을 먼저 보여드리는 게 빠르겠습니다. (영상: 씬 스위치 → 취침/파티 전환, 계단 센서 2단계, 아이패드 제어)

===

## 방금 화면에서 보신 것

1. 조명이 **스르륵** 켜지고 꺼진다 — fade
2. 수십 개가 **동시에** 움직인다 — 그룹
3. 센서가 **2단계 밝기**로 제어한다
4. 벽 스위치 · 센서 · 아이패드 · 음성 — **제어 지점이 하나가 아니다**

Note: 이 네 가지가 오늘 이야기 전체의 복선이다. 뒤에서 하나씩 다시 만난다.

===

<!-- .slide: class="statement" -->
> 도면도 없고, 물어볼 곳도 없어서<br>**전부 몸으로 배웠습니다**

Note: 스마트홈은 아직 보편적이지 않고 도면이라는 것도 없다. "오늘 입선한대" 하면 쪽대본 도면 들고 전기 사장님께 부랴부랴 설명했고, 호환 여부를 몰라 일단 사서 꽂아봤다. 그 시행착오를 오늘 정리해서 드린다.
```

- [ ] **Step 2: 10-gap.md 작성 (7장)**

```markdown
<!-- .slide: class="act" -->
<div class="no">1</div>

## 간극

===

## "이런 거 되나요?" 하고 물으면

- "잘 모르겠는데요"
- "그거 막상 잘 안 쓴대요"
- "제품 사다 달면 되는 거 아닌가요?"

Note: 건축주가 IoT 얘기를 꺼냈을 때 시공 현장에서 실제로 돌아오는 세 가지 반응. 오늘 이 세 문장을 뒤집는 게 목표다.

===

<!-- .slide: class="statement" -->
> 건축주가 원한 건<br>**스마트폰으로 껐다 켰다가 아닙니다**

Note: 오히려 앱은 최후의 수단이다. 폰 꺼내서 앱 찾아 들어가는 게 벽 스위치보다 편할 리 없다.

===

## 실제 니즈는 이렇게 생겼습니다

- 벽 버튼 **하나** → 예닐곱 개 조명이 **각자 정해진 밝기**로, 부드럽게
- 그걸 벽에서도, 센서로도, 태블릿으로도, 목소리로도

Note: 니즈는 구체적이고 복합적이다. 0막 영상의 네 가지가 바로 이것.

===

## 경험해보기 전엔 필요한 줄 모르는 것

**밝기 조절**

- 아기를 재울 때
- 밤에 화장실 갈 때
- 스르륵 켜지고 스르륵 꺼질 때

Note: 이건 써본 사람만 안다. 그래서 건축주 요구사항에 잘 안 올라오고, 준공 후에야 아쉬워진다.

===

## 반전 하나

색온도보다 **밝기**입니다

- 낮에는 태양이 이깁니다 — 색온도 차이가 잘 안 느껴진다
- 밤에는 높은 색온도를 쓸 일이 없다

Note: 다들 CCT(색온도 가변)가 핵심인 줄 아는데, 살아보니 체감 가치의 대부분은 디밍이었다. 이 관점은 뒤 기구 선정에서 다시.

===

<!-- .slide: class="statement" -->
> 온도·습도·공기질은 이미 챙기십니다.<br>**빛도 실내 쾌적성의 축입니다**

Note: 이 자리에 걸치는 유일한 한 줄. 길게 안 간다. 다음 막 — 왜 이게 지금 와서 필요해졌는가.
```

- [ ] **Step 3: index.html 주석 해제 + 검증**

서버 띄우고 브라우저에서 0~1막 전체 넘겨보며 렌더·speaker note 확인.

```bash
grep -c '^===$' seminar/slides/00-opening.md   # 3
grep -c '^===$' seminar/slides/10-gap.md       # 6
```

- [ ] **Step 4: 커밋**

```bash
git add seminar && git commit -m "Add act 0 and act 1 slides"
```

---

### Task 7: 2막 + 3막 슬라이드

**Files:**
- Create: `seminar/slides/20-why-now.md`, `seminar/slides/30-structure.md`
- Modify: `seminar/index.html` (주석 해제)

**Interfaces:**
- Consumes: Task 4·5 다이어그램 7종 전부

- [ ] **Step 1: 20-why-now.md (5장)**

슬라이드 구성 (스펙 2막 그대로):
1. 막 표지 `2 / 왜 지금 와서 필요해졌나`
2. "로스트 테크놀로지" — 백열등+로터리 조광기: 조광기 하나면 됐다 (전압↓ → 자연 감광 / 플리커·잔광 없음 / 어두울수록 따뜻한 색은 덤 / 호환성 문제 없음). Note: "기본이었다"가 아니라 "수월했다"
3. "LED에서 어려워진 이유" — 드라이버라는 중간 장치, 디밍 방식 파편화, 조합에 따라 되다 안 되다. `.cols2`로 백열등 시절과 대비
4. "조명이 많아졌다" — 하나둘 → 다운라이트·간접·펜던트·무드가 한 공간에. 개수가 늘면 "어떤 조합으로 켤 것인가"라는 질문이 생긴다 = 씬
5. statement: "**씬은 제품이 아니라 설계입니다**"

- [ ] **Step 2: 30-structure.md (15장)**

1. 막 표지 `3 / 알아야 할 구조`
2. `three-layers.svg` — 조명은 세 겹. Note: 층은 서로를 대신 못 한다
3. 광원 층 — CRI·R9·배광·눈부심 (짧게, 표 아닌 불릿 4개)
4. 드라이버 층 — 디밍 레인지·low-end·fade·플리커. `.cols2`에 좋은/나쁜 디밍 커브 묘사, 나쁜 예 poster(`bad-dimming.jpg`) 자리
5. statement 오해 정리: "'DALI를 쓰면 빛이 좋아진다'는 **틀린 말입니다**" Note: DALI/Zigbee는 명령 전달 층. 빛은 드라이버가 만든다. 싸구려 DALI < 좋은 Zigbee 가능. DALI의 진짜 강점은 제어 표준화. Tridonic·Helvar·eldoLED 같은 상급 드라이버가 DALI 현장에 많아서 생기는 상관관계일 뿐
6. `control-map.svg` — 제어 방식 지도 전체 조망
7. 접점 스위치 — fade out이 원리적으로 안 되는 이유 (전원을 끊으면 어두워질 에너지가 없다)
7b. 일괄소등 스위치 — `.cols2` 대비: [아날로그: 모든 등의 전원을 물리 차단 → 스마트 기기도 통째로 오프라인] vs [스마트: "전체 소등" 씬에 매핑된 버튼 하나 → "일괄소등이 꺼져 있어 불이 안 들어온다"는 상황 자체가 없다]. Note: 전원을 끊는 제어에서 명령을 보내는 제어로의 전환을 가장 친숙한 스위치로 설명. 함정: 기존 일괄소등 릴레이를 물리 차단으로 남기면 상시 전원이 끊긴다 — 체크리스트로 연결
8. `switchbox-neutral.svg` — **중성선**. Note: 이 발표의 실무 최대 이슈. 전기공사 때 N 한 가닥이면 끝날 일이 나중엔 벽 철거
9. 인너 릴레이 — 사진 자리(`photos/inner-relay.jpg` 플레이스홀더), 스위치 뒤에 숨는 크기감
10. `dali-bus.svg` — 유선 제어. 미리 포설해야 하고, 대신 안정·표준
11. `dc24v-cct.svg` — DC 24V 계열. 드라이버는 부하 근처 원칙 예고
12. Zigbee·Matter — 나중에도 된다, 대신 RF·메시·전파 환경이라는 다른 값
13. 플랫폼 — 앱 파편화 / 벤더 종속(자사 허브·해외 서버) / Matter가 푸는 것과 못 푸는 것 / HA 같은 범용 허브는 통합자 역할을 떠안는 대가. Note: 조명만 따로 못 논다 — 센서·냉난방과 같은 플랫폼이어야 씬이 성립
14. `irreversibility.svg` — 비가역성의 축. Note: 3막 전체의 착지. "벽이 닫히는 순간" 전에 정할 것

- [ ] **Step 3: 검증 + 커밋**

브라우저 전수 확인 (다이어그램 가독성 포함).

```bash
git add seminar && git commit -m "Add act 2 and act 3 slides"
```

---

### Task 8: 4막 + 5막 + 부록 슬라이드

**Files:**
- Create: `seminar/slides/40-process.md`, `50-checklist.md`, `90-appendix.md`
- Modify: `seminar/index.html` (주석 해제 완료)

- [ ] **Step 1: 40-process.md (9장)**

1. 막 표지 `4 / 절차`
2. `process-flow.svg` — 6단계 + 루프
3. "문서는 사실 두 개입니다" `.cols2` — [도면: 물리, 시공이 끝나면 고정] vs [시나리오: "취침 모드엔 이 조명 10%", 살아 있는 문서]. Note: 전기 도면엔 씬·시나리오가 없다. 고객이 최종으로 얻는 경험이 정의된 곳이 없다는 것
4. 조명 제어 도면 실물 (`photos/control-drawing.jpg` 자리) — 전기 도면에 없는 정보: 그룹, 스위치·센서 매핑, 제어선 집결
5. "제품 선정이 시공보다 먼저" — 호환성 + 상세 결선도가 시공자 손에 있어야
6. "시공의 주체가 애매하다" — 전기가 조명 달다 디밍 드라이버 결선? / 빌트인 가구 조명(벽 스위치 제어형)은 가구 발주 전에 배선 확정. 미리 갈라두지 않으면 서로 미룬다
7. "분전함 계획 + 배치 원칙" — **드라이버는 부하를 따라가고, 제어는 한 점에 모인다**. CC는 타공이 점검구(1:1), CV는 전압강하 때문에 부하 근처, 집중+팬은 자기모순, 복층은 층별. 분전함에 모이는 건 제어(DALI 마스터·PSU·컨트롤러)
8. "설정 — 설치가 끝이 아닙니다" — 그룹, 씬, 센서 로직(감지 시 몇 %를 얼마 동안)
9. "피드백 루프" — "취침 모드 이 조명 더 어둡게", "센서 유지 시간이 짧다", "이 버튼엔 다른 씬을". 준공 시점 설정은 초안. Note 마지막 여담 한 줄: 이 응대를 매번 사람이 받는 건 지속 불가능해서, 건축주가 공급자가 아니라 AI에게 말해 직접 씬을 고치는 구조를 실험 중이다 — 여기서 끊는다

- [ ] **Step 2: 50-checklist.md (6장)**

1. 막 표지 `5 / 체크리스트`
2. 설계 단계 — 공간별 씬·시나리오 초안 / 조명 그룹 구분 / 제어 방식 결정(유선이면 지금) / 플랫폼 방향
3. 전기공사 전 — **중성선** / 제어선 규격·3C / 제어함 직결 배선 / 분전함 위치·발열 / 여장 1m / 빌트인 가구 조명 배선
4. 기구 선정 — 디밍 레인지·low-end / 플리커 / 드라이버-제어 호환 / 결선도 확보
5. 준공 후 — 설정은 초안 / 피드백 루프 계약·기대치 / 건축주가 직접 만질 수 있는가
6. 클로징 statement: "조명제어는 사다 다는 제품이 아니라 **설계**입니다.<br>그리고 그 설계에는 **되돌릴 수 없는 시점**이 있습니다" + 연락처. Note: 유인물 안내

- [ ] **Step 3: 90-appendix.md (3장)**

1. `부록` 표지 (Q&A에서만 진입)
2. AI 씬 수정 예비 슬라이드 — 건축주 요청 문장 → 시스템이 flow 수정 → 이력 관리, 3단 그림 한 장. 제품명 없이 구조만
3. 참고: DALI 한 라인 64주소·16그룹·16씬 / failure domain 관점 DALI vs Zigbee 한 장

- [ ] **Step 4: 전체 렌더 검증 + 커밋**

슬라이드 총수 확인 (`===` 카운트 합 + 파일 수 = 48±α, 목표 37~47 + 부록 3):

```bash
total=0; for f in seminar/slides/*.md; do n=$(grep -c '^===$' "$f"); total=$((total+n+1)); done; echo $total
git add seminar && git commit -m "Add acts 4-5 and appendix slides"
```

---

### Task 9: 체크리스트 유인물

**Files:**
- Create: `docs/checklist.md`

- [ ] **Step 1: checklist.md 작성**

50-checklist.md의 4단계 항목을 확장해 A4 1~2장 분량으로. 각 항목은 체크박스 + 한 줄 설명 + "누구와 정하나"(건축주/전기/가구/조명) 컬럼. 5막 슬라이드와 항목이 1:1 대응해야 한다 (슬라이드가 요약, 유인물이 전체).

- [ ] **Step 2: PDF 경로 확인**

```bash
command -v pandoc && pandoc docs/checklist.md -o docs/checklist.pdf || echo "pandoc 없음 — 브라우저 인쇄로 대체(README에 명시)"
```

- [ ] **Step 3: 커밋**

```bash
git add docs/checklist.md && git commit -m "Add checklist handout"
```

---

### Task 10: 한국어 패스 + 최종 검증 (메인 세션에서 수행)

**Files:**
- Modify: `seminar/slides/*.md`, `docs/checklist.md`, Create: `seminar/notes.md`

이 태스크는 스킬 호출이 필요하므로 서브에이전트가 아니라 메인 세션에서 직접 수행한다.

- [ ] **Step 1:** `korean-skills:humanizer`로 slides/*.md와 checklist.md 전체 패스 (슬라이드 카피의 AI 흔적 제거)
- [ ] **Step 2:** `korean-skills:grammar-checker` → `korean-skills:style-guide` 순서로 패스 (경어체 통일: 슬라이드는 명사형/짧은 경어, note는 구어)
- [ ] **Step 3:** notes.md 작성 — 막별 시간 배분표(0막 5' / 1막 8' / 2막 7' / 3막 18' / 4막 10' / 5막 7' = 55'), 40분 축약 시 뺄 슬라이드 목록(3막 플랫폼 2장, 1막 반전 1장, 2막 1장)
- [ ] **Step 4: 최종 오프라인·전수 검증**

```bash
grep -rnE 'https?://' seminar --include='*.html' --include='*.css' --include='*.md' --include='*.svg' | grep -v vendor && echo FAIL || echo OFFLINE_OK
seminar/serve.sh 8080 & sleep 1
for f in $(grep -oE 'slides/[a-z0-9-]+\.md' seminar/index.html); do curl -sf "http://localhost:8080/seminar/$f" >/dev/null && echo "OK $f"; done
kill %1
```

- [ ] **Step 5:** 브라우저에서 `?print-pdf`로 PDF 출력 확인 (`http://localhost:8080/seminar/?print-pdf` → 인쇄 → PDF 저장)
- [ ] **Step 6: 커밋**

```bash
git add seminar docs && git commit -m "Korean language pass and final verification"
```

---

## 계획 밖 (사용자 액션 대기)

- 영상 촬영 (opening-scenes, stairs-sensor) → `seminar/assets/video/`에 파일명 규약대로
- 사진 촬영 (분전함 내부, 스위치 박스 속, CV/CC 드라이버, 인너 릴레이, 24V 집결부) → `photos/`
- 조명 제어 도면 원본 정리
- 나쁜 예 영상 확보 방법 결정
- 발표 시간 확정 → notes.md 배분 조정

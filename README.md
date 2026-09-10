# smart-home-lighting

주거 공간 조명제어에 대한 정리와 세미나 발표자료.

## 구성

- `seminar/` — 발표자료(슬라이드, 데모 시나리오, 발표 노트)
- `docs/` — 조명제어 방식·제품·구성 관련 정리 노트

## 발표 방법

```
seminar/serve.sh
```

브라우저에서 http://localhost:8080/seminar/ 를 연다. `S` 키로 스피커 뷰(발표 노트).
`file://`로 직접 열면 슬라이드 마크다운 로드가 막히므로 반드시 서버로 연다.

- **PDF 출력**: http://localhost:8080/seminar/?print-pdf 를 열고 브라우저 인쇄 → PDF 저장
- **유인물 인쇄**: pandoc이 없으면 `docs/checklist.md`를 브라우저/에디터에서 열어 인쇄(Cmd+P → PDF 저장)
- **영상/사진 추가**: `seminar/assets/video/README.md`의 촬영 가이드와 파일명 규약 참고

## 다른 컴퓨터에서 받을 때

영상과 사진은 Git LFS로 관리한다. **클론 전에 git-lfs를 설치해야** 한다.
설치 없이 받으면 미디어 자리에 포인터 텍스트만 내려온다.

```
brew install git-lfs && git lfs install
git clone https://github.com/wokim/smart-home-lighting.git
```

이미 클론한 뒤라면 `git lfs install && git lfs pull`로 복구한다.
GitHub의 Download ZIP은 LFS를 해석하지 않으므로 쓸 수 없다.

## 라이선스

발표 자료는 **CC BY-NC-ND 4.0**이다. 원본 그대로 보고 공유하는 것은 자유롭지만,
영리 목적 이용과 내용을 고쳐 쓰는 것은 사전 동의가 필요하다.

번들된 reveal.js(MIT), Pretendard(SIL OFL 1.1), 그리고 인용한 제품 사진은
각 저작권자의 조건을 따른다. 자세한 범위는 [LICENSE](LICENSE) 참조.

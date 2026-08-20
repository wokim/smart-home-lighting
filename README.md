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

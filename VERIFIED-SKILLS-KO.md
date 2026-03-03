# SkillsMP 검증된 스킬 가이드 (한글)

> 최종 업데이트: 2026-03-03
> 출처: [SkillsMP](https://skillsmp.com), [GitHub](https://github.com/anthropics/skills), [awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills)

## 개요

이 문서는 SkillsMP 및 주요 오픈소스 저장소에서 **검증된 스킬**만 선별하여 정리한 가이드입니다.
검증 기준: GitHub 스타 수, 관리 주체의 신뢰도, 보안 검토 여부, 커뮤니티 활성도.

---

## 1. 공식/신뢰 소스 등급

| 등급 | 소스 | 설명 |
|------|------|------|
| S (공식) | [anthropics/skills](https://github.com/anthropics/skills) | Anthropic 공식 스킬 |
| S (공식) | Claude Code 내장 | `/simplify`, `/batch` 등 번들 스킬 |
| A (기업) | [getsentry/skills](https://github.com/getsentry/skills) | Sentry 팀 개발 스킬 |
| A (기업) | [trailofbits/skills](https://github.com/trailofbits/skills) | Trail of Bits 보안 전문 스킬 |
| B (커뮤니티 검증) | [obra/superpowers](https://github.com/obra/superpowers) | 20+ 실전 검증 스킬 프레임워크 |
| B (커뮤니티 검증) | [VoltAgent/awesome-agent-skills](https://github.com/VoltAgent/awesome-agent-skills) | 380+ 커뮤니티 선별 |
| C (마켓플레이스) | [SkillsMP](https://skillsmp.com) | 283,000+ 스킬 (직접 검토 필요) |

---

## 2. 카테고리별 추천 스킬

### 보안 (Security)

| 스킬명 | 소스 | 등급 | 설명 |
|--------|------|------|------|
| `security-review` | getsentry/skills | A | OWASP 기반 체계적 보안 코드 리뷰. HIGH/MEDIUM/LOW 신뢰도 분류, 오탐 방지 |
| `differential-review` | trailofbits/skills | A | 코드 변경사항 보안 리뷰. 리스크 우선 분석, blast radius 계산 |
| `fix-review` | trailofbits/skills | A | 수정 커밋의 버그/보안 회귀 감지 |
| `agentic-actions-auditor` | trailofbits/skills | A | GitHub Actions AI 에이전트 프롬프트 인젝션 감지 |
| `fail-open-detector` | trailofbits/skills | A | 취약한 기본값, 약한 시크릿, 허용적 설정 감지 |
| `/security-review` | Claude Code 내장 | S | 내장 보안 리뷰 슬래시 커맨드 |

### 코드 리뷰 (Code Review)

| 스킬명 | 소스 | 등급 | 설명 |
|--------|------|------|------|
| `code-review` | getsentry/skills | A | Sentry 코드 리뷰 가이드라인 + 체크리스트 |
| `requesting-code-review` | obra/superpowers | B | 태스크 간 자동 활성화, 심각도별 이슈 보고 |
| `/simplify` | Claude Code 내장 | S | 코드 재사용성/품질/효율성 병렬 리뷰 후 자동 수정 |

### 테스팅 (Testing)

| 스킬명 | 소스 | 등급 | 설명 |
|--------|------|------|------|
| TDD 스킬 | obra/superpowers | B | RED/GREEN TDD. 실패 테스트 먼저 작성 → 최소 구현 |
| `property-based-testing` | trailofbits/skills | A | 직렬화/파싱/검증에 속성 기반 테스팅 적용 |
| `fuzzing-harness` | trailofbits/skills | A | 커버리지 극대화 퍼징 하네스 작성 |

### 디버깅 (Debugging)

| 스킬명 | 소스 | 등급 | 설명 |
|--------|------|------|------|
| `systematic-debugging` | obra/superpowers | B | 4단계 근본원인 분석: 추적 → 심층방어 → 조건부대기 → 검증 |
| `find-bugs` | getsentry/skills | A | 브랜치 변경사항 버그 및 보안 취약점 탐지 |

### Git 워크플로우

| 스킬명 | 소스 | 등급 | 설명 |
|--------|------|------|------|
| `commit` | getsentry/skills | A | Sentry 커밋 메시지 규칙 |
| `create-pr` | getsentry/skills | A | Sentry PR 생성 규칙 |
| `finishing-a-development-branch` | obra/superpowers | B | 태스크 완료 시 자동: 테스트 검증 → 머지/PR/유지/폐기 선택 |

### 설계 & 계획 (Planning)

| 스킬명 | 소스 | 등급 | 설명 |
|--------|------|------|------|
| `brainstorming` | obra/superpowers | B | 코드 작성 전 자동 활성화. 아이디어 정제 → 대안 탐색 → 설계 문서 저장 |
| `write-plan` | obra/superpowers | B | 주니어 개발자도 따를 수 있는 구현 계획 생성 |
| `execute-plan` | obra/superpowers | B | 배치 단위로 서브에이전트가 계획 실행 |

### 문서 (Documentation)

| 스킬명 | 소스 | 등급 | 설명 |
|--------|------|------|------|
| `docx` | anthropics/skills | S | Word 문서 생성/편집/분석 |
| `pdf` | anthropics/skills | S | PDF 조작 툴킷 |
| `pptx` | anthropics/skills | S | PowerPoint 생성/편집/분석 |
| `xlsx` | anthropics/skills | S | Excel 스프레드시트 처리 |

### 감사 & 컴플라이언스 (Audit)

| 스킬명 | 소스 | 등급 | 설명 |
|--------|------|------|------|
| `audit-context-building` | trailofbits/skills | A | 라인별 코드 분석, First Principles / 5 Whys / 5 Hows 적용 |
| `security-compliance` | SkillsMP (davila7) | C | 자산 탐색 → 취약점 스캔 → 검증 → CVSS 우선순위 지정 |

---

## 3. 설치 방법

### 개별 스킬 설치 (npx)
```bash
npx skills add getsentry/skills@security-review
npx skills add getsentry/skills@code-review
```

### 마켓플레이스 등록 후 설치
```
# Claude Code에서 실행
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace

/plugin marketplace add trailofbits/skills
/plugin install <plugin-name>@trailofbits-skills
```

### 수동 설치 (GitHub → ~/.claude/skills/)
```bash
git clone https://github.com/getsentry/skills.git /tmp/sentry-skills
cp -r /tmp/sentry-skills/plugins/security-review ~/.claude/skills/
```

---

## 4. 스킬 검증 체크리스트

새로운 스킬을 설치하기 전 반드시 확인:

- [ ] GitHub 스타 2개 이상 (SkillsMP 최소 기준)
- [ ] 최근 6개월 내 업데이트
- [ ] `allowed-tools` 최소화 여부 확인
- [ ] SKILL.md에 명확한 트리거 조건 명시
- [ ] 악성 코드/프롬프트 인젝션 패턴 없음
- [ ] 신뢰할 수 있는 조직/개인이 관리

---

## 5. 참고 링크

- [SkillsMP 마켓플레이스](https://skillsmp.com)
- [Anthropic 공식 스킬](https://github.com/anthropics/skills)
- [Sentry 스킬](https://github.com/getsentry/skills)
- [Trail of Bits 스킬](https://github.com/trailofbits/skills)
- [obra/superpowers](https://github.com/obra/superpowers)
- [awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills)
- [VoltAgent/awesome-agent-skills](https://github.com/VoltAgent/awesome-agent-skills)
- [Claude Code 스킬 문서](https://code.claude.com/docs/en/skills)
- [Agent Skills 표준](https://agentskills.io)

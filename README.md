# Master Skill

Claude Code 전역 공통 스킬 모음입니다.
어떤 프로젝트, 어떤 환경에서든 동일한 스킬을 사용할 수 있도록 관리합니다.

## 스킬 목록

| 스킬 | 호출 | 설명 |
|------|------|------|
| **Code Review** | `/code-review` | 코드 품질, 보안, 성능 체계적 리뷰 |
| **Debug** | `/debug` | 에러/버그 단계적 추적 및 수정 |
| **Refactor** | `/refactor` | 동작 변경 없이 코드 구조 개선 |
| **Security Review** | `/security-review` | OWASP Top 10 기반 보안 취약점 분석 |
| **Explain** | `/explain` | 코드/아키텍처 다이어그램 포함 설명 |
| **Test Gen** | `/test-gen` | 프로젝트 패턴 맞춤 테스트 자동 생성 |
| **Git Workflow** | `/git-workflow` | 브랜치, 커밋, PR 등 Git 작업 관리 |
| **Explore Project** | `/explore-project` | 프로젝트 구조/스택/컨벤션 파악 |
| **Doc Gen** | `/doc-gen` | JSDoc/docstring/API 문서 생성 |
| **Perf Check** | `/perf-check` | 알고리즘, DB, 메모리 성능 분석 |
| **Session Start Hook** | `/session-start-hook` | 웹 세션 시작 시 의존성 설치 훅 |

## 설치

```bash
git clone https://github.com/<YOUR_USERNAME>/master-skill.git
cd master-skill
chmod +x install.sh
./install.sh
```

## 업데이트

```bash
cd master-skill
git pull
./install.sh
```

## 제거

```bash
cd master-skill
chmod +x uninstall.sh
./uninstall.sh
```

## 구조

```
master-skill/
├── README.md
├── install.sh          # 설치 스크립트
├── uninstall.sh        # 제거 스크립트
├── code-review/SKILL.md
├── debug/SKILL.md
├── doc-gen/SKILL.md
├── explain/SKILL.md
├── explore-project/SKILL.md
├── git-workflow/SKILL.md
├── perf-check/SKILL.md
├── refactor/SKILL.md
├── security-review/SKILL.md
├── session-start-hook/SKILL.md
└── test-gen/SKILL.md
```

## 스킬 우선순위

| 우선순위 | 위치 | 설명 |
|---------|------|------|
| 높음 | `~/.claude/skills/` | 개인 전역 (install.sh로 설치되는 위치) |
| 중간 | `.claude/skills/` | 프로젝트별 오버라이드 가능 |
| 낮음 | 플러그인 | 플러그인 제공 스킬 |

프로젝트에 동일 이름 스킬이 있으면 프로젝트 스킬이 우선 적용됩니다.

## 커스터마이징

새 스킬 추가:
1. `new-skill/SKILL.md` 디렉토리와 파일 생성
2. `install.sh`의 `SKILLS` 배열에 추가
3. 커밋 & 푸시 후 각 환경에서 `git pull && ./install.sh`

## 사용 예시

```bash
# 변경 코드 리뷰
/code-review

# 에러 디버그
/debug "TypeError: Cannot read property 'id' of undefined"

# 특정 파일 리팩터링
/refactor src/services/auth.ts

# 새 프로젝트 파악
/explore-project

# 테스트 생성
/test-gen src/utils/parser.ts

# 성능 분석
/perf-check src/handlers/search.ts
```

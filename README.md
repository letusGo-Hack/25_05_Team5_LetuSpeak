# 📘 LetuSpeak — AI 기반 영어 학습 애플리케이션
### AI를 활용하여 문장 배열, 단어 퀴즈, 발음 연습 등 다양한 방식으로 영어 학습을 지원하는 iOS 애플리케이션입니다.
### 사용자가 입력한 문장을 기반으로 LLM이 유사 표현·문법 팁·발음 가이드를 생성하며, TTS를 통해 AI와 대화하듯 학습할 수 있도록 설계했습니다.
<br>

## 🧠 주요 기능
### 1. 난이도 기반 문장 배열 & 단어 퀴즈
#### Enum/Struct로 난이도별 문항 구성
#### 사용자가 선택한 난이도에 따라 자동으로 문제 생성 및 학습 흐름 제공
<br>

### 2. LLM 기반 AI 학습 지원
#### 입력 문장을 프롬프트로 변환하여 유사 문장, 문법 팁, 발음 가이드 생성
#### FoundationModels를 활용한 LLM 세션 호출 및 응답 처리
<br>

### 3. TTS 기반 음성 학습
#### AVFoundation을 활용한 자연스러운 음성 출력
#### AI와 말하기 연습 경험 제공
<br>

### 4. 학습 상태 관리
#### SwiftUI의 Observable, AppStorage, Bindable로 학습 데이터 저장
#### 학습 흐름의 상태 변화에 따라 UI가 즉시 업데이트되도록 구조화
<br>
<br>

### 📦 프로젝트 구조 예시
```
LetuSpeak/
 ├── Models/
 │   └── SentenceExpressions.swift // 문장 추천 모델
 │
 ├── Components/
 │   └── AiAnimationView.swift
 │
 ├── Extentions/
 │   └── Guardrail+Extensions.swift
 │
 └── Feature/
     ├── MainTabView.swift
     ├── SentenceArrangeView.swift
     ├── SentenceExpressionsSheetView.swift
     ├── SentenceArrangeView.swift
     ├── Speak.swift // AI와 말하기 연습
     └── WordQuizView.swift
```
<br>

### ▶️ 실행 방법
#### Xcode 16 이상 설치
#### Repository 클론
git clone https://github.com/letusGo-Hack/25_05_Team5_LetuSpeak.git
#### 프로젝트 열기
#### 시뮬레이터 또는 실기기에서 실행

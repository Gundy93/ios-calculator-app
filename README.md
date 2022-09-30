# 계산기

## 📖 목차
1. [소개](#🌱-소개)
2. [타임라인](#📆-타임라인)
3. [시각화된 프로젝트 구조](#👀-시각화된-프로젝트-구조)
4. [실행 화면](#💻-실행-화면)
5. [트러블 슈팅](#❓-트러블-슈팅)
6. [참고 링크](#🔗-참고-링크)

## 🌱 소개

`Gundy`의 iOS 계산기 프로젝트입니다.

## 📆 타임라인

<details>
<summary>STEP 1</summary>

220920
- 프로토콜 CalculateItem
    - 빈 프로토콜 `CalculateItem` 추가
- 구조체 CalculatorItemQueue
    - 프로토콜 `CalculateItem`를 준수하는 구조체 `CalculatorItemQueue` 추가
    - 구현하지 않고 이름과 타입만 존재하는 프로퍼티와 메서드 작성
    - `CalculatorItemQueueTest`의 테스트에 따라 각 프로퍼티와 메서드 수정 반복
- 테스트 클래스 CalculatorItemQueueTest
    - 구조체 `CalculatorItemQueue`의 유닛테스트를 위한 클래스 `CalculatorItemQueueTest` 추가
    - `CalculatorItemQueue`의 프로퍼티와 메서드를 검증하는 테스트 메서드 작성
    - 테스트를 통해 수정된 프로퍼티와 메서드에 대해서 추가 테스트 메서드 작성
    
</details>
<details>
<summary>STEP 1 Feedback 반영</summary>

220921
- 구조체 CalculatorItemQueue
    - `CalculatorItemQueue` 구조체 자체가 아닌 `CalculatorItemQueue`가 다루는 요소가 `CalculateItem` 프로토콜을 준수하도록 수정
    - 동작을 수행하지 않고 값을 반환하는 메서드를 연산 프로퍼티로 수정
    - 크래시 등의 위험 요소 배제를 위해 `dequeue` 메서드 내부 코드 수정
- 테스트 클래스 CalculatorItemQueueTest
    - `CalculatorItemQueue` 수정에 따른 코드 수정
    - 테스트 메서드에 `given`, `when`, `then` 주석 추가
- Array
    - extension을 통해 배열의 첫번째 요소를 옵셔널로 반환하는 `popFirst`메서드 추가
</details>
<details>
<summary>STEP 2</summary>

220922
- Double
    - extension을 통해 프로토콜 `CalculateItem` 채택
- 구조체 CalculatorItemQueue
    - 내부 요소를 `CalculateItem` 프로토콜을 준수하는 제네릭 타입으로 수정
- 열거형 Operator
    - 각 연산자를 정의하는 열거형 `Operator` 추가
    - 두 Double 인자를 받아 덧셈, 뺄셈, 나눗셈, 곱셈의 연산을 하는 `add`, `subtract`, `divide`, `multiply` 메서드 추가
    - case에 따라 메서드를 호출해 결과를 반환하는 `calculate` 메서드 추가
- 구조체 Formula
    - 연산대상 큐와 연산자 큐를 프로퍼티로 갖는 구조체 `Formula` 추가
    - `operands` 프로퍼티와 `opreators` 프로퍼티의 내부 요소로 연산한 결과를 반환하는 `result` 메서드 추가
- 열거형 ExpressionParser
    - 문자열이 주어지면 문자열을 쪼개서 `Formula` 타입의 인스턴스를 생성하는 열거형 `ExpressionParser` 추가
    - 문자열을 연산자 기준으로 분해하여 문자열 배열로 반환하는 `componentsByOperators` 메서드 추가
    - `componentsByOperators` 메서드를 호출하여 나온 배열로 `operands`를, 문자열에 있는 연산자를 통해 만든 배열로 `operators`를 전달하여 `Formula` 타입의 인스턴스를 반환하는 `parse` 메서드 추가
- 에러 열거형 FormulaError
    - 계산 과정 및 `Formula` 타입에서 발생할 수 있는 에러를 정의한 에러타입 `FormulaError` 추가
- 테스트 클래스 CalculatorItemQueueTest
    - `CalculatorItemQueue` 수정에 따른 내부 코드 수정
</details>
<details>
<summary>STEP 2 Feedback 반영</summary>

220923
- 컨벤션
    - 고차함수 호출시 메서드 명과 중괄호 사이에 스페이싱 추가
    - extension 관련 파일명을 '타입명', '+', '확장된 사항' 의 구성으로 수정
    - 그 외 가독성을 위한 컨벤션 수정
    - 테스트 메서드명 평서문으로 변경, 내부 if문은 guard문으로 수정
- 구조체 Formula
    - Formula 타입의 프로퍼티 은닉화에 따라 멤버와이즈 이니셜라이저를 대체할 이니셜라이저 추가
</details>
<details>
<summary>STEP 3</summary>

220927
- 클래스 CalculatorViewController
    - ⁺⁄₋ 버튼 기능 구현
    - CE 버튼 기능 구현
    - 숫자 버튼 기능 구현
    - = 버튼 기능 구현
    - AC 버튼 기능 구현
    - 스크롤 기능 구현
</details>
<details>
<summary>STEP 3 Feedback 반영</summary>

220928
- 클래스 FormulaLabel
    - UILabel을 상속하는 `FormulaLabel` 추가
    - text를 변경함과 동시에 폰트 조정을 하는 `configure(text:)` 메서드 추가
- 클래스 FormulaStackView
    - UIStackView를 상속하는 `FormulaStackView` 추가
    - 각각의 텍스트를 기반으로 FormulaLabel 인스턴스를 만들어 서브뷰로 추가하는 configure(operatorText:, operandText:) 메서드 추가
- 기타
    - 폴더 정리
    - 컨벤션 통일
</details>

## 👀 시각화된 프로젝트 구조

![](https://i.imgur.com/QpYUATn.png)

## 💻 실행 화면

|AC|CE|⁺⁄₋|
|:-:|:-:|:-:|
|![](https://i.imgur.com/CbkZQWx.gif)|![](https://i.imgur.com/DcUfP95.gif)|![](https://i.imgur.com/Q6h659J.gif)|

|연산기호|=|스크롤기능|
|:-:|:-:|:-:|
|![](https://i.imgur.com/TeZJQGR.gif)|![](https://i.imgur.com/Pzn9C7N.gif)|![](https://i.imgur.com/TIrhsCe.gif)|

## ❓ 트러블 슈팅

<details>
<summary>큐 데이터 구조의 구현</summary>

Swift에는 Collection 타입이 있어서 지금껏 사용해본 적 없는 데이터 구조를 구현하는 것이 쉽지않았습니다. `isEmpty`등을 메서드로 만들지 연산 프로퍼티로 만들지 결정하기는 쉽지 않았습니다. 메서드로 만들어도, 연산 프로퍼티로 만들어도 기능상의 문제는 없었을 것이기 때문입니다. 하지만 Swift에 이미 구현되어있는 Collection 타입들을 보면 `isEmpty`등은 메서드가 아닌 연산 프로퍼티로 구현되어있었습니다. 이를 통해 '동작을 하지않고 값을 반환하는 경우'를 모두 연산 프로퍼티로 작성하는 기준을 세워서 그 구분을 명확히 하였습니다.
</details>
<details>
<summary>유닛 테스트를 위한 큐 요소의 타입</summary>

'프로토콜을 준수하는 타입'이 요소인 큐를 테스트하는 데에는 여러 방법이 있을 것입니다. 하지만 해당 프로토콜이 '빈 프로토콜'이어야한다면 여러 고민이 생깁니다. 값의 비교를 통해 테스트를 진행하는 방식이 더욱 명확하기 때문에 결국 제네릭타입에서 특정 타입을 고르도록 해야했습니다. 이를 String 타입을 선택했는데, 계산기라는 도구에서 입력할 수 있는 값은 비단 숫자만이 아니기 때문입니다. 숫자는 물론 연산기호도 포함할 수 있는 문자열이 더 다양한 상황을 검증할 수 있으리라고 생각해 String을 통해 유닛테스트를 거쳐 구조체 `CalculatorItemQueue`을 작성하였습니다.
</details>
<details>
<summary>사용하지 않는 메서드</summary>

UML상에 있는 모든 요소는 그대로 구현되어야 하기때문에 extension을 통해 String에 `split(with target: Character)` 메서드를 추가하였습니다. 하지만 이 메서드를 호출해야할법한 부분은 UML 상에서 나와있지는 않았지만 열거형 `ExpressionParser`의 `componentsByOperators` 메서드였습니다. 하지만 오히려 `split` 메서드를 호출하면 더욱 과정이 복잡해지기때문에 다른 로직을 사용하기로 하였습니다. `split` 메서드 자체를 수정할 수도 있었지만 매개변수의 타입을 변경하는 것은 UML과는 달라지게 되므로 수정하지 않았습니다. 결국 `split` 메서드는 사용하지 않는 메서드로 남게되었습니다.
</details>
<details>
<summary>마이너스 연산</summary>

연산기호 버튼의 title text로 연산 기능을 호출하려 하였는데, 마이너스 연산만 제대로 진행되지 않는 문제가 발생했습니다. 잘 구분 되지 않지만 버튼의 타이틀 텍스트가 "-" 일 것이라 생각했는데 정확히는 유니코드 상에서 구분되는 "−" 였던 것입니다. 해당 타이틀 텍스트를 Operator.subtract의 원시값으로 지정해주어 문제를 해결하였습니다.
</details>
<details>
<summary>나누기 0</summary>

나누기 0을 시도할 시 "NaN"을 표시해야하는데 수식중에 하나라도 있으면 무조건 NaN이어야하는지 고민이 되었습니다. 또한 기본값으로 설정되어있는 0과 입력값 0을 어떻게 뷰 컨트롤러 상에서 구분해 해결해야할지 고민했는데, 뷰 컨트롤러에 여러 Bool 타입 프로퍼티를 만들어서 해결해보았습니다.
</details>
        
## 🔗 참고 링크

- Swift Language Guide
    - [Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
    - [Extensions](https://docs.swift.org/swift-book/LanguageGuide/Extensions.html)
    - [Error Handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html)

---

[🔝 맨 위로 이동하기](#계산기)

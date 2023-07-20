# 계산기 클론 코딩
아이폰에 있는 기본 어플 **계산기**를 클론코딩 해보았습니다.
최대한 비슷하게 UI를 구성하고 기능을 구현했습니다.
**UIKit**을 이용해 개발했습니다!

## 디자인
기본 어플의 어두운 테마를 기준으로 제작하였습니다.



<img width="30%" src="https://github.com/mooninbeom/Calculator_CloneCoding/assets/116792524/8902eb61-a443-4810-afaf-345d1ed22828"/>

<img width="30%" src="https://github.com/mooninbeom/Calculator_CloneCoding/assets/116792524/48f4f20b-625f-43a0-b15f-bbf412d1d127"/>


**직접 구성한 UI**　　　　　　　　　　　　　　**실제 UI**




## 작동 화면
<img width="30%" src="https://github.com/mooninbeom/Calculator_CloneCoding/assets/116792524/11fcb1bf-0ab9-4fc4-82a6-2bd577181530"/>





## 구현 방식
스크린의 width와 height를 구하여 일정 비율에 맞게 버튼과 Label를 배치함으로써 화면 크기에 반응하여 UI를 구성할 수 있었습니다.

이번에는 처음이라서 StackView를 사용하지 않고 일일이 하나씩 넣었습니다.


### 계산
계산기 구현은 두개의 변수를 이용해 연산자 버튼을 분기로 나눠 첫번째와 두번째 변수에 저장하여 **=** 버튼을 누를 시 첫번째 변수에 결과값이 나오는 형태로 구현하였습니다.

### UI
버튼 터치시 Background 색을 흰색으로 변환 후 바로 **UIView.animate**를 이용해 기존 색으로 돌아오도록 애니매이션을 주어 터치 애니메이션을 구성했습니다.

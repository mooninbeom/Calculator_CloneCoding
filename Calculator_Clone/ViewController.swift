//
//  ViewController.swift
//  Calculator_Clone
//
//  Created by 문인범 on 2023/07/10.
//

import UIKit

class ViewController: UIViewController {

    var result: String?
    var firstView: String = ""
    var secondView: String = ""
    override func viewDidLoad() {
        setUp()
    }
    
    // MARK: - View 1열 (결과창 라벨)
    // 결과창 Label
    lazy var resultView: UILabel = {
        let view = UILabel()
        view.text = result ?? "0"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .right
        view.font = .systemFont(ofSize: 80, weight: .light)
        view.textColor = .white
        return view
    }()
    
    // MARK: - View 2열 ( 리셋, 음양수, 나머지, 나누기 버튼)
    // 리셋 버튼
    lazy var resetButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("AC", for: .normal)
        view.backgroundColor = .systemGray3
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 30)
        view.addTarget(self, action: #selector(tapResetBtn), for: UIControl.Event.touchUpInside)
        return view
    }()
    
    // 양수, 음수 버튼
    lazy var plusMinusBtn: UIButton = {
        var view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("+/-", for: .normal)
        view.backgroundColor = .systemGray3
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = .systemFont(ofSize: 30)
        view.addTarget(self, action: #selector(tapPMBtn), for: .touchUpInside)
        return view
    }()
    
    // 나머지 구하기 버튼
    lazy var remainderBtn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("%", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.backgroundColor = .systemGray3
        view.titleLabel?.font = .systemFont(ofSize: 30)
        view.addTarget(self, action: #selector(tapRemainderBtn), for: .touchUpInside)
        return view
    }()

    // 나누기 버튼
    lazy var devideBtn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("÷", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.setTitleColor(.systemOrange, for: .selected)
        view.backgroundColor = .systemOrange
        view.titleLabel?.font = .systemFont(ofSize: 45)
        view.addTarget(self, action: #selector(tapOperatorBtn), for: .touchUpInside)
        return view
    }()
    
    // MARK: - View 3열 (숫자 7, 8, 9/ 곱하기 버튼)
    lazy var num7Btn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("7", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .darkGray
        view.titleLabel?.font = .systemFont(ofSize: 40)
        view.addTarget(self, action: #selector(tapNumBtn), for: .touchUpInside)
        return view
    }()
    
    lazy var num8Btn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("8", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .darkGray
        view.titleLabel?.font = .systemFont(ofSize: 40)
        view.addTarget(self, action: #selector(tapNumBtn), for: .touchUpInside)
        return view
    }()
    
    lazy var num9Btn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("9", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .darkGray
        view.titleLabel?.font = .systemFont(ofSize: 40)
        view.addTarget(self, action: #selector(tapNumBtn), for: .touchUpInside)
        return view
    }()
    
    lazy var multiplyBtn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("x", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.setTitleColor(.systemOrange, for: .selected)
        view.backgroundColor = .systemOrange
        view.titleLabel?.font = .systemFont(ofSize: 40)
        view.addTarget(self, action: #selector(tapOperatorBtn), for: .touchUpInside)
        return view
    }()
    
    // MARK: - View 4열
    // 숫자4 버튼
    lazy var num4Btn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("4", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .darkGray
        view.titleLabel?.font = .systemFont(ofSize: 40)
        view.addTarget(self, action: #selector(tapNumBtn), for: .touchUpInside)
        return view
    }()
    
    // 숫자5 버튼
    lazy var num5Btn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("5", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .darkGray
        view.titleLabel?.font = .systemFont(ofSize: 40)
        view.addTarget(self, action: #selector(tapNumBtn), for: .touchUpInside)
        return view
    }()
    
    // 숫자6 버튼
    lazy var num6Btn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("6", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .darkGray
        view.titleLabel?.font = .systemFont(ofSize: 40)
        view.addTarget(self, action: #selector(tapNumBtn), for: .touchUpInside)
        return view
    }()
    
    // 빼기 버튼
    lazy var minusBtn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("-", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.setTitleColor(.systemOrange, for: .selected)
        view.backgroundColor = .systemOrange
        view.titleLabel?.font = .systemFont(ofSize: 50)
        view.addTarget(self, action: #selector(tapOperatorBtn), for: .touchUpInside)
        return view
    }()
    
    // MARK: - View 5열
    // 숫자1 버튼
    lazy var num1Btn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("1", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .darkGray
        view.titleLabel?.font = .systemFont(ofSize: 40)
        view.addTarget(self, action: #selector(tapNumBtn), for: .touchUpInside)
        return view
    }()
    
    // 숫자2 버튼
    lazy var num2Btn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("2", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .darkGray
        view.titleLabel?.font = .systemFont(ofSize: 40)
        view.addTarget(self, action: #selector(tapNumBtn), for: .touchUpInside)
        return view
    }()
    
    // 숫자3 버튼
    lazy var num3Btn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("3", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .darkGray
        view.titleLabel?.font = .systemFont(ofSize: 40)
        view.addTarget(self, action: #selector(tapNumBtn), for: .touchUpInside)
        return view
    }()
    
    // 더하기 버튼
    lazy var plusBtn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("+", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.setTitleColor(.systemOrange, for: .selected)
        view.backgroundColor = .systemOrange
        view.titleLabel?.font = .systemFont(ofSize: 50)
        view.addTarget(self, action: #selector(tapOperatorBtn), for: .touchUpInside)
        return view
    }()
    
    // MARK: - 6열
    // 숫자0 버튼
    lazy var num0Btn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("   0", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .darkGray
        view.titleLabel?.font = .systemFont(ofSize: 40)
        view.contentHorizontalAlignment = .leading
        view.addTarget(self, action: #selector(tapNumBtn), for: .touchUpInside)
        return view
    }()
    
    // .버튼
    lazy var decimalBtn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle(".", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .darkGray
        view.titleLabel?.font = .systemFont(ofSize: 40)
        view.addTarget(self, action: #selector(tapNumBtn), for: .touchUpInside)
        return view
    }()
    
    // = 버튼
    lazy var equalBtn: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("=", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .systemOrange
        view.titleLabel?.font = .systemFont(ofSize: 40)
        view.addTarget(self, action: #selector(tapEqualBtn), for: .touchUpInside)
        return view
    }()

}

extension ViewController {
    func setUp() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let safeConstant: CGFloat = 20
        let betweenConstant: CGFloat = 10
        let setWidth = screenWidth - 15*2
        let buttonWidth = (setWidth/4) - 10

        view.backgroundColor = .black
        
        view.addSubview(resultView)
        resultView.topAnchor.constraint(equalTo: view.topAnchor, constant: screenHeight/5).isActive = true
        resultView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        resultView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
//        resultView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        view.addSubview(resetButton)
        resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: safeConstant).isActive = true
        resetButton.trailingAnchor.constraint(equalTo: resetButton.leadingAnchor, constant: buttonWidth).isActive = true
        resetButton.topAnchor.constraint(equalTo: resultView.bottomAnchor, constant: 30).isActive = true
        resetButton.bottomAnchor.constraint(equalTo: resetButton.topAnchor, constant: buttonWidth).isActive = true
        resetButton.layer.cornerRadius = buttonWidth/2.0
        resetButton.clipsToBounds = true
        
        view.addSubview(plusMinusBtn)
        plusMinusBtn.leadingAnchor.constraint(equalTo: resetButton.trailingAnchor, constant: betweenConstant).isActive = true
        plusMinusBtn.trailingAnchor.constraint(equalTo: plusMinusBtn.leadingAnchor, constant: buttonWidth).isActive = true
        plusMinusBtn.topAnchor.constraint(equalTo: resetButton.topAnchor).isActive = true
        plusMinusBtn.bottomAnchor.constraint(equalTo: plusMinusBtn.topAnchor, constant: buttonWidth).isActive = true
        plusMinusBtn.layer.cornerRadius = buttonWidth/2.0
        plusMinusBtn.clipsToBounds = true
        
        view.addSubview(remainderBtn)
        remainderBtn.leadingAnchor.constraint(equalTo: plusMinusBtn.trailingAnchor, constant: betweenConstant).isActive = true
        remainderBtn.trailingAnchor.constraint(equalTo: remainderBtn.leadingAnchor, constant: buttonWidth).isActive = true
        remainderBtn.topAnchor.constraint(equalTo: resetButton.topAnchor).isActive = true
        remainderBtn.bottomAnchor.constraint(equalTo: remainderBtn.topAnchor, constant: buttonWidth).isActive = true
        remainderBtn.layer.cornerRadius = buttonWidth/2.0
        remainderBtn.clipsToBounds = true
        
        view.addSubview(devideBtn)
        devideBtn.leadingAnchor.constraint(equalTo: remainderBtn.trailingAnchor, constant: betweenConstant).isActive = true
        devideBtn.trailingAnchor.constraint(equalTo: devideBtn.leadingAnchor, constant: buttonWidth).isActive = true
        devideBtn.topAnchor.constraint(equalTo: resetButton.topAnchor).isActive = true
        devideBtn.bottomAnchor.constraint(equalTo: devideBtn.topAnchor, constant: buttonWidth).isActive = true
        devideBtn.layer.cornerRadius = buttonWidth/2.0
        devideBtn.clipsToBounds = true
        
        view.addSubview(num7Btn)
        num7Btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: safeConstant).isActive = true
        num7Btn.trailingAnchor.constraint(equalTo: num7Btn.leadingAnchor, constant: buttonWidth).isActive = true
        num7Btn.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: safeConstant).isActive = true
        num7Btn.bottomAnchor.constraint(equalTo: num7Btn.topAnchor, constant: buttonWidth).isActive = true
        num7Btn.layer.cornerRadius = buttonWidth/2.0
        num7Btn.clipsToBounds = true
        
        view.addSubview(num8Btn)
        num8Btn.leadingAnchor.constraint(equalTo: num7Btn.trailingAnchor, constant: betweenConstant).isActive = true
        num8Btn.trailingAnchor.constraint(equalTo: num8Btn.leadingAnchor, constant: buttonWidth).isActive = true
        num8Btn.topAnchor.constraint(equalTo: num7Btn.topAnchor).isActive = true
        num8Btn.bottomAnchor.constraint(equalTo: num8Btn.topAnchor, constant: buttonWidth).isActive = true
        num8Btn.layer.cornerRadius = buttonWidth/2.0
        num8Btn.clipsToBounds = true
        
        view.addSubview(num9Btn)
        num9Btn.leadingAnchor.constraint(equalTo: num8Btn.trailingAnchor, constant: betweenConstant).isActive = true
        num9Btn.trailingAnchor.constraint(equalTo: num9Btn.leadingAnchor, constant: buttonWidth).isActive = true
        num9Btn.topAnchor.constraint(equalTo: num7Btn.topAnchor).isActive = true
        num9Btn.bottomAnchor.constraint(equalTo: num9Btn.topAnchor, constant: buttonWidth).isActive = true
        num9Btn.layer.cornerRadius = buttonWidth/2.0
        num9Btn.clipsToBounds = true
        
        view.addSubview(multiplyBtn)
        multiplyBtn.leadingAnchor.constraint(equalTo: num9Btn.trailingAnchor, constant: betweenConstant).isActive = true
        multiplyBtn.trailingAnchor.constraint(equalTo: multiplyBtn.leadingAnchor, constant: buttonWidth).isActive = true
        multiplyBtn.topAnchor.constraint(equalTo: num7Btn.topAnchor).isActive = true
        multiplyBtn.bottomAnchor.constraint(equalTo: multiplyBtn.topAnchor, constant: buttonWidth).isActive = true
        multiplyBtn.layer.cornerRadius = buttonWidth / 2.0
        multiplyBtn.clipsToBounds = true
        
        view.addSubview(num4Btn)
        num4Btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: safeConstant).isActive = true
        num4Btn.trailingAnchor.constraint(equalTo: num4Btn.leadingAnchor, constant: buttonWidth).isActive = true
        num4Btn.topAnchor.constraint(equalTo: num7Btn.bottomAnchor, constant: safeConstant).isActive = true
        num4Btn.bottomAnchor.constraint(equalTo: num4Btn.topAnchor, constant: buttonWidth).isActive = true
        num4Btn.layer.cornerRadius = buttonWidth/2.0
        num4Btn.clipsToBounds = true
        
        view.addSubview(num5Btn)
        num5Btn.leadingAnchor.constraint(equalTo: num4Btn.trailingAnchor, constant: betweenConstant).isActive = true
        num5Btn.trailingAnchor.constraint(equalTo: num5Btn.leadingAnchor, constant: buttonWidth).isActive = true
        num5Btn.topAnchor.constraint(equalTo: num4Btn.topAnchor).isActive = true
        num5Btn.bottomAnchor.constraint(equalTo: num5Btn.topAnchor, constant: buttonWidth).isActive = true
        num5Btn.layer.cornerRadius = buttonWidth/2.0
        num5Btn.clipsToBounds = true
        
        view.addSubview(num6Btn)
        num6Btn.leadingAnchor.constraint(equalTo: num5Btn.trailingAnchor, constant: betweenConstant).isActive = true
        num6Btn.trailingAnchor.constraint(equalTo: num6Btn.leadingAnchor, constant: buttonWidth).isActive = true
        num6Btn.topAnchor.constraint(equalTo: num4Btn.topAnchor).isActive = true
        num6Btn.bottomAnchor.constraint(equalTo: num6Btn.topAnchor, constant: buttonWidth).isActive = true
        num6Btn.layer.cornerRadius = buttonWidth/2.0
        num6Btn.clipsToBounds = true
        
        view.addSubview(minusBtn)
        minusBtn.leadingAnchor.constraint(equalTo: num6Btn.trailingAnchor, constant: betweenConstant).isActive = true
        minusBtn.trailingAnchor.constraint(equalTo: minusBtn.leadingAnchor, constant: buttonWidth).isActive = true
        minusBtn.topAnchor.constraint(equalTo: num4Btn.topAnchor).isActive = true
        minusBtn.bottomAnchor.constraint(equalTo: minusBtn.topAnchor, constant: buttonWidth).isActive = true
        minusBtn.layer.cornerRadius = buttonWidth/2.0
        minusBtn.clipsToBounds = true
        
        view.addSubview(num1Btn)
        num1Btn.leadingAnchor.constraint(equalTo: num4Btn.leadingAnchor).isActive = true
        num1Btn.trailingAnchor.constraint(equalTo: num1Btn.leadingAnchor, constant: buttonWidth).isActive = true
        num1Btn.topAnchor.constraint(equalTo: num4Btn.bottomAnchor, constant: safeConstant).isActive = true
        num1Btn.bottomAnchor.constraint(equalTo: num1Btn.topAnchor, constant: buttonWidth).isActive = true
        num1Btn.layer.cornerRadius = buttonWidth/2.0
        num1Btn.clipsToBounds = true
        
        view.addSubview(num2Btn)
        num2Btn.leadingAnchor.constraint(equalTo: num1Btn.trailingAnchor, constant: betweenConstant).isActive = true
        num2Btn.trailingAnchor.constraint(equalTo: num2Btn.leadingAnchor, constant: buttonWidth).isActive = true
        num2Btn.topAnchor.constraint(equalTo: num1Btn.topAnchor).isActive = true
        num2Btn.bottomAnchor.constraint(equalTo: num2Btn.topAnchor, constant: buttonWidth).isActive = true
        num2Btn.layer.cornerRadius = buttonWidth/2.0
        num2Btn.clipsToBounds = true
        
        view.addSubview(num3Btn)
        num3Btn.leadingAnchor.constraint(equalTo: num2Btn.trailingAnchor, constant: betweenConstant).isActive = true
        num3Btn.trailingAnchor.constraint(equalTo: num3Btn.leadingAnchor, constant: buttonWidth).isActive = true
        num3Btn.topAnchor.constraint(equalTo: num2Btn.topAnchor).isActive = true
        num3Btn.bottomAnchor.constraint(equalTo: num3Btn.topAnchor, constant: buttonWidth).isActive = true
        num3Btn.layer.cornerRadius = buttonWidth/2.0
        num3Btn.clipsToBounds = true
        
        view.addSubview(plusBtn)
        plusBtn.leadingAnchor.constraint(equalTo: num3Btn.trailingAnchor, constant: betweenConstant).isActive = true
        plusBtn.trailingAnchor.constraint(equalTo: plusBtn.leadingAnchor, constant: buttonWidth).isActive = true
        plusBtn.topAnchor.constraint(equalTo: num3Btn.topAnchor).isActive = true
        plusBtn.bottomAnchor.constraint(equalTo: plusBtn.topAnchor, constant: buttonWidth).isActive = true
        plusBtn.layer.cornerRadius = buttonWidth/2.0
        plusBtn.clipsToBounds = true
        
        view.addSubview(num0Btn)
        num0Btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: safeConstant).isActive = true
        num0Btn.trailingAnchor.constraint(equalTo: num0Btn.leadingAnchor, constant: buttonWidth*2+10).isActive = true
        num0Btn.topAnchor.constraint(equalTo: num1Btn.bottomAnchor, constant: safeConstant).isActive = true
        num0Btn.bottomAnchor.constraint(equalTo: num0Btn.topAnchor, constant: buttonWidth).isActive = true
        num0Btn.layer.cornerRadius = buttonWidth/2.0
        num0Btn.clipsToBounds = true
        
        view.addSubview(decimalBtn)
        decimalBtn.leadingAnchor.constraint(equalTo: num0Btn.trailingAnchor, constant: betweenConstant).isActive = true
        decimalBtn.trailingAnchor.constraint(equalTo: decimalBtn.leadingAnchor, constant: buttonWidth).isActive = true
        decimalBtn.topAnchor.constraint(equalTo: num0Btn.topAnchor).isActive = true
        decimalBtn.bottomAnchor.constraint(equalTo: decimalBtn.topAnchor, constant: buttonWidth).isActive = true
        decimalBtn.layer.cornerRadius = buttonWidth/2.0
        decimalBtn.clipsToBounds = true
        
        view.addSubview(equalBtn)
        equalBtn.leadingAnchor.constraint(equalTo: decimalBtn.trailingAnchor, constant: betweenConstant).isActive = true
        equalBtn.trailingAnchor.constraint(equalTo: equalBtn.leadingAnchor, constant: buttonWidth).isActive = true
        equalBtn.topAnchor.constraint(equalTo: decimalBtn.topAnchor).isActive = true
        equalBtn.bottomAnchor.constraint(equalTo: equalBtn.topAnchor, constant: buttonWidth).isActive = true
        equalBtn.layer.cornerRadius = buttonWidth/2.0
        equalBtn.clipsToBounds = true
    }
    
    @objc
    func tapResetBtn() {
        if self.resetButton.isHighlighted {
            self.resetButton.backgroundColor = .white
            UIView.animate(withDuration: 0.5, animations: {self.resetButton.backgroundColor = .systemGray3})
        }
        self.result = nil
        self.firstView = ""
        self.secondView = ""
        self.resultView.text = result ?? "0"
    }
    
    @objc
    func tapPMBtn() {
        if plusMinusBtn.isHighlighted {
            self.plusMinusBtn.backgroundColor = .white
            UIView.animate(withDuration: 0.5, animations: {self.plusMinusBtn.backgroundColor = .systemGray3})
        }
    }
    
    @objc
    func tapRemainderBtn() {
        if remainderBtn.isHighlighted {
            self.remainderBtn.backgroundColor = .white
            UIView.animate(withDuration: 0.5, animations: {self.remainderBtn.backgroundColor = .systemGray3})
        }
    }

    
    @objc
    func tapNumBtn(_ sender: UIButton!) {
        guard let btnNum = sender.titleLabel?.text else {
            print("error")
            return
        }
        print(btnNum)
        
        switch (btnNum) {
        case "   0" :
            self.num0Btn.backgroundColor = .systemGray
            UIView.animate(withDuration: 0.5, animations: {self.num0Btn.backgroundColor = .darkGray})
        
        case "1" :
            self.num1Btn.backgroundColor = .systemGray
            UIView.animate(withDuration: 0.5, animations: {self.num1Btn.backgroundColor = .darkGray})
        
        case "2" :
            self.num2Btn.backgroundColor = .systemGray
            UIView.animate(withDuration: 0.5, animations: {self.num2Btn.backgroundColor = .darkGray})
        
        case "3" :
            self.num3Btn.backgroundColor = .systemGray
            UIView.animate(withDuration: 0.5, animations: {self.num3Btn.backgroundColor = .darkGray})
            
        case "4" :
            self.num4Btn.backgroundColor = .systemGray
            UIView.animate(withDuration: 0.5, animations: {self.num4Btn.backgroundColor = .darkGray})
            
        case "5" :
            self.num5Btn.backgroundColor = .systemGray
            UIView.animate(withDuration: 0.5, animations: {self.num5Btn.backgroundColor = .darkGray})
            
        case "6" :
            self.num6Btn.backgroundColor = .systemGray
            UIView.animate(withDuration: 0.5, animations: {self.num6Btn.backgroundColor = .darkGray})
            
        case "7" :
            self.num7Btn.backgroundColor = .systemGray
            UIView.animate(withDuration: 0.5, animations: {self.num7Btn.backgroundColor = .darkGray})
            
        case "8" :
            self.num8Btn.backgroundColor = .systemGray
            UIView.animate(withDuration: 0.5, animations: {self.num8Btn.backgroundColor = .darkGray})
            
        case "9" :
            self.num9Btn.backgroundColor = .systemGray
            UIView.animate(withDuration: 0.5, animations: {self.num9Btn.backgroundColor = .darkGray})
            
        case "." :
            self.decimalBtn.backgroundColor = .systemGray
            UIView.animate(withDuration: 0.5, animations: {self.decimalBtn.backgroundColor = .darkGray})
            
        default : return
        }
        
        self.calcMethod(btnNum)
        
        
        /*
        if (calcView.count > 3 && calcView.count % 3 == 1) {
            let idx = calcView.index(calcView.endIndex, offsetBy: -3)
            result!.insert(",", at: idx)
        }
         */
        
        self.resultView.text = (isOperatorToggled()) ? secondView : firstView
        print(result!)
    }
    
    func calcMethod(_ num: String) -> Void {
        
        if result == nil {
            result = ""
            if num == "   0" {
                result!.append("0")
            } else {
                result!.append(num)
            }
        } else {
            if num == "   0" {
                result!.append("0")
            } else {
                result!.append(num)
            }
        }
        
        if !isOperatorToggled() {
            if num == "   0" {
                firstView.append("0")
            } else {
                firstView.append(num)
            }
        } else {
            if num == "   0" {
                secondView.append("0")
            } else {
                secondView.append(num)
            }
        }
        
    }
    
    func isOperatorToggled() -> Bool {
        if (!plusBtn.isSelected && !minusBtn.isSelected && !multiplyBtn.isSelected && !devideBtn.isSelected) {
            return false
        }
        return true
    }
    
    func whatOperatorToggled() -> Int {
        if plusBtn.isSelected { return 1 }
        if minusBtn.isSelected { return 2 }
        if multiplyBtn.isSelected { return 3 }
        if devideBtn.isSelected { return 4 }
        return 0
    }
    
    
    @objc
    func tapEqualBtn(_ sender: UIButton!) {
        
        if (self.firstView.isEmpty || self.secondView.isEmpty) {
            self.resultView.text = "오류"
        } else {
            var first = Int(self.firstView)!
            var second = Int(self.secondView)!
            var devideFirst = Float(self.firstView)!
            var devideSecond = Float(self.secondView)!
            
            switch (whatOperatorToggled()) {
            case 1:
                var result = first + second
                self.firstView = "\(result)"
                self.secondView = ""
                self.resultView.text = firstView

            case 2:
                var result = first - second
                self.firstView = "\(result)"
                self.secondView = ""
                self.resultView.text = firstView
                
            case 3:
                var result = first * second
                self.firstView = "\(result)"
                self.secondView = ""
                self.resultView.text = firstView
                
            case 4:
                var result = devideFirst / devideSecond
                self.firstView = "\(result)"
                self.secondView = ""
                self.resultView.text = firstView
            
            default: return
            }
        }
        
        self.equalBtn.backgroundColor = UIColor(red: 255/255, green: 234/255, blue: 194/255, alpha: 1.0)
        
        self.plusBtn.isSelected = false
        self.minusBtn.isSelected = false
        self.multiplyBtn.isSelected = false
        self.devideBtn.isSelected = false
        UIView.animate(withDuration: 0.3, animations: {self.plusBtn.backgroundColor = .systemOrange})
        UIView.animate(withDuration: 0.3, animations: {self.minusBtn.backgroundColor = .systemOrange})
        UIView.animate(withDuration: 0.3, animations: {self.multiplyBtn.backgroundColor = .systemOrange})
        UIView.animate(withDuration: 0.3, animations: {self.devideBtn.backgroundColor = .systemOrange})
        
        UIView.animate(withDuration: 0.5, animations: {self.equalBtn.backgroundColor = .systemOrange})
    }
    
    @objc
    func tapOperatorBtn(_ sender: UIButton!) {
        guard let operatorName = sender.titleLabel?.text else { print("error!"); return}
        
        switch operatorName {
        case "+":
            if self.plusBtn.isSelected {
                UIView.animate(withDuration: 0.3, animations: {self.plusBtn.backgroundColor = .systemOrange})
                self.plusBtn.isSelected = false
            } else {
                UIView.animate(withDuration: 0.3, animations: {self.plusBtn.backgroundColor = .white})
                self.plusBtn.isSelected = true
                self.minusBtn.isSelected = false
                UIView.animate(withDuration: 0.3, animations: {self.minusBtn.backgroundColor = .systemOrange})
                self.multiplyBtn.isSelected = false
                UIView.animate(withDuration: 0.3, animations: {self.multiplyBtn.backgroundColor = .systemOrange})
                self.devideBtn.isSelected = false
                UIView.animate(withDuration: 0.3, animations: {self.devideBtn.backgroundColor = .systemOrange})
            }
        
        case "-":
            if self.minusBtn.isSelected {
                UIView.animate(withDuration: 0.3, animations: {self.minusBtn.backgroundColor = .systemOrange})
                self.minusBtn.isSelected = false
            } else {
                UIView.animate(withDuration: 0.3, animations: {self.minusBtn.backgroundColor = .white})
                self.minusBtn.isSelected = true
                self.plusBtn.isSelected = false
                UIView.animate(withDuration: 0.3, animations: {self.plusBtn.backgroundColor = .systemOrange})
                self.multiplyBtn.isSelected = false
                UIView.animate(withDuration: 0.3, animations: {self.multiplyBtn.backgroundColor = .systemOrange})
                self.devideBtn.isSelected = false
                UIView.animate(withDuration: 0.3, animations: {self.devideBtn.backgroundColor = .systemOrange})
            }
            
        case "x":
            if self.multiplyBtn.isSelected {
                UIView.animate(withDuration: 0.3, animations: {self.multiplyBtn.backgroundColor = .systemOrange})
                self.multiplyBtn.isSelected = false
            } else {
                UIView.animate(withDuration: 0.3, animations: {self.multiplyBtn.backgroundColor = .white})
                self.multiplyBtn.isSelected = true
                self.plusBtn.isSelected = false
                UIView.animate(withDuration: 0.3, animations: {self.plusBtn.backgroundColor = .systemOrange})
                self.minusBtn.isSelected = false
                UIView.animate(withDuration: 0.3, animations: {self.minusBtn.backgroundColor = .systemOrange})
                self.devideBtn.isSelected = false
                UIView.animate(withDuration: 0.3, animations: {self.devideBtn.backgroundColor = .systemOrange})
            }
            
        case "÷":
            if self.devideBtn.isSelected {
                UIView.animate(withDuration: 0.3, animations: {self.devideBtn.backgroundColor = .systemOrange})
                self.devideBtn.isSelected = false
            } else {
                UIView.animate(withDuration: 0.3, animations: {self.devideBtn.backgroundColor = .white})
                self.devideBtn.isSelected = true
                self.plusBtn.isSelected = false
                UIView.animate(withDuration: 0.3, animations: {self.plusBtn.backgroundColor = .systemOrange})
                self.minusBtn.isSelected = false
                UIView.animate(withDuration: 0.3, animations: {self.minusBtn.backgroundColor = .systemOrange})
                self.multiplyBtn.isSelected = false
                UIView.animate(withDuration: 0.3, animations: {self.multiplyBtn.backgroundColor = .systemOrange})
            }
        
        default: return
        }
    }
    
}

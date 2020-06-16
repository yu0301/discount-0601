//
//  ViewController.swift
//  discountTryAgain
//
//  Created by yaheyyodude on 2020/5/31.
//  Copyright © 2020 Ray. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //MARK: - properties
    
    var userInputNumber :Int = 0
    var discountPercent : Int = 0
//    {
//        didSet {
//            discountPercentageLabel.text = "(\(discountPercent)%)"
//        }
//    }
    var afterDiscount : Int = 0
//    {
//        didSet {
//            afterDiscountLabel.text = "$" + String(discountMoneyVal)      }
//    }
    var discountMoneyVal : Int = 0
//    {
//        didSet {
//            discountVal.text = "$" + String(afterDiscount)
//        }
//    }


    //MARK: - IbOutlet
    @IBOutlet weak var userInputText: UITextField!
    @IBOutlet weak var discountPercentageLabel: UILabel!
    @IBOutlet weak var afterDiscountLabel: UILabel!
    @IBOutlet weak var percentSlider: UISlider!
    @IBOutlet weak var discountVal: UILabel!
    
    
    //MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //以下是監看userInputText這個textfield  有任何編輯時
        userInputText.delegate = self
        //監看對象 userInputText ，使用 textChange(_:) ， 在有編輯時
        userInputText.addTarget(self, action: #selector(textChange(_:)), for: .allEditingEvents)
    }
    //MARK: - func
    
    // 當textField的數值改變時
    @objc func textChange(_ textField:UITextField) {
        calculate(userInputText: userInputText, percentSlider: percentSlider)
    }
    
    //按空白處收鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      print("touch begin")
      self.view.endEditing(true)
    }
    
    //slide事件
    @IBAction func Slide(_ sender: UISlider) {
        calculate(userInputText: userInputText, percentSlider: percentSlider)
    }
    
    //運算式
        func calculate (userInputText: UITextField!, percentSlider: UISlider!) {
            //原本的寫法
//            if let number = Int(userInputText.text!) {
//
//                userInputNumber = number
//            }
////            else {
////                userInputNumber = 0
////            }
            // guard let 如不符合就會跳出
            guard let number = Int(userInputText.text!) else {
                userInputNumber = 0 //如果userInputText的數值不是Int userInputNumber = 0 然後跳出
                return
            }
                //如果 number 為 Int 將數值存放到 userInputNumber
                userInputNumber = number
            
                //將slider的數值轉為Int存到discountPercent
                discountPercent = Int(percentSlider.value)
            
                //折後價格
                discountMoneyVal = (userInputNumber - (userInputNumber * discountPercent)/100)
            
                //省了多少
                afterDiscount = (userInputNumber * discountPercent)/100
            
                //折後價格顯示的數字
                afterDiscountLabel.text = "$" + String(discountMoneyVal)
            
                //省了多少顯示的數字
                discountVal.text = "$" + String(afterDiscount)
            
                //折扣百分比顯示的數字
                discountPercentageLabel.text = "(\(discountPercent)%)"
            }
        
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
//    {
//        var result = false
//        if userInputText == nil {
//            result = false
//
//        }
//        if userInputText != nil {
//            calculate(userInputText: userInputText, percentSlider: percentSlider)
//            result = true
//        }
//
//        return result
//    }
    


}


//
//  SecondViewController.swift
//  note
//
//  Created by student on 2019/3/28.
//  Copyright © 2019年 student. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textCheck: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func saveBtn(_ sender: UIButton) {
        var items : [String] = []
        
        let itemObj = UserDefaults.standard.object(forKey: "userEntry")
        
        
        
        if textField.text != ""{
            if let tempItem = itemObj as? [String]{
                items = tempItem
                //加入訊息通知使用者已存入相同資訊
               var index = -1
                for str in items{
                    index += 1
                    if str == textField.text{
                        textCheck.text = "已存有相同內容"
                        items.remove(at: index)
                        print("/n \(index)")
                        break
                    }else{
                        textCheck.text = "已存入新內容"
                    }
                }
                items.append(textField.text!)
                print(items)
                
            }else{
                items = [textField.text!]
            }
            
            UserDefaults.standard.set(items,forKey:"userEntry")
            textField.text = ""
        }
        

    }
}


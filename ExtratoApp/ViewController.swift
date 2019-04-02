//
//  ViewController.swift
//  ExtratoApp
//
//  Created by Guilherme Deconto on 3/29/19.
//  Copyright © 2019 Guilherme Deconto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var user_id: UITextField!
    @IBOutlet weak var password_id: UITextField!
    @IBOutlet weak var button_id: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var text_press: UILabel!
    
    var modelData: Model?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPaddingAndBorder(to: user_id)
        addPaddingAndBorder(to: password_id)
        imageView.image = #imageLiteral(resourceName: "icoded.png")
    }
    
    func addPaddingAndBorder(to textfield: UITextField) {
        textfield.layer.cornerRadius =  5
        textfield.layer.borderColor = UIColor.black.cgColor
        textfield.layer.borderWidth = 1
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 2.0))
        textfield.leftView = leftView
        textfield.leftViewMode = .always
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainSegue" {
            guard let vc = segue.destination as? Main else {return}
            vc.modelData = modelData
        }
    }
    
    @IBAction func pressed_button(_ sender: Any) {
            if validateTextFild(c1: (user_id?.text)!, c2: (password_id?.text)!) {
                if isEmpty(txt: user_id) && isEmpty(txt: password_id){
                    self.sendAlert(m: "Campo vazio!")
                    return
                } else {
                    guard let pwd = password_id.text else {return}
                    Service.getData(pwd, success: { (data) in
                       self.modelData = data
                       self.performSegue(withIdentifier: "MainSegue", sender: self)
                        self.sendAlert(m: data.name)
                    }) { (error) in
                       self.sendAlert(m: error)
                    }
                }
            } else {
                self.sendAlert(m: "Campos não coencidem")
            }
            
        }
    func validateTextFild(c1:String, c2: String) -> Bool{
        return c1.elementsEqual(c2)
    }
    func isEmpty(txt: UITextField) -> Bool {
        return (txt.text?.isEmpty)!
    }
    func sendAlert(m: String?){
        let alert = UIAlertController(title: "Atenção", message: m, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

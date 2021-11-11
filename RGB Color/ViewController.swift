//
//  ViewController.swift
//  RGB Color
//
//  Created by Duxxless on 07.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //colorView
    @IBOutlet weak var colorView: UIView!
    
    //labelValueColor
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    //SlidersColor
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    //TextFieldColor
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        
        setColor()
        setValueForLabel()
        setValueForTextField()

        addDoneButtonTo(redTextField)
        addDoneButtonTo(greenTextField)
        addDoneButtonTo(blueTextField)
        
        
    
    }
    @IBAction func rgbSlider(_ sender: UISlider) {
    
        switch sender.tag {
        case 0 :
            redLabel.text = string(from: sender) // = String(sender.value) или = String(format: "%.2f", sender.value)
            redTextField.text = string(from: sender)
        case 1 :
            greenLabel.text = string(from: sender)
            greenTextField.text = string(from: sender)
        case 2:
            blueLabel.text = string(from: sender)
            blueTextField.text = string(from: sender)
        default:
            break
        }
        setColor()
    }
    
    //цвет view
    private func setColor() {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    // Установка значения для label
    private func setValueForLabel() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
    }
    
    // Установка значения для TextField
    private func setValueForTextField() {
        redTextField.text = string(from: redSlider)
        greenTextField.text = string(from: greenSlider)
        blueTextField.text = string(from: blueSlider)
    }
   
    // привидение сендера к стринг до сотых
    private func string(from sender: UISlider) -> String {
        return String(format: "%.2f", sender.value)
      
    }
}
// MARK: - UITextFeildDelegate

// расширение ViewController под протокол UITextFieldDelegate (содержит методы для работы с текстовыми полями)
extension ViewController: UITextFieldDelegate {
    
    //скрытие клавиатуры по слову Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // скрытие клавиатуры по тапу за пределами Text View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true) // скрывает клавиатуру для любого объекта
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField.tag {
            case 0 : redSlider.value = currentValue
            case 1 : greenSlider.value = currentValue
            case 2 : blueSlider.value = currentValue
            default : break
            }
            
            setColor()
            setValueForLabel()
            
        } else {
           showAlert(title:"Wrong format", message: "Please enter correct value")
        }
    }
}

extension ViewController {
    
    // Метод для отображения кнопки "Готово" на цифровой клавиатуре
    private func addDoneButtonTo(_ textField: UITextField) {
        
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title:"Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

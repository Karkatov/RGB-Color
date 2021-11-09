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

//      addDoneButtonTo(redTextField)
//        addDoneButtonTo(greenTextField)
//        addDoneButtonTo(blueTextField)
        
        
    
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



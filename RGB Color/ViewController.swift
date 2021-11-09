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
        seValueForTextField()

        addDoneButtonTo(redTextField)
        addDoneButtonTo(greenTextField)
        addDoneButtonTo(blueTextField)
        
        
    
    }
    @IBAction func rgbSlider(_ sender: UISlider) {
    
        switch sender.tag
    }
    
}


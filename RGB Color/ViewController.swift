//
//  ViewController.swift
//  RGB Color
//
//  Created by Duxxless on 07.11.2021.
//

import UIKit

class ViewController: UIViewController {
    //image
    @IBOutlet weak var imageColor: UIImageView!
    //labelValueColor
    @IBOutlet weak var labelValueRed: UILabel!
    @IBOutlet weak var labelValueGreen: UILabel!
    @IBOutlet weak var labelValueBlue: UILabel!
    //SlidersColor
    @IBOutlet weak var sliderRed: UISlider! {
        didSet {
            sliderRed.maximumValue = 1
            sliderRed.minimumValue = 0
            sliderRed.value = 0.50
        }
    }
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    //TextFieldColor
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageColor.layer.cornerRadius = 15
        
        redTF.text = labelValueRed.text
        greenTF.text = labelValueGreen.text
        blueTF.text = labelValueBlue.text
    }

    @IBAction func sliderRedAction() {
        labelValueRed.text = String(round(100 * sliderRed.value))
        redTF.text = labelValueRed.text
        
    }
    
}


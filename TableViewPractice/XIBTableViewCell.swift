//
//  XIBTableViewCell.swift
//  TableViewPractice
//
//  Created by iAskedYou2nd on 4/26/22.
//

import UIKit

class XIBTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewInCell: UIImageView!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var stepper: UIStepper!
    
    func configure(image: UIImage?, sliderLabelCell: String, stepperLabelCell: String) {
        self.imageViewInCell.image = image
        self.stepperLabel.text = stepperLabelCell
        self.sliderLabel.text = sliderLabelCell
        self.stepper.value = 0.0
        self.stepper.wraps = true
        self.stepper.stepValue = 1
        self.slider.value = 0.0
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        sliderLabel.text = String(slider.value)
    }
    
    @IBAction func stepperPressed(_ sender: Any) {
        stepperLabel.text = String(stepper.value)
    }
    
}

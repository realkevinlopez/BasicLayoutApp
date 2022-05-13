//
//  DetailViewController.swift
//  TableViewPractice
//
//  Created by Kevin Lopez on 4/26/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedRow: Int?
    var image: UIImage?
    var passedSliderValue: Float?
    var passedStepperValue: Double?
    var passedStepperText: String?
    var passedSliderText: String?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    @IBAction func stepperPressed(_ sender: Any) {
        self.stepperLabel.text = "\(self.stepper.value)"
    }
    
    @IBAction func sliderMoved(_ sender: Any) {
        self.sliderLabel.text = "\(self.slider.value)"
    }
    
    func setUpUI() {
        self.imageView.image = image ?? UIImage(named: "\(selectedRow ?? 32)")
        self.stepper.value = passedStepperValue ?? 0.0
        self.slider.value = passedSliderValue ?? 0.0
        self.sliderLabel.text = passedSliderText ?? "ValueNotPassed"
        self.stepperLabel.text = passedStepperText ?? "ValueNotPassed"
}

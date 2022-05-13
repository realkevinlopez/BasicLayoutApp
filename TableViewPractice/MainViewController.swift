//
//  MainViewController.swift
//  TableViewPractice
//
//  Created by Kevin Lopez on 4/26/22.
//

import UIKit

class MainViewController: UIViewController {
    
    var num = 1
    var selectedRow: Int?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.backgroundColor = .white
        self.tableView.register(UINib(nibName: "XIBTableViewCell", bundle: nil), forCellReuseIdentifier: "XIBTableCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PushSegue" {
            let VC = segue.destination as? DetailViewController
            let cell = tableView.dequeueReusableCell(withIdentifier: "XIBTableCell", for: IndexPath(row: selectedRow ?? 0, section: 0)) as? XIBTableViewCell
            VC?.selectedRow = tableView.indexPathForSelectedRow?.row
            VC?.image = cell?.imageViewInCell.image
            VC?.passedSliderValue = cell?.slider.value
            VC?.passedStepperValue = cell?.stepper.value
            VC?.passedSliderText = cell?.sliderLabel.text
            VC?.passedStepperText = cell?.stepperLabel.text
        }
    }
    
}


extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 32
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "XIBTableCell", for: indexPath) as? XIBTableViewCell
        cell?.configure(image: UIImage(named: "\(indexPath.row)"), sliderLabelCell: "Slider: ", stepperLabelCell: "Stepper: ")
        return cell ?? UITableViewCell()
    }
    
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PushSegue", sender: self)
        print("Navigate Here")
    }
    
}


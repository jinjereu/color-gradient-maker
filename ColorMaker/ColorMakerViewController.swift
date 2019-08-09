//
//  ViewController.swift
//  ColorMaker
//
//  Created by Ingrid Silapan on 9/08/19.
//  Copyright © 2019 irs. All rights reserved.
//

import UIKit

struct ColorValue {
	
	var rValue: Float = 0.5
	var gValue: Float = 0.5
	var bValue: Float = 0.5
	var aValue: Float = 0.5
	
	var color: UIColor {
		get {
			return UIColor.init(red: CGFloat(rValue),
								green: CGFloat(gValue),
								blue: CGFloat(bValue),
								alpha: CGFloat(aValue))
		}
	}
	
}

class ColorMakerViewController: UIViewController {

	@IBOutlet weak var colorPreview: UIView!
	@IBOutlet weak var gradientColorPreview: UIView!
	
	@IBOutlet weak var rSlider: UISlider!
	@IBOutlet weak var gSlider: UISlider!
	@IBOutlet weak var bSlider: UISlider!
	@IBOutlet weak var aSlider: UISlider!
	
	@IBOutlet weak var rLabel: UILabel!
	@IBOutlet weak var gLabel: UILabel!
	@IBOutlet weak var bLabel: UILabel!
	@IBOutlet weak var aLabel: UILabel!
	
	@IBOutlet weak var colorList: UITableView!
	
	lazy var colorValue = ColorValue()
	lazy var selectedColors = [UIColor]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		setupView()
	}
	
	private func setupView() {
		title = "Color Gradient Maker"
		navigationController?.navigationBar.prefersLargeTitles = true
		
		rSlider.value = colorValue.rValue
		gSlider.value = colorValue.gValue
		bSlider.value = colorValue.bValue
		aSlider.value = colorValue.aValue
		
		updateColorPreview()
	}
	
	@IBAction func rSliderChanged(_ sender: Any) {
		colorValue.rValue = rSlider.value
		updateColorPreview()
	}
	
	@IBAction func gSliderChanged(_ sender: Any) {
		colorValue.gValue = gSlider.value
		updateColorPreview()
	}
	
	@IBAction func bSliderChanged(_ sender: Any) {
		colorValue.bValue = bSlider.value
		updateColorPreview()
	}
	
	@IBAction func aSliderChanged(_ sender: Any) {
		colorValue.aValue = aSlider.value
		updateColorPreview()
	}
	
	@IBAction func addColor(_ sender: Any) {
		selectedColors.append(colorValue.color)
		colorList.reloadData()
		updateGradientColorPreview()
	}
	
	private func updateColorPreview() {
		//Update the Color Preview
		colorPreview.backgroundColor = colorValue.color
		
		//Update the labels
		rLabel.text = "R: \(colorValue.rValue)"
		gLabel.text = "G: \(colorValue.gValue)"
		bLabel.text = "B: \(colorValue.bValue)"
		aLabel.text = "A: \(colorValue.aValue)"
	}
	
	private func updateGradientColorPreview() {
		//Update the gradient color preview
		if let gradientLayer = gradientColorPreview.layer.sublayers?.first as? CAGradientLayer {
			//Update the colors of the existing CAGradientLayer
			gradientLayer.colors = selectedColors.map({ $0.cgColor })
		} else {
			//Add the new gradient layer if it doesn't exist
			let newLayer = CAGradientLayer()
			newLayer.frame = gradientColorPreview.frame
			newLayer.colors = selectedColors.map({ $0.cgColor })
			gradientColorPreview.layer.insertSublayer(newLayer, at: 0)
		}
	}
}

extension ColorMakerViewController: UITableViewDataSource, UITableViewDelegate {
	
	//MARK: - UITableViewDataSource
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return selectedColors.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
		
		guard indexPath.row < selectedColors.count else { return cell }
		
		let color = selectedColors[indexPath.row]
		cell.backgroundColor = color
		
		return cell
	}
	
}

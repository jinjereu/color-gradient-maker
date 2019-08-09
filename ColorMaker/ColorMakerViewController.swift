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
	
	@IBOutlet weak var rSlider: UISlider!
	@IBOutlet weak var gSlider: UISlider!
	@IBOutlet weak var bSlider: UISlider!
	@IBOutlet weak var aSlider: UISlider!
	
	@IBOutlet weak var rLabel: UILabel!
	@IBOutlet weak var gLabel: UILabel!
	@IBOutlet weak var bLabel: UILabel!
	@IBOutlet weak var aLabel: UILabel!
	
	var colorValue = ColorValue()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		setupView()
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
	
	private func setupView() {
		rSlider.value = colorValue.rValue
		gSlider.value = colorValue.gValue
		bSlider.value = colorValue.bValue
		aSlider.value = colorValue.aValue
		
		updateColorPreview()
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
}


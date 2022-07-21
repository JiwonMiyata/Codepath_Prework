//
//  ViewController.swift
//  prework
//
//  Created by jiwon ryu on 7/20/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BillAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipControl: UISlider!
    @IBOutlet weak var partysizeControl: UISlider!
    @IBOutlet weak var splitedAmount: UILabel!
    
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var totalCalculated: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
   
        

    }

    @IBAction func CalculatePressed(_ sender: Any) {
        calculateTip()
        
    }
    @IBAction func SplitTheBill(_ sender: Any) {
        splitBillbyPartysize()
    }
    @IBAction func tipSliderChanged(_ sender: UISlider) {

       tipPercentageLabel.text! = String(Int(sender.value)) + "%"
       
    }
    
    @IBAction func partySizeChanged(_ sender: UISlider) {
        partySizeLabel.text! = String(Int(sender.value))
    }
    
    func calculateTip() {
        var tipAmountCalculated = Double()
        var total = Double()
        if let billAmount = Double(BillAmountTextField.text!) {
        tipAmountCalculated = billAmount * Double(tipControl.value/100)
            total = tipAmountCalculated + Double(BillAmountTextField.text!)!
        }
        else {
            tipAmountCalculated = 0
            total = 0
        }
        tipAmount.text! = String(Double(round(100*tipAmountCalculated)/100))
        totalCalculated.text! = String(Double(round(100*total)/100))
        }
    
    func splitBillbyPartysize() {
        let partySize = Int(partysizeControl.value)
        let splitedTotal = Float(totalCalculated.text!)! / Float(partySize)
        splitedAmount.text! = String(Double(round(100*splitedTotal)/100))
    }
}


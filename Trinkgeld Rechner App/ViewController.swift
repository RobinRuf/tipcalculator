//
//  ViewController.swift
//  Trinkgeld Rechner App
//
//  Created by Robin Ruf on 10.12.20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cashTextfield : UITextField!
    @IBOutlet weak var personsTextfield : UITextField!
    
    @IBOutlet weak var percentLabel : UILabel!
    @IBOutlet weak var percentSlider : UISlider!
    
    
    @IBOutlet weak var trinkgeldLabel : UILabel!
    @IBOutlet weak var gesamtKostenLabel : UILabel!
    @IBOutlet weak var kostenProPersonLabel : UILabel!
    
    var essenKosten = 0.0
    var trinkgeldProzent = 0.0
    var trinkgeldKosten = 0.0
    var gesamtKosten = 0.0
    var kostenProPerson = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
    @IBAction func percentButtonAction(_ sender: UIButton) {
        
        if sender.titleLabel?.text == "3%" {
            percentLabel.text = "3%"
            percentSlider.value = 3.0
            calculateCosts()
            return
            
        } else if sender.titleLabel?.text == "5%" {
            percentLabel.text = "5%"
            percentSlider.value = 5.0
            calculateCosts()
            return
            
        } else if sender.titleLabel?.text == "7%" {
            percentLabel.text = "7%"
            percentSlider.value = 7.0
            calculateCosts()
            return
            
        }
        
    }
    
    @IBAction func percentSliderAction(_ sender: UISlider) {
        
        let percentAsString = String(format: "%.0f", sender.value)
        percentLabel.text = percentAsString + "%"
        
        calculateCosts()
    }
    
    func calculateCosts() {
        
        if (cashTextfield.text!.isEmpty) && (personsTextfield.text!.isEmpty){
            callAlert(message: "Bitte Betrag und anzahl Personen angeben!")
        } else if (cashTextfield.text!.isEmpty) {
            callAlert(message: "Bitte Betrag angeben!")
        } else if (personsTextfield.text!.isEmpty) {
            callAlert(message: "Bitte anzahl Personen angeben!")
        } else {
            essenKosten = Double(cashTextfield.text!)!
            trinkgeldProzent = Double(percentSlider.value)
            
            trinkgeldKosten = (essenKosten * trinkgeldProzent) / 100
            gesamtKosten = essenKosten + trinkgeldKosten
            
            kostenProPerson = gesamtKosten / Double(personsTextfield.text!)!
            
            printUIElements()
        }
    }
    
    func printUIElements(){
        let stringTrinkgeld = String(format: "%.2f", trinkgeldKosten)
        let stringGesamtkosten = String(format: "%.2f", gesamtKosten)
        let stringKostenProPerson = String(format: "%.2f", kostenProPerson)
    
        trinkgeldLabel.text = "Trinkgeld: CHF " + stringTrinkgeld
        gesamtKostenLabel.text = "Gesamtkosten: CHF " + stringGesamtkosten
        kostenProPersonLabel.text = "Kosten pro Person: CHF " + stringKostenProPerson
    }
    
    func callAlert(message: String){
        let alert = UIAlertController(title: "Fehler", message: message, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "OK", style: .default) {
            (action) in}
        
        alert.addAction(action1)
        self.present(alert, animated: true, completion: nil)
    }
    
}


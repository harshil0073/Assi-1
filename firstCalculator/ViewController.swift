//
//  ViewController.swift
//  firstCalculator
//
//  Created by Canadore Student on 2023-03-20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var input: UILabel!
    @IBOutlet var result: UILabel!
    
    
    
    var workings:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        
        clearAll()
    }
    
    
    func clearAll(){
          
        workings = ""
        input.text = ""
        result.text = ""
        
    }

    func addToWorkings(value: String){
        workings = workings + value
        input.text = workings
    }
    @IBAction func allClear(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func dlt(_ sender: Any) {
        
        if(!workings.isEmpty) {
            workings.removeLast()
            input.text = workings
        }
    }
    
    @IBAction func percentage(_ sender: Any) {
        addToWorkings(value: "%")
    }
    
    @IBAction func division(_ sender: Any) {
        addToWorkings(value: "/")
    }
    @IBAction func seven(_ sender: Any) {
        addToWorkings(value: "7")
    }
    @IBAction func eight(_ sender: Any) {
        addToWorkings(value: "8")
    }
    @IBAction func nine(_ sender: Any) {
        addToWorkings(value: "9")
    }
    @IBAction func mul(_ sender: Any) {
        addToWorkings(value: "*")
    }
    @IBAction func four(_ sender: Any) {
        addToWorkings(value: "4")
    }
    @IBAction func five(_ sender: Any) {
        addToWorkings(value: "5")
    }
    @IBAction func six(_ sender: Any) {
        addToWorkings(value: "6")
    }
    @IBAction func sub(_ sender: Any) {
        addToWorkings(value: "-")
    }
    @IBAction func one(_ sender: Any) {
        addToWorkings(value: "1")
    }
    @IBAction func two(_ sender: Any) {
        addToWorkings(value: "2")
    }
    @IBAction func three(_ sender: Any) {
        addToWorkings(value: "3")
    }
    @IBAction func add(_ sender: Any) {
        addToWorkings(value: "+")
    }
    @IBAction func dot(_ sender: Any) {
        addToWorkings(value: ".")
    }
    @IBAction func zero(_ sender: Any) {
        addToWorkings(value: "0")
    }
    @IBAction func equal(_ sender: Any) {
        if(validInput()){

                    let checkedWorkingsForPercent = workings.replacingOccurrences(of: "%", with: "*0.01")

                    let expression = NSExpression(format: checkedWorkingsForPercent)
                    let results = expression.expressionValue(with: nil, context: nil) as!Double

                    let resultString = formatResult	(result: results)

                    result.text = resultString

                }

                else{

                    let alert = UIAlertController(

                        title: "Invalid Input",

                        message: "No result found!",

                        preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "Ok", style: .default))

                    self.present(alert, animated: true, completion: nil)

                }
    }
    func validInput()->Bool{

            var count = 0

            var funcCharIndexes = [Int]()

            for char in workings{

                if(specialCharacter(char: char)){

                    funcCharIndexes.append(count)

                }

                count += 1

            }

            var previous: Int = -1

            for index in funcCharIndexes{

                if(index == 0){

                    return false

                }

                if(index == workings.count - 1){

                    return false

                }

                if(previous != -1){

                    if(index - previous == 1){

                        return false

                    }

                }

                previous = index

            }

            return true

        }

        func specialCharacter(char: Character)->Bool{

            if(char == "*"){

                return true

            }

            if(char == "/"){

                return true

            }

            if(char == "+"){

                return true

            }

            if(char == "-"){

                return true

            }

            return false

        }

        func formatResult(result: Double) -> String{

            return String(format: "%.2f", result)

        }
}


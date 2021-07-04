//
//  ViewController.swift
//  imagelink
//
//  Created by 望月　偉央利 on 2021/06/12.
//

import UIKit

var firstWord = ""
var nowWord = ""

class ViewController: UIViewController {
    
    @IBOutlet weak var start: UILabel!
    @IBOutlet weak var first: UILabel!
    @IBOutlet weak var last: UILabel!
    @IBOutlet weak var multiplay: UILabel!
    var word = ""
    var word2 = ""
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        multiplay.text = "0"
    }
    @IBOutlet weak var textarea: UITextField!
    
    @IBAction func placearea(_ sender: Any) {
        let text = textarea.text!
        if(text != ""){
            if(count==0){
                start.text = text
                firstWord = start.text!
            }
            word2 = word
            word = text
            textarea.text = ""
            first.text = word
            last.text = word2
            nowWord = first.text!
            count += 1
            multiplay.text = count.description
            textarea.endEditing(true)
        }
    }
    
    @IBAction func refresh(_ sender: Any) {
        start.text = "None"
        first.text = "now"
        last.text = "previous"
        multiplay.text = "0"
        word = ""
        word2 = ""
        firstWord = ""
        nowWord = ""
        count = 0
    }
}


//
//  ViewController.swift
//  Counter
//
//  Created by Tolibov Umidjon Izomovich on 13/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var countLabel: UILabel!
    
   
    @IBOutlet weak var minusButton: UIButton!
    
    
    @IBOutlet weak var plusButton: UIButton!
    
    
    @IBOutlet weak var refreshButton: UIButton!
    
    
    @IBOutlet weak var messageTextView: UITextView!
    
    var count  = 0 {
        didSet {
            countLabel.text = String(count)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    func setupUI()  {
        countLabel.layer.cornerRadius = countLabel.frame.height / 2
        plusButton.layer.cornerRadius = plusButton.frame.height / 2
        minusButton.layer.cornerRadius = minusButton.frame.height / 2
        refreshButton.layer.cornerRadius = 10
        messageTextView.text = "История изменений:"
        
    }
    
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return dateFormatter.string(from: Date())
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
            
        case 0:
            if count == 0 {
                messageTextView.text += "\n [\(getCurrentDate())]:попытка уменьшить значение счётчика ниже 0"
                
            }else {
                count -= 1
                messageTextView.text += "\n [\(getCurrentDate())]:значение изменено на -1"
            }
            
        case 1:
            count = 0
            messageTextView.text += "\n [\(getCurrentDate())]: значение сброшено"
                
        case 2:
            count += 1
            messageTextView.text += "\n [\(getCurrentDate())]:значение изменено на +1"
            
        default:
            return
        }
    }
    
}


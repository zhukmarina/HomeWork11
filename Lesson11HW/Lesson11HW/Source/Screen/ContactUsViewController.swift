//
//  ContactUsViewController.swift
//  Lesson11HW
//

//

import UIKit

class ContactUsViewController: BaseViewController {
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textIndicatorLabel: UILabel!
    @IBOutlet weak var placeholder: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        placeholder.text = "Type here"
        submitButton.setTitle("Submit", for: .normal)
        submitButton.isEnabled = false
        
        updateUI()
    }
    
    private func updateUI(){
        let textCount = textView.text.count
        
        textIndicatorLabel.text = "\(320 - textCount)"
        textIndicatorLabel.textColor = textCount <= 320 ? .green : .red
        
        if textView.text.isEmpty {
               placeholder.isHidden = false
               submitButton.isEnabled = false
           } else {
               placeholder.isHidden = true
               submitButton.isEnabled = textCount >= 15
           }
    }
}

extension ContactUsViewController: UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        return newText.count <= 320
    }
    
    func textViewDidChange(_ textView: UITextView) {
            updateUI()
        }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        placeholder.isHidden = true
        return true
    }
}


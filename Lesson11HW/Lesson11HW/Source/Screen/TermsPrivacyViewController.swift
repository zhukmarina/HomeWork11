//
//  TermsPrivacyViewController.swift
//  Lesson11HW
//

//

import UIKit

class TermsPrivacyViewController: BaseViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var agreeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        setupInitialButtonState()
        
    }
    
    private func setupInitialButtonState() {
            agreeButton.setTitle("I agree", for: .normal)
            agreeButton.isEnabled = false
            textView.isEditable = false
        }
}

extension TermsPrivacyViewController: UITextViewDelegate{
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height){
            agreeButton.isEnabled = true
        }
        
    }
}

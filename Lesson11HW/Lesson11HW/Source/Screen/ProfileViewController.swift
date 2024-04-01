//
//  ProfileViewController.swift
//  Lesson11HW
//

//
import UIKit

class ProfileViewController: BaseViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameIndicatorLabel: UILabel!
    @IBOutlet weak var lastNameIndicatorLabel: UILabel!

    private var editMode = false
    private var rightBarButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        setupUI()
    }

    private func setupActions() {
        rightBarButton = UIBarButtonItem(
            title: "Edit",
            style: .plain,
            target: self,
            action: #selector(changeModeButtonDidTap)
        )
        navigationItem.rightBarButtonItem = rightBarButton
    }

    @objc private func changeModeButtonDidTap() {
        editMode = !editMode

        if editMode {
            rightBarButton.title = "Done"
            firstNameTextField.becomeFirstResponder()
        } else {
            rightBarButton.title = "Edit"
            view.endEditing(true) // Закриття клавіатури
        }

        updateUI()
    }

    private func setupUI() {
        firstNameLabel.text = "First name"
        lastNameLabel.text = "Last name"

        firstNameTextField.delegate = self
        lastNameTextField.delegate = self

        updateUI()
    }

    private func updateUI() {
        let firstNameCount = firstNameTextField.text?.count ?? 0
        let lastNameCount = lastNameTextField.text?.count ?? 0

        firstNameIndicatorLabel.text = "\(30 - firstNameCount)"
        lastNameIndicatorLabel.text = "\(30 - lastNameCount)"

        if editMode {
            firstNameIndicatorLabel.isHidden = false
            lastNameIndicatorLabel.isHidden = false
        } else {
            firstNameIndicatorLabel.isHidden = true
            lastNameIndicatorLabel.isHidden = true
        }

        firstNameIndicatorLabel.textColor = firstNameCount <= 30 ? .green : .red
        lastNameIndicatorLabel.textColor = lastNameCount <= 30 ? .green : .red
    }
}

extension ProfileViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }

        // Check if total text length will exceed 30 characters
        if text.count + string.count - range.length > 30 {
            return false
        }

        return true
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateUI() // Оновлення лічильників після кожного введеного символу
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        updateUI() // Оновлення лічильників та кольорів після завершення редагування
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return editMode // Дозволити встановлення курсора тільки у режимі редагування
    }
}

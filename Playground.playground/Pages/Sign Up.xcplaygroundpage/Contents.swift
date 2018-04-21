/*:
 [Table of Contents](Table%20of%20Contents) • [Previous page](@previous) • [Next page](@next)

 > Use the `Live View` as the assistant editor to see your changes reflected in real time.
 */

import PlaygroundSupport
import UIKit

class SignUpViewController: UIViewController {

    let rootStackView = UIStackView()
    let titleLabel = UILabel()

    let nameLabel = UILabel()
    let nameTextField = UITextField()
    let nameStackView = UIStackView()

    let emailLabel = UILabel()
    let emailTextField = UITextField()
    let emailStackView = UIStackView()

    let submitButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        rootStackView.translatesAutoresizingMaskIntoConstraints = false
        rootStackView.axis = .vertical
        // TODO: Add spacing.

        titleLabel.text = "Sign up"
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor(white: 0.2, alpha: 1)
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3, compatibleWith: traitCollection)

        nameLabel.text = "Name"
        nameStackView.axis = .vertical
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(nameTextField)
        // TODO: Apply styles.
        style(label: nameLabel)
        style(field: nameTextField)

        emailLabel.text = "Email"
        emailStackView.axis = .vertical
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)

        style(label: emailLabel)
        style(field: emailTextField)

        // TODO: Add password field.

        submitButton.setTitle("Submit", for: .normal)
        // TODO: Apply style.
        style(button: submitButton)

        view.addSubview(rootStackView)
        rootStackView.addArrangedSubview(titleLabel)
        rootStackView.addArrangedSubview(nameStackView)
        rootStackView.addArrangedSubview(emailStackView)
        rootStackView.addArrangedSubview(submitButton)

        NSLayoutConstraint.activate([
            rootStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            rootStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            rootStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }

    private func style(label: UILabel) {

        // TODO: Set font. Text style: caption1
    }

    private func style(field: UITextField) {

        // TODO: Set border style.
    }

    private func style(button: UIButton) {

        // TODO: Set font. Text style: callout
        // TODO: Set text color.
        // TODO: Set background color.
        // TODO: Set corner radius.
    }
}

let viewController = SignUpViewController()
let (parent, _) = controllers(child: viewController,
                              device: .phone4_7inch,
                              orientation: .portrait,
                              additionalTraits: .init(preferredContentSizeCategory: .unspecified))

PlaygroundPage.current.liveView = parent


/*:
 [Table of contents](Table%20of%20contents) • [Previous page](@previous) • [Next page](@next)
 */

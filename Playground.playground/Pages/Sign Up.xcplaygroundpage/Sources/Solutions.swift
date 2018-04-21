import UIKit

class ViewController: UIViewController {

    func style(label: UILabel) {

        label.font = UIFont.preferredFont(forTextStyle: .caption1, compatibleWith: traitCollection)
    }

    func style(field: UITextField) {

        field.borderStyle = .roundedRect
    }

    func style(button: UIButton) {

        button.titleLabel?.font =  UIFont.preferredFont(forTextStyle: .callout, compatibleWith: traitCollection)
        button.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .highlighted)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
    }
}

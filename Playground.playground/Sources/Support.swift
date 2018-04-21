// Credits to Kickstarter:
// - https://talk.objc.io/episodes/S01E51-playground-driven-development
// - https://github.com/kickstarter/ios-oss

import UIKit

public enum Device {
    case phone3_5inch
    case phone4inch
    case phone4_7inch
    case phone5_5inch
    case pad
    case pad12_9inch
}

public enum Orientation {
    case portrait
    case landscape
}

public func controllers(child: UIViewController = UIViewController(),
                        device: Device = .phone4_7inch,
                        orientation: Orientation = .portrait,
                        additionalTraits: UITraitCollection = .init()) -> (parent: UIViewController, child: UIViewController) {

    let parent = UIViewController()
    parent.addChildViewController(child)

    let traits: UITraitCollection
    let size: CGSize

    switch (device, orientation) {
    case (.phone3_5inch, .portrait):
        size = .init(width: 320, height: 480)
        traits = .init(traitsFrom: [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .phone)
            ])
    case (.phone3_5inch, .landscape):
        size = .init(width: 480, height: 320)
        traits = .init(traitsFrom: [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .compact),
            .init(userInterfaceIdiom: .phone)
            ])
    case (.phone4inch, .portrait):
        size = .init(width: 320, height: 568)
        traits = .init(traitsFrom: [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .phone)
            ])
    case (.phone4inch, .landscape):
        size = .init(width: 568, height: 320)
        traits = .init(traitsFrom: [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .compact),
            .init(userInterfaceIdiom: .phone)
            ])
    case (.phone4_7inch, .portrait):
        size = .init(width: 375, height: 667)
        traits = .init(traitsFrom: [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .phone)
            ])
    case (.phone4_7inch, .landscape):
        size = .init(width: 667, height: 375)
        traits = .init(traitsFrom: [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .compact),
            .init(userInterfaceIdiom: .phone)
            ])
    case (.phone5_5inch, .portrait):
        size = .init(width: 414, height: 736)
        traits = .init(traitsFrom: [
            .init(horizontalSizeClass: .compact),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .phone)
            ])
    case (.phone5_5inch, .landscape):
        size = .init(width: 736, height: 414)
        traits = .init(traitsFrom: [
            .init(horizontalSizeClass: .regular),
            .init(verticalSizeClass: .compact),
            .init(userInterfaceIdiom: .phone)
            ])
    case (.pad, .portrait):
        size = .init(width: 768, height: 1024)
        traits = .init(traitsFrom: [
            .init(horizontalSizeClass: .regular),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .pad)
            ])
    case (.pad, .landscape):
        size = .init(width: 1024, height: 768)
        traits = .init(traitsFrom: [
            .init(horizontalSizeClass: .regular),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .pad)
            ])
    case (.pad12_9inch, .portrait):
        size = .init(width: 1024, height: 1366)
        traits = .init(traitsFrom: [
            .init(horizontalSizeClass: .regular),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .pad)
            ])
    case (.pad12_9inch, .landscape):
        size = .init(width: 1366, height: 1024)
        traits = .init(traitsFrom: [
            .init(horizontalSizeClass: .regular),
            .init(verticalSizeClass: .regular),
            .init(userInterfaceIdiom: .pad)
            ])
    }

    let allTraits = UITraitCollection(traitsFrom: [traits, additionalTraits])
    parent.setOverrideTraitCollection(allTraits, forChildViewController: child)

    parent.view.addSubview(child.view)

    child.view.translatesAutoresizingMaskIntoConstraints = false

    parent.view.frame.size = size
    parent.preferredContentSize = size
    parent.view.backgroundColor = .white
    child.view.backgroundColor = .white

    parent.view.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
        child.view.leadingAnchor.constraint(equalTo: parent.view.leadingAnchor),
        child.view.trailingAnchor.constraint(equalTo: parent.view.trailingAnchor),
        child.view.bottomAnchor.constraint(equalTo: parent.view.bottomAnchor),
        child.view.topAnchor.constraint(equalTo: parent.view.topAnchor),
        ])

    return (parent, child)
}

//
//  ViewController.swift
//  gallery
//
//  Created by Anton Honcharov on 02.08.2021.
//

import UIKit


class InitialVC: UIViewController {
  // MARK: - Properties
  private let padding: CGFloat = 10.0
  private let heightConstant: CGFloat = 80
  // MARK: - IBOutlets
}

// MARK: - Life cycle
extension InitialVC {

  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
  }
}

// MARK: - Set up
extension InitialVC {
  func setupUI() {
    self.view.backgroundColor = .white

    createView(x: 50, y: 50, color: .systemGray6)
  }
}

// MARK: - IBActions
// MARK: - Navigation
// MARK: - Network Manager calls

// MARK: - Extensions
extension InitialVC {
  func createView(x: CGFloat, y: CGFloat ,color: UIColor) {

    /// 1 - Creating new view
    let newView = UIView()
    newView.backgroundColor = color
    /// 2 - disabling Mask calculations for Auto Layout dynamical calulations
    newView.translatesAutoresizingMaskIntoConstraints = false
    /// 3 - adding new view to MAIN view
    self.view.addSubview(newView)

    /// 3.1 - not necessary - little ui enhancements
    newView.layer.cornerRadius = 10
    newView.layer.shadowOpacity = 0.3
    newView.layer.shadowOffset = .zero

    /// 4 - adding constraints to new view
    NSLayoutConstraint.activate([
      newView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      newView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      newView.widthAnchor.constraint(equalToConstant: 200),
      newView.heightAnchor.constraint(equalToConstant: 300)
    ])

    imageViewAdd(to: newView)
  }

  func imageViewAdd(to newView: UIView) {
    let image = UIImage(named: K.imageOne)
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    newView.addSubview(imageView)

    NSLayoutConstraint.activate([
      imageView.leadingAnchor.constraint(equalTo: newView.leadingAnchor,
                                         constant: padding),

      imageView.topAnchor.constraint(equalTo: newView.topAnchor,
                                     constant: padding),

      imageView.trailingAnchor.constraint(equalTo: newView.trailingAnchor,
                                          constant: -padding),

    ])

    textLabelAdd(to: newView, relative: imageView)
  }

  func textLabelAdd(to newView: UIView, relative to: UIView) {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.text = "Trooper helmets"
    label.textColor = .systemPink

    newView.addSubview(label)

    NSLayoutConstraint.activate([
      label.topAnchor.constraint(equalTo: to.bottomAnchor, constant: padding),
      label.leadingAnchor.constraint(equalTo: newView.leadingAnchor,
                                     constant: padding),

      label.trailingAnchor.constraint(equalTo: newView.trailingAnchor,
                                      constant: -padding),

      label.bottomAnchor.constraint(equalTo: newView.bottomAnchor, constant: -padding)
    ])

//    label.setContentCompressionResistancePriority(.defaultLow + 1, for: .vertical)
//    label.setContentHuggingPriority(.defaultHigh + 1, for: .vertical)
  }
}

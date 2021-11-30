//
//  CongratulationUIView.swift
//  ArchitecturesAndDPatternsSix
//
//  Created by Андрей Щекатунов on 30.11.2021.
//

import UIKit

protocol CongratulationViewControllerViewDelegate: AnyObject {
	func done()
}

class CongratulationUIView: UIView {

	weak var delegate: CongratulationViewControllerViewDelegate?

	private(set) lazy var leadingTrailingAnchorStackView: CGFloat = 20.0

	private(set) lazy var leadingTrailingAnchorWinLable: CGFloat = 40.0

	private(set) lazy var stackViewHeightAnchor: CGFloat = 60.0

	private(set) lazy var buttonFontSize: CGFloat = 25.0

	private(set) lazy var winLableLogoTopAnchor: CGFloat = 40.0

	private(set) lazy var winLableHeightAnchor: CGFloat = 100.0

	private(set) lazy var doneButtonBottomAnchor: CGFloat = 20.0

	private(set) lazy var mainViewcornerRadius: CGFloat = 10.0

	private(set) lazy var congratulationLable: UILabel = {
		let text = UILabel()
		text.translatesAutoresizingMaskIntoConstraints = false
		text.textColor = .black
		text.textAlignment = .center
		text.numberOfLines = 0
		text.font = UIFont.boldSystemFont(ofSize: buttonFontSize)
		text.text = "Your coffee is ready!"
		return text
	}()

	private(set) lazy var doneButton: UIButton = {
		var button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Get a drink", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: buttonFontSize)
		button.backgroundColor = .lightGray
		button.layer.cornerRadius = stackViewHeightAnchor / 2
		return button
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.translatesAutoresizingMaskIntoConstraints = false
		createSubviews()
		constraintsInit()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.translatesAutoresizingMaskIntoConstraints = false
		createSubviews()
		constraintsInit()
	}

	func createSubviews() {
		backgroundColor = .white
		self.layer.cornerRadius = mainViewcornerRadius
		self.addSubview(congratulationLable)
		self.addSubview(doneButton)
		doneButton.addTarget(self,
							   action: #selector(handleDoneTouchUpInseide),
							   for: .touchUpInside)
	}

	func constraintsInit() {
		NSLayoutConstraint.activate([

			congratulationLable.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
			congratulationLable.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
												   constant: leadingTrailingAnchorWinLable),
			congratulationLable.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
													constant: -leadingTrailingAnchorWinLable),
			congratulationLable.heightAnchor.constraint(equalToConstant: winLableHeightAnchor),

			doneButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
											   constant: leadingTrailingAnchorStackView),
			doneButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
												constant: -leadingTrailingAnchorStackView),
			doneButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
											constant: -doneButtonBottomAnchor),
			doneButton.heightAnchor.constraint(equalToConstant: stackViewHeightAnchor)
		])
	}

	@objc func handleDoneTouchUpInseide() {
		delegate?.done()
	}
}


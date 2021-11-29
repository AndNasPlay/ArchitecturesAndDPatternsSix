//
//  MainViewController.swift
//  ArchitecturesAndDPatternsSix
//
//  Created by Андрей Щекатунов on 29.11.2021.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	private let stackViewLeadingTrailing: CGFloat = 60.0

	private let stackViewHeightAnchor: CGFloat = 360.0

	private let stackViewSpacing: CGFloat = 20.0

	private let tableViewSpacing: CGFloat = 20.0

	private let arrOfAdditives: [String] = ["Coffee", "Milk", "Whip", "Sugar"]

	private(set) lazy var tableView: UITableView = {
		var tableView = UITableView(frame: .zero, style: .plain)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		return tableView
	}()

	private(set) lazy var addMilkButton: UIButton = {
		var button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Milk", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.setTitleColor(.white, for: .highlighted)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
		button.backgroundColor = .lightGray
		button.layer.cornerRadius = stackViewSpacing
		return button
	}()

	private(set) lazy var addWhipButton:  UIButton = {
		var button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Whip", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.setTitleColor(.white, for: .highlighted)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
		button.backgroundColor = .lightGray
		button.layer.cornerRadius = stackViewSpacing
		return button
	}()

	private(set) lazy var addSugarButton:  UIButton = {
		var button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Sugar", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.setTitleColor(.white, for: .highlighted)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
		button.backgroundColor = .lightGray
		button.layer.cornerRadius = stackViewSpacing
		return button
	}()

	private(set) lazy var getDrinkButton: UIButton = {
		var button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Get a drink", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.setTitleColor(.white, for: .highlighted)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
		button.backgroundColor = .green
		button.layer.cornerRadius = stackViewSpacing
		return button
	}()

	private(set) lazy var viewStackView: UIStackView = {
		var stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.spacing = stackViewSpacing
		stackView.distribution = .fillEqually
		return stackView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
		self.navigationController?.navigationBar.isHidden = false
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
		createSubviews()
		constraintsInit()
	}

	func createSubviews() {
		self.view.addSubview(viewStackView)
		self.view.addSubview(tableView)
		viewStackView.addArrangedSubview(addMilkButton)
		viewStackView.addArrangedSubview(addWhipButton)
		viewStackView.addArrangedSubview(addSugarButton)
		viewStackView.addArrangedSubview(getDrinkButton)
		addMilkButton.addTarget(self,
								  action: #selector(handleAddMilkButtonTouchUpInseide),
								  for: .touchUpInside)
		addWhipButton.addTarget(self,
								  action: #selector(handleAddWhipBkuttonTouchUpInseide),
								  for: .touchUpInside)
		addSugarButton.addTarget(self,
								  action: #selector(handleAddSugarButtonTouchUpInseide),
								  for: .touchUpInside)
		getDrinkButton.addTarget(self,
								  action: #selector(handleGetDrinkButtonTouchUpInseide),
								  for: .touchUpInside)
	}

	func constraintsInit() {
		NSLayoutConstraint.activate([

			tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
											   constant: tableViewSpacing),
			tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
												constant: -tableViewSpacing),
			tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: tableViewSpacing),
			tableView.bottomAnchor.constraint(equalTo: self.viewStackView.topAnchor, constant: -tableViewSpacing),

			viewStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
												   constant: stackViewLeadingTrailing),
			viewStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
													constant: -stackViewLeadingTrailing),
			viewStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100.0),
			viewStackView.heightAnchor.constraint(equalToConstant: stackViewHeightAnchor)
		])
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return arrOfAdditives.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "reuseIdentifier")

		cell.textLabel?.text = "\(arrOfAdditives[indexPath.row]) price - "
		cell.detailTextLabel?.text = "Count"
		
		return cell
	}


	@objc func handleAddMilkButtonTouchUpInseide() {

	}


	@objc func handleAddWhipBkuttonTouchUpInseide() {

	}


	@objc func handleAddSugarButtonTouchUpInseide() {

	}

	@objc func handleGetDrinkButtonTouchUpInseide() {

	}
}


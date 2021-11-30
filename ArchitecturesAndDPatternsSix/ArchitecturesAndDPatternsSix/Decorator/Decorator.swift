//
//  Decorator.swift
//  ArchitecturesAndDPatternsSix
//
//  Created by Андрей Щекатунов on 29.11.2021.
//

import Foundation

protocol Coffee {
	var cost: Int { get }
}

class SimpleCoffee: Coffee {
	var cost: Int {
		return 120
	}
}

protocol CoffeeDecorator: Coffee {
	var baseCoffee: Coffee { get }
	init(baseCoffee: Coffee)
}

class CoffeeWithSugar: CoffeeDecorator {

	var baseCoffee: Coffee
	var cost: Int {
		return baseCoffee.cost + 20
	}

	required init(baseCoffee: Coffee) {
		self.baseCoffee = baseCoffee
	}
}

class CoffeeWithMilk: CoffeeDecorator {

	var baseCoffee: Coffee
	var cost: Int {
		return baseCoffee.cost + 40
	}

	required init(baseCoffee: Coffee) {
		self.baseCoffee = baseCoffee
	}
}

class CoffeeWithWhip: CoffeeDecorator {

	var baseCoffee: Coffee
	var cost: Int {
		return baseCoffee.cost + 30
	}

	required init(baseCoffee: Coffee) {
		self.baseCoffee = baseCoffee
	}
}

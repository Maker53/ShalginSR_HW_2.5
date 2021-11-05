//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Станислав on 02.11.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var animalTypeLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    //MARK: - Public Properties
    var answersChosen: [Answer] = []

    //MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        getMainAnimalType()
    }
}

// MARK: - Private Methods
extension ResultViewController {
    private func getMainAnimalType() {
        
        var animalsWithPointsArray: [AnimalType: Int] = [:]
        let animals = answersChosen.map { $0.type }
        
        for animal in animals {
            if let animalTypeCount = animalsWithPointsArray[animal] {
                animalsWithPointsArray.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                animalsWithPointsArray[animal] = 1
            }
        }
        
        let sortedAnimalsWithPointsArray = animalsWithPointsArray.sorted { $0.value > $1.value }
        guard let mostFrequencyAnimal = sortedAnimalsWithPointsArray.first?.key else { return }
        
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: AnimalType?) {
        animalTypeLabel.text = "Вы - \(animal?.rawValue ?? "❗️")!"
        definitionLabel.text = animal?.definition ?? ""
    }
}

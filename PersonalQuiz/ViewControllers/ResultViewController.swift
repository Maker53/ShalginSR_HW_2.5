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
        
        animalTypeLabel.text = "Вы - " + String(getMainAnimalType().rawValue)
        definitionLabel.text = getMainAnimalType().definition
        
        navigationItem.hidesBackButton = true
    }
}

// MARK: - Private Methods
extension ResultViewController {
    private func getMainAnimalType() -> AnimalType {
        var dogCount = 0
        var catCount = 0
        var rabbitCount = 0
        var turtleCount = 0
        
        var animalsWithPointsArray: [AnimalType: Int] = [:]
        
        for answer in answersChosen {
            switch answer.type {
            case .dog: dogCount += 1
                animalsWithPointsArray.updateValue(dogCount, forKey: .dog)
            case .cat: catCount += 1
                animalsWithPointsArray.updateValue(dogCount, forKey: .cat)
            case .rabbit: rabbitCount += 1
                animalsWithPointsArray.updateValue(dogCount, forKey: .rabbit)
            case .turtle: turtleCount += 1
                animalsWithPointsArray.updateValue(dogCount, forKey: .turtle)
            }
        }

        let sortedAnimalsArray = animalsWithPointsArray.sorted(by: {$0.value < $1.value})
        
        return sortedAnimalsArray[0].key
    }
}

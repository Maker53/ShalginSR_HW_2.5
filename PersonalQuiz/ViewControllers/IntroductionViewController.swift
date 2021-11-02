//
//  ViewController.swift
//  PersonalQuiz
//
//  Created by Станислав on 29.10.2021.
//

import UIKit

class IntroductionViewController: UIViewController {

    let questions = Question.getQuestions()
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {}
}


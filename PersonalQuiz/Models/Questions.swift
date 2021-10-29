//
//  Questions.swift
//  PersonalQuiz
//
//  Created by Станислав on 29.10.2021.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answer: [Answer]
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog =  "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые Вам нравятся и всегда готовы помочь."
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
        case .rabbit:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .turtle:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях"
        }
    }
}

extension Question {
    static func getQuestions() -> [Question] {
        return [Question(
            text: "Какую пищу предпочитаете?",
            type: .single,
            answer: [
                Answer(text: "Стейк", type: .dog),
                Answer(text: "Рыба", type: .cat),
                Answer(text: "Морковь", type: .rabbit),
                Answer(text: "Листья салата", type: .turtle)
                    ]
                ),
                Question(
                    text: "Что Вам нравится больше?",
                    type: .multiple,
                    answer: [
                        Answer(text: "Плавать", type: .dog),
                        Answer(text: "Спать", type: .cat),
                        Answer(text: "Обниматься", type: .rabbit),
                        Answer(text: "Есть", type: .turtle)
                    ]
                ),
                Question(
                    text: "Любите ли Вы поездки на машине?",
                    type: .ranged,
                    answer: [
                        Answer(text: "Ненавижу", type: .cat),
                        Answer(text: "Нервничаю", type: .rabbit),
                        Answer(text: "Не замечаю", type: .turtle),
                        Answer(text: "Обожаю ", type: .dog)
                    ]
                )
            ]
    }
}

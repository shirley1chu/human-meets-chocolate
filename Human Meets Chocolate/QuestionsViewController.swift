//
//  QuestionsViewController.swift
//  HumanMeetsChocolate
//
//  Created by Shirley Chu on 7/22/19.
//  Copyright © 2019 Shirley Chu. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    var questions: [Question] = [
        Question(text: "Pick a chocolate type",
                 
                 answers: [
                    Answer(text: "Dark"),
                    Answer(text: "Milk"),
                    Answer(text: "White")
            ]),
        Question(text: "If you can live anywhere in the world, where would it be?",
               
                 answers: [
                    Answer(text: "USA, baby!"),
                    Answer(text: "Europe"),
                    Answer(text: "Somewhere more exotic, please"),
            ]),
        Question(text: "What type of personality are you?",
           
                 answers: [
                    Answer(text: "Sweet"),
                    Answer(text: "Sassy"),
                    Answer(text: "Salty"),
            ]),
    ]
    
    var questionIndex = 0
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        
        questionLabel.text = currentQuestion.text
        updateAnswerButtons(using: currentAnswers)
        }
    
    func updateAnswerButtons(using answers: [Answer]) {
        answerButton1.setTitle(answers[0].text, for: .normal)
        answerButton2.setTitle(answers[1].text, for: .normal)
        answerButton3.setTitle(answers[2].text, for: .normal)
    }
    
    func nextQuestion() {
        print("in next question")
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            print("updating ui")
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen
        }
    }
    
    
    @IBAction func clickAnswerButton(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case answerButton1:
            answersChosen.append(currentAnswers[0])
        case answerButton2:
            answersChosen.append(currentAnswers[1])
        case answerButton3:
            answersChosen.append(currentAnswers[2])
        default:
            break
        }
        
        nextQuestion()
    }
        
}

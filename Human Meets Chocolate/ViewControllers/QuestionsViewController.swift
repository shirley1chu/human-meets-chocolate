//
//  QuestionsViewController.swift
//  HumanMeetsChocolate
//
//  Created by Shirley Chu on 7/22/19.
//  Copyright © 2019 Shirley Chu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class QuestionsViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    var recommendations = chocolateCollection().chocolates
    let collectionName = "chocolates"
    let collectionRef = Firestore.firestore().collection("chocolates")
    var refRecommendations: Any?
    
    var questions: [Question] = [
        Question(text: "Pick a chocolate type", attribute: "type",
                 
                 answers: [
                    Answer(text: "Dark", value: "dark"),
                    Answer(text: "Milk", value: "milk"),
                    Answer(text: "White", value: "white")
            ]),
        Question(text: "If you can live anywhere in the world, where would it be?", attribute: "region",
               
                 answers: [
            Answer(text: "USA, baby!", value: "usa"),
            Answer(text: "Europe", value: "europe"),
            Answer(text: "Somewhere more exotic, please", value: "exotic"),
            ]),
        Question(text: "What type of personality are you?", attribute: "personality",
           
                 answers: [
                    Answer(text: "Sweet", value: "sweet"),
                    Answer(text: "Sassy", value: "spicy"),
                    Answer(text: "Salty", value: "salty"),
            ]),
    ]
    
    var queryCriteria = [String:Any]()
    var questionIndex = 0
    let numberOfQuestions = 3
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        let answerButtons =
            [answerButton1, answerButton2, answerButton3, answerButton4]
        
        for button in answerButtons {
            button?.layer.cornerRadius = 8
        }
        
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
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            refRecommendations = refRecommendations ?? collectionRef.getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
            }
            print("in ref recommendations")
            print(refRecommendations)

            resultsViewController.recommendations = recommendations
        }
    }
    
    func queryFirebase () {
        
        if queryCriteria.isEmpty {
            refRecommendations = collectionRef.getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                                            print("\(document.documentID) => \(document.data())") }
                    }
                }
        }
        else {
            refRecommendations = collectionRef as CollectionReference
            for (questionAttribute, answerValue) in queryCriteria {
                refRecommendations = refRecommendations.whereField(questionAttribute, isEqualTo: answerValue) as QuerySnapshot
            }
            refRecommendations.getDocuments()
        }
    }


    @IBAction func clickAnswerButton(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        let question = questions[questionIndex]
        var answer: Answer!
        
        let numberOfQuestions = questions.count
        
        switch sender {
        case answerButton1:
            answer = currentAnswers[0]
        case answerButton2:
            answer = currentAnswers[1]
        case answerButton3:
            answer = currentAnswers[2]
        default:
            break
        }
        
        if answer != nil {
            queryCriteria[question.attribute] = answer.value as Any
        }
        
        if sender.tag < 3 {
        recommendations = recommendations.filter { (chocolate) in
            let attribute = chocolate.value(forKey: question.attribute) as? String
            print("attribute: \(attribute)")
            print("collection ref: \(collectionRef)")
            let criteriaMet = attribute!.contains(answer.value)
            print(criteriaMet)
            return criteriaMet
            
        
            
        }
            
            if sender.tag < 3 && questionIndex < numberOfQuestions - 1 {
                refRecommendations = refRecommendations.whereField(question.attribute, isEqualTo: answer.value)
                
                }
            }
            
            
            if sender.tag == 1 && questionIndex < numberOfQuestions - 1
        }
        
        print("making recommendations")
        print(recommendations)
        nextQuestion()
    }
    
}
}

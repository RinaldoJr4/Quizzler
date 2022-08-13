//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var thirdButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateQuestion()
        secondButton.titleLabel?.text = "iosdjkaiosd"
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.titleLabel?.text ?? ""
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.questionNumber += 1
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
    }
    
    @objc func updateQuestion() {
/*        if questionNumber != quiz.count {
            questionLabel.text = quiz[questionNumber].text
        } else {
            questionNumber = 0
            questionLabel.text = quiz[questionNumber].text
        }
*/
        questionLabel.text = quizBrain.getQuestionText() // mexe na label de pergunta
        scoreLabel.text = "Score: \(quizBrain.getScore())" // mexe na no score
        progressBar.progress = quizBrain.getProgress()  // mexe na progressBar
        
        firstButton.backgroundColor = UIColor.clear     // mexe nos botões
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        firstButton.titleLabel?.text = quizBrain.getAnswers(button: 0)
        secondButton.titleLabel?.text = quizBrain.getAnswers(button: 1)
        thirdButton.titleLabel?.text = quizBrain.getAnswers(button: 2)
        
//        progressBar.progress = Float(questionNumber)/Float(quiz.count-1)
        
        /* METHOD 1 -> to make a Delay (Much easyer) but I'll follow the tutorial (with a Timer)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){ [self] in
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
        }
         */
    }
}

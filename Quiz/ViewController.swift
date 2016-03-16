//
//  ViewController.swift
//  Quiz
//
//  Created by Wilson Mejía on 14/03/16.
//  Copyright © 2016 NinjaLABS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var imgQuestion: UIImageView!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    
    @IBOutlet weak var viewFeedback: UIView!
    @IBOutlet weak var lbFeedback: UILabel!
    @IBOutlet weak var btnFeedback: UIButton!
    
    var questions: [Question]!
    
    var currentQuestion = 0
    var grade = 0.0
    var quizEnded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let q0answer0 = Answer(answer: "120 años", isCorrect: true)
        let q0answer1 = Answer(answer: "80 años", isCorrect: false)
        let q0answer2 = Answer(answer: "140 años", isCorrect: false)
        let question0 = Question(question: "Cuántos años en promedio vive un elefante Africado?", strImageFileName: "elefante", answers: [q0answer0, q0answer1, q0answer2])
        
        let q1answer0 = Answer(answer: "5,5 m", isCorrect: true)
        let q1answer1 = Answer(answer: "3,5 m", isCorrect: false)
        let q1answer2 = Answer(answer: "4,5 m", isCorrect: false)
        let question1 = Question(question: "Cuántos metros en promedio tiene una girafa macho adulta?", strImageFileName: "girafa", answers: [q1answer0, q1answer1, q1answer2])
        
        let q2answer0 = Answer(answer: "2300 kg", isCorrect: true)
        let q2answer1 = Answer(answer: "3300 kg", isCorrect: false)
        let q2answer2 = Answer(answer: "4300 kg", isCorrect: false)
        let question2 = Question(question: "Cuánto pesa en promedio un rinoceronte-branco macho adulto?", strImageFileName: "rinoceronte", answers: [q2answer0, q2answer1, q2answer2])

        let q3answer0 = Answer(answer: "64 km/h", isCorrect: true)
        let q3answer1 = Answer(answer: "74 km/h", isCorrect: false)
        let q3answer2 = Answer(answer: "54 km/h", isCorrect: false)
        let question3 = Question(question: "Cuál es la velocidad de una zebra?", strImageFileName: "zebra", answers: [q3answer0, q3answer1, q3answer2])
        
        questions = [question0, question1, question2, question3]
        
        startQuiz()
    }
    
    func startQuiz(){
        questions.shuffle()
        for(var i=0; i < questions.count; i++){
            questions[i].answers.shuffle()
        }
        quizEnded = false
        grade = 0.0
        currentQuestion = 0
        
        showQuestion(0) // muestra la primera pregunta
    }
    
    func showQuestion(questionid: Int){

        btnAnswer1.enabled = true
        btnAnswer2.enabled = true
        btnAnswer3.enabled = true
        
        lbQuestion.text = questions[questionid].strQuestion
        imgQuestion.image = questions[questionid].imgQuestion
        btnAnswer1.setTitle(questions[questionid].answers[0].strAnswer, forState: UIControlState.Normal)
        btnAnswer2.setTitle(questions[questionid].answers[1].strAnswer, forState: UIControlState.Normal)
        btnAnswer3.setTitle(questions[questionid].answers[2].strAnswer, forState: UIControlState.Normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func chooseAnswer1(sender: AnyObject) {
        selectAnswer(0)
    }
    

    @IBAction func chooseAnswer2(sender: AnyObject) {
        selectAnswer(1)
    }
    
    @IBAction func chooseAnswer3(sender: AnyObject) {
        selectAnswer(2)
    }
    
    func selectAnswer(answerid: Int){
        btnAnswer1.enabled = false
        btnAnswer2.enabled = false
        btnAnswer3.enabled = false
        
        viewFeedback.hidden = false
        
        var answer: Answer = questions[currentQuestion].answers[answerid]
        
        if(answer.isCorrect == true){
            grade = grade + 1.0
            lbFeedback.text = answer.strAnswer + "\n\n Respuesta Correcta!"
        }else{
            lbFeedback.text = answer.strAnswer + "\n\n Respuesta Incorrecta..."
        }
        
        if (currentQuestion < questions.count - 1){
            btnFeedback.setTitle("Próxima", forState: UIControlState.Normal)
        }else{
            btnFeedback.setTitle("Ver Nota", forState: UIControlState.Normal)
        }
        
    }
    
    @IBAction func btnFeedbackAction(sender: AnyObject) {
        viewFeedback.hidden = true
        
        if quizEnded{
            startQuiz()
        }else{
            nextQuestion()
        }
    }
    
    func nextQuestion(){
        currentQuestion++
        if(currentQuestion < questions.count){
            showQuestion(currentQuestion)
        }else{
            endQuiz()
        }
    }
    
    func endQuiz(){
        grade = grade/Double(questions.count)*100.0
        quizEnded = true
        viewFeedback.hidden = false
        lbFeedback.text = "Su nota: \(grade)"
        btnFeedback.setTitle("Reintentar", forState: UIControlState.Normal)
    }
    
}


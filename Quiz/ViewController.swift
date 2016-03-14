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
        
        //Falta
        
        questions = [question0, question1]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func chooseAnswer1(sender: AnyObject) {
    }
    

    @IBAction func chooseAnswer2(sender: AnyObject) {
    }
    
    @IBAction func chooseAnswer3(sender: AnyObject) {
    }
    
    @IBAction func btnFeedbackAction(sender: AnyObject) {
    }
}


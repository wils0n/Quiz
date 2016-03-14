//
//  QuizModel.swift
//  Quiz
//
//  Created by Wilson Mejía on 14/03/16.
//  Copyright © 2016 NinjaLABS. All rights reserved.
//

import Foundation

import UIKit

class Question{
    var strQuestion: String!
    var imgQuestion: UIImage!
    var answers:[Answer]!
    
    init(question: String, strImageFileName: String, answers: [Answer]){
        self.strQuestion = question
        self.imgQuestion = UIImage(named: strImageFileName)
        self.answers = answers
    }
}

class Answer{
    var strAnswer: String!
    var isCorrect: Bool!
    
    init(answer: String, isCorrect:Bool){
        self.strAnswer = answer
        self.isCorrect = isCorrect
    }
    
}
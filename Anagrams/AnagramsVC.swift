//
//  AnagramsVC.swift
//  Anagrams
//
//  Created by Magdy Zamel on 8/7/17.
//  Copyright © 2017 Fxlab. All rights reserved.
//
import UIKit

class AnagramsVC: UIViewController {

    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var outputTextView: UITextView!

    @IBAction func processButtonTapped(){
        guard let input = inputTextView.text , !input.isEmpty() else {
            presentAlertWith(title: "Error", message: "Input is empty", actionTitle: "OK")
            outputTextView.text = ""
            return
        }
        let anagramsManager = AnagramsManager(content: input, contentSeparator: .newlines)
        outputTextView.text = anagramsManager.getSortedAnagramsWithSeparator(separator: ",")

    }
}
extension AnagramsVC{

    func presentAlertWith(title:String, message:String, actionTitle:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}


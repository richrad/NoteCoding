//
//  ViewController.swift
//  NoteCoding
//
//  Created by Richard Allen on 6/10/15.
//  Copyright (c) 2015 Lapdog. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
/*
    We load our note with `Note.loadNote()` so we don't have to check if the app has been run before or not. We'll get the Note we wanted either way.
*/
    var note = Note.loadNote()

/*
    We populate the text field with the text from the note.
*/
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = note.text
    }

/*
    When the save button is pressed we copy the text from the text field back into the note and tell the note to save itself.
*/
    @IBAction func saveButtonPressed(sender: AnyObject) {
        note.text = textField.text
        note.saveNoteData()
    }
}


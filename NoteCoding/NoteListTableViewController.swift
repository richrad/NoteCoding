//
//  NotesListTableViewController.swift
//  NoteCoding
//
//  Created by Richard Allen on 6/23/15.
//  Copyright (c) 2015 Lapdog. All rights reserved.
//

import UIKit

class NoteListTableViewController: UITableViewController {

    var noteList = NoteList.loadNoteList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteList.notes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        let note = noteList.notes[indexPath.row]
        cell.textLabel?.text = note.text
        return cell
    }
    
    @IBAction func addNote(sender: AnyObject) {
        let newNote = Note()
        newNote.text = "Call me Ishmael. Some years ago – never mind how long precisely - having little or no money in my purse, and nothing particular to interest me on shore, I thought I would sail about a little and see the watery part of the world."
        noteList.notes.append(newNote)
        noteList.saveNoteData()
        tableView.reloadData()
    }
    
    @IBAction func deleteNote(sender: AnyObject) {
        if noteList.notes.count > 0 {
            noteList.notes.removeLast()
            noteList.saveNoteData()
            tableView.reloadData()
        }
    }
    
}
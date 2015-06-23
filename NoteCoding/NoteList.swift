//
//  NoteList.swift
//  NoteCoding
//
//  Created by Richard Allen on 6/23/15.
//  Copyright (c) 2015 Lapdog. All rights reserved.
//

import UIKit

class NoteList: NSObject, NSCoding {
    
    var notes = [Note]()
    
    override init() {
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(notes, forKey: "NotesKey")
    }
    
    required init(coder aDecoder: NSCoder) {
        if let notes = aDecoder.decodeObjectForKey("NotesKey") as? [Note] {
            self.notes = notes
        }
    }
    
    class func dataPath() -> String {
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
        let dataPath = documentsDirectory.stringByAppendingPathComponent("NoteData.plist")
        return dataPath
    }
    
    func saveNoteData() {
        NSKeyedArchiver.archiveRootObject(self, toFile: NoteList.dataPath())
    }
    
    class func loadNoteList() -> NoteList {
        if let noteList = NSKeyedUnarchiver.unarchiveObjectWithFile(NoteList.dataPath()) as? NoteList {
            return noteList
        } else {
            return NoteList()
        }
    }
}

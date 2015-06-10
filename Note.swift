//
//  Note.swift
//  NoteCoding
//
//  Created by Richard Allen on 6/10/15.
//  Copyright (c) 2015 Lapdog. All rights reserved.
//

import UIKit

/*
    The Note object has just one property – text – and all of its functions revolve around saving and loading that property. It has to inherit from NSObject and implement the NSCoding protocol.
*/

class Note: NSObject, NSCoding {
    
    var text = ""
    
/*
    This init is required.
*/
    override init() {
        super.init()
    }

/*
    This function tells iOS what properties we want to save and assigns them "Keys" we can retrieve them with later. We just have the one property so that's what we save here.
*/
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "NoteTextKey")
    }
    
/*
    This is the opposite of the last function – it looks for an object with the key we specify and then puts it into the property. This is how we recreate our object when we load it. (We use `if let` and `as?` just in case the decoder doesn't find any data to go with the key we gave it.)
*/
    required init(coder aDecoder: NSCoder) {
        if let text = aDecoder.decodeObjectForKey("NoteTextKey") as? String {
            self.text = text
        }
    }
    
/*
    This is just for convenience and returns the path to the file where we save our data. Don't worry if this looks confusing to you – it's just kind of weird.
*/
    class func dataPath() -> String {
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as! String
        let dataPath = documentsDirectory.stringByAppendingPathComponent("NoteData.plist")
        return dataPath
    }
    
    
/*
    This is how we save the note. The NSKeyedArchiver goes to our object and says "What should I do to save you?" Our object says "Just do this stuff I wrote in `encodeWithCoder`!" Then the NSKeyedArchiver writes the data to your device.
*/
    func saveNoteData() {
        NSKeyedArchiver.archiveRootObject(self, toFile: Note.dataPath())
    }
    
/*
    This is the inverse of what we do in `saveNoteData` – the NSKeyedUnarchiver looks for a file at `Note.dataPath()` and if it finds one it follows the instructions in `init(coder)` to recreate it. If it doesn't find a file or if the file doesn't load correctly, it just returns a new Note object instead. This is handy for the first time the app is run and nothing has been saved yet.
*/
    class func loadNote() -> Note {
        if let note = NSKeyedUnarchiver.unarchiveObjectWithFile(Note.dataPath()) as? Note {
            return note
        } else {
            return Note()
        }
    }
    

    
}

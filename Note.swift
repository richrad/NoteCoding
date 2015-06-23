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
}

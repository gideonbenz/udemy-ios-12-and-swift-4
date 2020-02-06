//
//  Thought.swift
//  RNDM
//
//  Created by omrobbie on 06/02/20.
//  Copyright © 2020 omrobbie. All rights reserved.
//

import Foundation
import Firebase

class Thought {

    private(set) var documentId: String!
    private(set) var category: String!
    private(set) var numComments: Int!
    private(set) var numLikes: Int!
    private(set) var thoughtTxt: String!
    private(set) var timestamp: Date!
    private(set) var username: String!

    init(documentId: String, category: String, numComments: Int, numLikes: Int, thoughtTxt: String, timestamp: Date, username: String) {
        self.documentId = documentId
        self.category = category
        self.numComments = numComments
        self.numLikes = numLikes
        self.thoughtTxt = thoughtTxt
        self.timestamp = timestamp
        self.username = username
    }

    class func parseData(snapshot: QuerySnapshot?) -> [Thought] {
        var thoughts = [Thought]()
        guard let snapshot = snapshot else {return thoughts}

        for document in snapshot.documents {
            let data = document.data()
            let documentId = document.documentID

            let category = data[CATEGORY] as? String ?? ""
            let numComments = data[NUM_COMMENTS] as? Int ?? 0
            let numLikes = data[NUM_LIKES] as? Int ?? 0
            let thoughtTxt = data[THOUGHT_TXT] as? String ?? ""
            let timestamp = data[TIMESTAMP] as? Date ?? Date()
            let username = data[USERNAME] as? String ?? "Anonymous"

            let newThought = Thought(documentId: documentId, category: category, numComments: numComments, numLikes: numLikes, thoughtTxt: thoughtTxt, timestamp: timestamp, username: username)

            thoughts.append(newThought)
        }

        return thoughts
    }
}

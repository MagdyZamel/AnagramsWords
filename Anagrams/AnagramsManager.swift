//
//  AnagramsManager.swift
//  Anagrams
//
//  Created by Magdy Zamel on 8/8/17.
//  Copyright © 2017 Fxlab. All rights reserved.
//

import Foundation
class AnagramsManager{
    private var content:String!
    private var contentArray:[String]!
    private var contentSeparator:CharacterSet

    init(content:String ,contentSeparator:CharacterSet) {
        self.content = content
        self.contentSeparator = contentSeparator
        self.contentArray = content.splitIntoArray(separatedBy: CharacterSet.newlines)
    }

    private func contentArrayToSet(contentArray:[String]) -> Set<String> {
        var contentSet = Set<String>()
        contentArray.forEach { (value) in
            contentSet.insert(value)
        }
        return contentSet
    }

     func getAnagrams() -> [String:[String]] {
        let contentSet = contentArrayToSet(contentArray: self.contentArray)
        var anagramsDict = [String:[String]]()
        contentSet.forEach { (word) in
            let wordLowercased = word.lowercased()
            //            let wordWithOutSpaces = wordLowercased.trimmingWhitespaces()
            let sortedCharacters = wordLowercased.characters.sorted()
            let key = String(sortedCharacters).trimmingWhitespaces()
            if var array = anagramsDict[key]{
                array.append(word)
                anagramsDict[key] = array.sorted()
            }else{
                anagramsDict[key] = [word]
            }
        }
        anagramsDict.removeValue(forKey: "")
        return anagramsDict
    }

    func sort(anagrams:[String:[String]]) -> [[String]] {
        var anagramsArray = [[String]]()
        anagrams.forEach({ (key: String, value: [String]) in
            anagramsArray.append(value)

        })
        return anagramsArray.sorted{ $0[0] < $1[0] }
    }

    func getSortedAnagramsWithSeparator(separator:String) -> String {
        var textAnagram = ""
        let dicAnagram = self.getAnagrams()
        let arrayAnagram =  self.sort(anagrams: dicAnagram)
        arrayAnagram.forEach { (row) in
            var line = ""
             row.forEach{ (word) in
                if row.last != word{
                    line.append("\(word) \(separator) ")
                }else{
                    line.append("\(word)")
                }
            }
            textAnagram.append("\(line) \n")
        }
        return textAnagram
    }
}



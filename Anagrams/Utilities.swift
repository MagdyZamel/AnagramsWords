//
//  Utilities.swift
//  Anagrams
//
//  Created by Magdy Zamel on 8/7/17.
//  Copyright © 2017 Fxlab. All rights reserved.
//
import Foundation

extension String{
    func isEmpty()->Bool{
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).characters.count == 0
    }
    func splitIntoArray(separatedBy separated :CharacterSet)->[String]{
        return self.components(separatedBy: separated)
    }

    func trimmingWhitespaces()->String{
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }

}


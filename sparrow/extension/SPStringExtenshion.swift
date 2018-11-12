// The MIT License (MIT)
// Copyright © 2017 Ivan Vorobei (hello@ivanvorobei.by)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation
import UIKit

extension String {
    
    mutating func dropLast(substring: String) {
        if self.hasSuffix(substring) {
            self = String(dropLast(substring.count))
        }
    }
    
    mutating func dropFirst(substring: String) {
        if self.hasPrefix(substring) {
            self = String(dropFirst(substring.count))
        }
    }
    
    func uppercasedFirstLetter() -> String {
        let lowercaseSctring = self.lowercased()
        return lowercaseSctring.prefix(1).uppercased() + lowercaseSctring.dropFirst()
    }
    
    mutating func uppercaseFirstLetter() {
        self = self.uppercasedFirstLetter()
    }
    
    func removeAllSpaces() -> String {
         return self.components(separatedBy: .whitespaces).joined()
    }
    
    mutating func removeAllSpaces() {
        self = self.removeAllSpaces()
    }
    
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isLink: Bool {
        if let url = URL(string: self) {
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
    mutating func reduce(minimumFractionDigits: Int = 0, maximumFractionDigits: Int) {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = minimumFractionDigits
        formatter.maximumFractionDigits = maximumFractionDigits
        let int = Double(self)
        if int != nil {
            let number = NSNumber.init(value: int!)
            if var newValue = formatter.string(from: number) {
                newValue.replace(",", with: ".")
                self = newValue
            }
        }
    }
    
    mutating func replace(_ replacingString: String, with newString: String) {
        self = self.replacingOccurrences(of: replacingString, with: newString)
    }
}
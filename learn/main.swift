import Foundation

func countCharacter(in text: String) -> Int { text.count }

func reverseString(_ text: String) -> String { String(text.reversed()) }

func isPalindrome(_ text: String) -> Bool {
    let cleanedText = text.lowercased().filter { $0.isLetter || $0.isNumber }
    let reversedText = String(cleanedText.reversed())
    return cleanedText == reversedText
}

func mostFrequentCharacter(_ text: String) -> Character? {
    guard !text.isEmpty else { return nil }
    
    var frequencyMap: [Character: Int] = [:]
    
    for character in text {
        frequencyMap[character, default: 0] += 1
    }
    
    var mostFrequentCharacter: Character?
    var highestFrequency = 0
    
    for (character, frequency) in frequencyMap {
        if frequency > highestFrequency {
            mostFrequentCharacter = character
            highestFrequency = frequency
        } else if frequency == highestFrequency {
            mostFrequentCharacter = mostFrequentCharacter.map({ min($0, character) }) ?? character
        }
    }
    
    return mostFrequentCharacter
}

func wordFrequencies(in text: String) -> [String: Int] {
    
    let words = text.lowercased().split(separator: " ")
    var frequencyMap: [String: Int] = [:]
    
    for word in words {
        frequencyMap[String(word), default: 0] += 1
    }
    
    return frequencyMap
}

func firstUniqueWord(in text: String) -> String? {
    let words = text.lowercased().split(separator: " ")
    let frequencies = wordFrequencies(in: text)
    
    for word in words {
        if frequencies[String(word)] == 1 {
            return String(word)
        }
    }
    return nil

}

func compressString(_ text: String) -> String {
    guard !text.isEmpty else { return "" }
    
    var compressedString = ""
    var currentCharacter = text.first!
    var count = 1
    
    for character in text.dropFirst() {
        if character == currentCharacter {
            count += 1
        } else {
            compressedString.append(currentCharacter)
            compressedString.append(String(":"))
            compressedString += String(count) + " "
            
            currentCharacter = character
            count = 1
        }
    }
    compressedString.append(currentCharacter)
    compressedString.append(String(":"))
    compressedString += String(count) + " "
    
    return compressedString
}

func isMirror(_ text: String) -> Bool {
    text.lowercased() == String(text.lowercased().reversed())
}

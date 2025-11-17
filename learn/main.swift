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

func removeVowels(_ text: String) -> String {
    text.lowercased().filter { !"aeiou".contains($0)}
}

func commonLetters(between first: String, and second: String) -> Set<Character> {
    Set(first.lowercased()).intersection(Set(second.lowercased()))
}

func secondLargestNumber(in array: [Int]) -> Int? {
    guard array.count > 1 else { return nil }
    guard Set(array).count > 1 else { return nil }
    
    let maxValue = array.max()
    
    return array.filter { $0 != maxValue }.max()
}

func pairsWithSum(_ numbers: [Int], _ target: Int) -> [[Int]] {
    var pairs: [[Int]] = []
    
    for number in 0..<numbers.count {
        let element = numbers[number]
        
        for num in (number + 1)..<numbers.count {
            let secondElement = numbers[num]
            
            if element + secondElement == target && !pairs.contains([element, secondElement]){
                pairs.append([element, secondElement])
            }
        }
    }
    return pairs
}

func firstNegativeIndex(in numbers: [Int]) -> Int? {
    numbers.firstIndex { $0 < 0 }
}

func firstLargeEvenIndex(in number: [Int]) -> Int? {
    number.firstIndex { $0 % 2 == 0 && $0 > 10 }
}

func duplicateNumbers(in array: [Int]) -> [Int] {
    for num in array {
        if array.filter({$0 == num}).count > 1 {
            return [num]
        }
    }
    return []
}

func duplicateNumbersDictionary(in array: [Int]) -> [Int] {
    var duplicates: [Int: Int] = [:]
    var result: [Int] = []
    
    for num in array {
        duplicates[num, default: 0] += 1
    }
    
    for (key, value) in duplicates where value > 1 {
        result.append(key)
    }
    return result
    
}

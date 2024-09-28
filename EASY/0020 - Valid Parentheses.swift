Чтобы решить задачу, ты можешь использовать стек для отслеживания открывающихся скобок и проверять их закрытие в правильном порядке. Вот пошаговая инструкция:

1. **Создай пустой стек**.
2. Пройдись по каждому символу строки:
   - Если символ — открывающая скобка (`(`, `{`, или `[`), добавь её в стек.
   - Если символ — закрывающая скобка (`)`, `}`, или `]`), проверь следующее:
     - Стек не должен быть пустым (потому что закрывающая скобка без соответствующей открывающей — это ошибка).
     - Вытяни последнюю скобку из стека и проверь, является ли она соответствующей открывающей скобкой (например, для `)` должна быть `(`).
3. В конце проверь, что стек пуст:
   - Если стек пуст — все скобки закрыты правильно.
   - Если стек не пуст — это значит, что остались незакрытые скобки.

Этот алгоритм работает за линейное время и использует стек для отслеживания открытых скобок, что делает его эффективным.

Да, этот алгоритм называется **"проверка валидности скобочной последовательности с помощью стека"**. Обычно его относят к категории алгоритмов **поиска в глубину (DFS)** или **обратного отслеживания (Backtracking)**.

Иногда его также называют:

- **Алгоритм для проверки валидных скобок**.
- **Алгоритм балансировки скобок**.
- **Алгоритм проверки правильности скобочной последовательности**.

Но конкретного "официального" названия у него нет, так как он является классическим применением структуры данных "стек" для решения задачи на правильность парных символов.


class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = []
        
        // Словарь соответствий закрытых и открытых скобок
        let matchingBrackets: [Character: Character] = [")": "(", "}": "{", "]": "["]
        
        // Проходимся по каждому символу строки
        for char in s {
            // Если это закрывающая скобка
            if let matchingOpen = matchingBrackets[char] {
                // Проверяем, что стек не пуст и последний элемент в стеке — это соответствующая открывающая скобка
                if stack.popLast() != matchingOpen {
                    return false
                }
            } else {
                // Если это открывающая скобка, добавляем её в стек
                stack.append(char)
            }
        }
        
        // Если после обхода строки стек пуст, значит, все скобки закрыты правильно
        return stack.isEmpty
    }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = [Character]()
        var parentTypeDict: [Character: ParentType] = [
            "(" : .opened,
            "{" : .opened,
            "[" : .opened,
            ")" : .closed,
            "}" : .closed,
            "]" : .closed
        ]

         var checkDict: [Character: Character] = [
            ")" : "(",
            "}" : "{",
            "]" : "["
        ]

        for ch in s {
            if let currentType = parentTypeDict[ch] {
                if currentType == .opened {
                   stack.append(ch) 
                } else {
                    if let lastElement = stack.popLast() {
                        if let pair = checkDict[ch] {
                            if pair == lastElement {
                                continue
                            } else {
                                return false
                            }
                        }
                    }
                }
            }
        }

        return stack.isEmpty
    }

    enum ParentType {
        case opened
        case closed
    }
}


class Solution {
    func isValid(_ s: String) -> Bool {
        if s.count == 0 { return true }
        var mappingClosingBraceToOpeningBrace: [Character: Character] = [")": "(", "}": "{", "]": "["]
        var stack = [Character]()    
    
        for character in s {
            if let openingBrace = mappingClosingBraceToOpeningBrace[character] {
                var topElement = stack.isEmpty ? "#" : stack.removeLast()
                
                if openingBrace != topElement { 
                    return false 
                }
            } else { 
                stack.append(character) 
            }
        }
        return stack.isEmpty
    }
}

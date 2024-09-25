class Solution {
    func romanToInt(_ s: String) -> Int {
        let mappingRomanToInt: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        let romanCharacters = Array(s)
        var integer = 0
        var previousValue = 0

        for character in romanCharacters {
            if let value = mappingRomanToInt[character] {
                if value <= previousValue {
                    integer += value
                } else {
                    integer += (value - 2 * previousValue)
                }
                previousValue = value
            }
        }
        return integer
    }
}


class Solution {
    func romanToInt(_ s: String) -> Int {
        // Словарь для римских символов и их соответствующих значений
        let dict: [Character:Int] = ["I":1,"V":5,"X":10,"L":50,"C":100,"D":500,"M":1000]
        
        // 'out' хранит итоговое число, 'prev' используется для хранения предыдущего значения символа
        var out = 0, prev = 0
        
        // Проходим по каждому символу строки 's'
        for i in s {
            // Получаем значение текущего символа из словаря, если символ не найден, возвращаем 0
            let val = dict[i] ?? 0
            
            // Если текущее значение меньше или равно предыдущему, добавляем предыдущее значение
            // Если текущее значение больше предыдущего, вычитаем предыдущее (правило для римских чисел)
            out += (val <= prev) ? prev : -prev
            
            // Обновляем переменную 'prev', чтобы она содержала значение текущего символа для следующей итерации
            prev = val
        }
        
        // Добавляем последнее значение 'prev' к результату, поскольку оно еще не было добавлено
        out += prev
        
        // Возвращаем итоговое целое число
        return out
    }
}


func romanToInt(_ s: String) -> Int {
    // Словарь для римских символов и их значений
    let romanValues: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]
    
    var result = 0
    let characters = Array(s)  // Преобразуем строку в массив символов
    
    for i in 0..<characters.count {
        // Получаем текущее значение символа
        let current = romanValues[characters[i]]!
        
        // Если текущий символ не последний и он меньше следующего символа
        if i < characters.count - 1, current < romanValues[characters[i + 1]]! {
            result -= current  // Вычитаем текущее значение
        } else {
            result += current  // Прибавляем текущее значение
        }
    }
    
    return result
}

// Примеры использования
print(romanToInt("III"))    // 3
print(romanToInt("IV"))     // 4
print(romanToInt("IX"))     // 9
print(romanToInt("LVIII"))  // 58
print(romanToInt("MCMXCIV")) // 1994

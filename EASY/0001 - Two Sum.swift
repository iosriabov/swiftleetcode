1. Two Sum
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
You may assume that each input would have exactly one solution, and you may not use the same element twice.
You can return the answer in any order.
Example 1:
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
Example 2:
Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:
Input: nums = [3,3], target = 6
Output: [0,1]
Constraints:
2 <= nums.length <= 10^4
-10^9 <= nums[i] <= 10^9
-10^9 <= target <= 10^9
Only one valid answer exists.
Follow-up: Can you come up with an algorithm that is less than O(n²) time complexity?


Чтобы решить задачу "Two Sum" с эффективностью лучше, чем O(n²), можно использовать словарь (Dictionary) для хранения уже просмотренных чисел и их индексов. Это позволяет найти пару чисел, сумма которых равна целевому значению, за один проход по массиву.

**Шаги решения:**

1. **Инициализация словаря:**
   - Создайте пустой словарь `numDict`, где ключ — число из массива `nums`, а значение — его индекс.

2. **Проход по массиву:**
   - Итерируйтесь по массиву `nums` с помощью `enumerated()`, чтобы получить как значение элемента, так и его индекс.
   - Для каждого элемента `num` вычислите его дополнение `complement = target - num`.

3. **Проверка наличия дополнения:**
   - Проверьте, существует ли `complement` в словаре `numDict`.
     - **Если существует:** Вы нашли пару чисел, сумма которых равна `target`. Верните их индексы `[complementIndex, index]`.
     - **Если не существует:** Добавьте текущий элемент `num` в словарь с его индексом.

**Реализация на Swift:**

```swift
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var numDict = [Int: Int]() // Словарь для хранения чисел и их индексов

    for (index, num) in nums.enumerated() {
        let complement = target - num
        if let complementIndex = numDict[complement] {
            return [complementIndex, index]
        }
        numDict[num] = index
    }

    // По условию задачи решение всегда существует, но можно вернуть пустой массив в случае ошибки
    return []
}
```

**Важные моменты:**

- **Эффективность O(n):** Использование словаря позволяет выполнять операции поиска за O(1), что снижает общую временную сложность до O(n).
- **Обработка коллизий:** При наличии одинаковых чисел в массиве важно правильно хранить и извлекать их индексы.
- **Безопасное извлечение из словаря:** Использование `if let` обеспечивает безопасное извлечение значения из словаря, предотвращая возможные ошибки.
- **Гарантия решения:** По условию задачи, всегда существует единственное решение, поэтому дополнительная проверка на существование пары не требуется.
- **Тестирование на краевых случаях:** Рекомендуется протестировать функцию на различных входных данных, включая отрицательные числа и нули.

**Пример использования:**

```swift
let result = twoSum([2, 7, 11, 15], 9)
print(result) // Вывод: [0, 1]
```

**Заключение:**

Используя словарь для хранения ранее просмотренных чисел, мы можем эффективно найти два числа, сумма которых равна заданному значению, за один проход по массиву. Это решение значительно оптимизирует производительность по сравнению с наивным подходом с вложенными циклами.


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count < 2 { return [] }
        var mappingNumberToIndex = [Int: Int]()
    
        for (index, number) in nums.enumerated() {
            if let secondIndex = mappingNumberToIndex[target - number] {
                return [index, secondIndex]
            }
            mappingNumberToIndex[number] = index 
        }
        return []
    }
}

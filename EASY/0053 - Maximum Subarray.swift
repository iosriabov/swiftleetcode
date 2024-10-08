Хорошо, давай привяжем массив `[-2, 1, -3, 4, -1, 2, 1, -5, 4]` к дням недели и разберем, как алгоритм работает по каждому дню.

### Исходные данные:

Пусть наш массив — это результаты по дням недели:

- **Понедельник:** -2 очка
- **Вторник:** +1 очко
- **Среда:** -3 очка
- **Четверг:** +4 очка
- **Пятница:** -1 очко
- **Суббота:** +2 очка
- **Воскресенье:** +1 очко
- Дополнительный понедельник: -5 очков
- Дополнительный вторник: +4 очка

Теперь давай разберем алгоритм, шаг за шагом, как если бы ты принимал решение каждый день:

### Пошаговый разбор:

1. **Понедельник: -2 очка**
   - Ты начал неделю, и понедельник оказался убыточным: -2 очка.
   - **Текущий результат (currentSum): -2**
   - **Максимальный результат на данный момент (maxSum): -2**
   
   Пока ничего хорошего, но это только начало.

2. **Вторник: +1 очко**
   - Теперь ты думаешь:
     - Если продолжить с понедельника: `-2 + 1 = -1`.
     - Если начать заново: просто `+1`.
   - Начать с вторника выгоднее, потому что +1 лучше, чем -1.
   - **Текущий результат (currentSum): 1**
   - **Максимальный результат (maxSum): 1**

   Вторник стал лучшим днем недели на данный момент, потому что +1 — это лучшее, что у нас было.

3. **Среда: -3 очка**
   - Что делать?
     - Если продолжить с вторника: `1 - 3 = -2`.
     - Если начать заново с среды: `-3`.
   - Продолжить с вторника выгоднее, так как -2 лучше, чем -3.
   - **Текущий результат (currentSum): -2**
   - **Максимальный результат (maxSum): 1** (не меняется, потому что 1 — это лучше, чем -2)

   Среда явно плохой день. Пока лучший результат — вторник с 1 очком.

4. **Четверг: +4 очка**
   - Рассмотрим варианты:
     - Если продолжить с предыдущего дня (среда): `-2 + 4 = 2`.
     - Если начать заново с четверга: `+4`.
   - Очевидно, лучше начать с четверга, потому что 4 лучше, чем 2.
   - **Текущий результат (currentSum): 4**
   - **Максимальный результат (maxSum): 4**

   Четверг стал лучшим днем недели!

5. **Пятница: -1 очко**
   - Рассмотрим варианты:
     - Если продолжить с четверга: `4 - 1 = 3`.
     - Если начать заново: `-1`.
   - Продолжать с четверга выгоднее, потому что 3 лучше, чем -1.
   - **Текущий результат (currentSum): 3**
   - **Максимальный результат (maxSum): 4** (не меняется, так как 4 — это лучше, чем 3)

   Пятница дала небольшой откат, но четверг все еще наш лучший день.

6. **Суббота: +2 очка**
   - Рассмотрим варианты:
     - Если продолжить с пятницы: `3 + 2 = 5`.
     - Если начать заново: `+2`.
   - Продолжать с пятницы выгоднее, потому что 5 лучше, чем 2.
   - **Текущий результат (currentSum): 5**
   - **Максимальный результат (maxSum): 5**

   Теперь лучший результат — сумма с четверга по субботу (4 - 1 + 2 = 5).

7. **Воскресенье: +1 очко**
   - Рассмотрим варианты:
     - Если продолжить с субботы: `5 + 1 = 6`.
     - Если начать заново: `+1`.
   - Продолжать с субботы выгоднее, потому что 6 лучше, чем 1.
   - **Текущий результат (currentSum): 6**
   - **Максимальный результат (maxSum): 6**

   Теперь лучший результат — сумма с четверга по воскресенье (4 - 1 + 2 + 1 = 6).

8. **Дополнительный понедельник: -5 очков**
   - Рассмотрим варианты:
     - Если продолжить с воскресенья: `6 - 5 = 1`.
     - Если начать заново: `-5`.
   - Продолжать с воскресенья выгоднее, потому что 1 лучше, чем -5.
   - **Текущий результат (currentSum): 1**
   - **Максимальный результат (maxSum): 6** (не меняется)

   Этот понедельник явно не лучший день, но мы остаемся на плаву.

9. **Дополнительный вторник: +4 очка**
   - Рассмотрим варианты:
     - Если продолжить с понедельника: `1 + 4 = 5`.
     - Если начать заново: `+4`.
   - Продолжать с понедельника выгоднее, потому что 5 лучше, чем 4.
   - **Текущий результат (currentSum): 5**
   - **Максимальный результат (maxSum): 6** (не меняется, так как 6 лучше, чем 5)

### Итог

Лучший период за эту неделю — это с четверга по воскресенье, когда ты набрал 6 очков (4 - 1 + 2 + 1 = 6). 

### Суть решения

Каждый день ты решаешь:
1. Продолжать ли текущий период (если это выгодно и текущая сумма положительная или небольшая).
2. Или начать новый период (если текущий результат слишком плохой).

В итоге ты находишь самый удачный непрерывный отрезок из дней, который дал максимальную прибыль!

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var curSum = nums[0], maxSum = nums[0]
        for i in 1..<nums.count {
            curSum = max(nums[i], curSum + nums[i])
            maxSum = max(maxSum, curSum)
        }
        return maxSum
    }
}

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var n = nums.count
        var nums = nums
        var maximumSum = nums[0]
        for index in 1..<n {
            if nums[index - 1] > 0 {
                nums[index] = max(nums[index], nums[index] + nums[index - 1])
            }
            maximumSum = max(maximumSum, nums[index])
        }
        return maximumSum
    }
}

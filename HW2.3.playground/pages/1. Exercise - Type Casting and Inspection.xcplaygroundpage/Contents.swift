/*:
 ## Упражнение - приведение типов и их контроль
 
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */
let items: [Any] = ["Apple", 3.14, false, 42, "Swift", 5.5, true, 13]

for item in items { print(item) }
/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */
print()

for item in items {
    switch item {
    case is Int: print("Целое число \(item)")
    case is Double: print("Вещественное число \(item)") // Можно добавить еще is Float, но сейчас нет смысла
    case is String: print("Строка \(item)")
    case is Bool: print("Булево \(item)")
    default: break
    }
}
/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите пары ключ/значения для всех элементов коллекции.
 */
print()

let dictionary: [String: Any] = ["A": 1.0,
                                 "B": 3,
                                 "C": "Cat",
                                 "D": true,
                                 "E": "10",
                                 "F": false,
                                 "G": 4,
                                 "H": 0.5]

for item in dictionary { print("\(item.key): \(item.value)") }

/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */
print()
var total = 0.0

// Советовали не пользоваться парами из is и as в одном месте,
// поэтому вот реализация без них:

for (_, value) in dictionary {
    if let value = value as? Int {
        total += Double(value)
    } else if let value = value as? Double {
        total += value
    } else if value is String {
        total += 1
    } else if let value = value as? Bool {
        total += value ? 2 : -3
    }
}

print(total)

total = 0

// Но по мне так такой вариант лаконичнее и лучше читается:

for (_, value) in dictionary {
    switch value {
    case is Int: total += Double(value as! Int)
    case is Double: total += value as! Double
    case is String: total += 1
    case is Bool: total += value as! Bool ? 2 : -3
    default: break
    }
}

print(total)
/*:
 Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */
total = 0

for (_, value) in dictionary {
    switch value {
    case is Int: total += Double(value as! Int)
    case is Double: total += value as! Double
    case is String: total += Double(value as! String) ?? 0
    default: break
    }
}

print(total)
//: страница 1 из 2  |  [Далее: упражнение для приложения - типы тренировок](@next)

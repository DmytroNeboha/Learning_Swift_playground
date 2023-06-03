import Foundation




// Патрены проэетирования. Книга Усова, 6 издание



// 39.1. Паттерн MVC. Фреймворк Cocoa Touch


/*
 
 Данный шаблон подразумевает разделение всех составляющих проэкта на три категории:
 
 1. Модель - объекты, обеспечивающие хранение данных ваших приложений и логику их обработки.
 2. Отображение(Представление) - объекты, описывающие различные графические элементы, которые видит пользователь при работе с приложением.
 3. Контроллер - объекты, обеспечивающие совместную работу "Отображения" и "Модели"
 
 
 */


// Все возможности по разработке iOS-приложений обеспечивает iOS SDK



// 39.2. Паттерн Singleton. Класс UIApplication



// при попытке доступа к данному свойству из любого другого класса будет возвращен один и тот же экземпляр:
class Prefences {
    static let shared = Prefences()
    
    // произвольные настройки проэкта
    var backgroundColor: UIColor = .white
    var defaultUserLogin = "Guest"
}

// получаем класс с насстройками с помощю Singleton-свойства
Prefences.shared.defaultUserLogin
Prefences.shared.backgroundColor


// или получаем ссылку на класс и записываем в произвольный параметр
var pref = Prefences.shared
pref.backgroundColor = .red
Prefences.shared.backgroundColor



// 39.3. Паттерн Delegation. Класс UIApplicationDelegate




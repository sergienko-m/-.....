# Практична робота 3 — Hello World у Flutter

**Дисципліна:** Програмування для мобільних платформ
**Варіант 1:** Візитівка розробника

## Що зроблено

Одноекранний застосунок-візитівка:

- `CircleAvatar` з ініціалами, ім'я та спеціальність;
- 4 контакти (іконка + підпис), кожен — окремий рядок на базі багаторазового віджета `ContactCard`;
- кнопка «Змінити тему» перемикає світлу й темну тему;
- стан теми (`ThemeMode`) зберігається у `State` віджета `DevCardApp` (`StatefulWidget`);
- кольори беруться через `Theme.of(context)`, жорстко заданих кольорів у віджетах немає.

## Структура коду

```
lib/
├── main.dart                         # точка входу
├── app.dart                          # DevCardApp (StatefulWidget), світла й темна теми
├── models/contact.dart               # модель контакту
├── screens/business_card_screen.dart # екран візитівки
└── widgets/contact_card.dart         # картка контакту (використана 4 рази)
test/widget_test.dart                 # перевірка перемикання теми і кількості контактів
docs/                                 # скриншоти
```

`dispose()`: у застосунку немає контролерів, слухачів і таймерів, тому звільняти нічого.

## Середовище

Windows 10, Flutter 3.47.6 (stable), Dart 3.13.5, Android SDK 36.0.0, VS Code, Android Studio.
Цільова платформа для запуску — **Web (Chrome/Edge)**.

## Як запустити

```bash
flutter pub get
flutter analyze
flutter test
flutter run -d web-server --web-port 8080
```

Після останньої команди відкрийте у браузері `http://localhost:8080`.

## Результати перевірок

| Перевірка | Результат |
|---|---|
| `flutter analyze` | No issues found! |
| `flutter test` | All tests passed! (2 тести) |
| `flutter doctor` | Flutter, Android toolchain, Chrome (web), Connected device, Network resources — ✓. Visual Studio (збірка застосунків Windows desktop) — не налаштовано, до цільової платформи не належить |

## Скриншоти

- [flutter doctor](docs/flutter-doctor.png)
- [Застосунок, світла тема](docs/app-light.png)
- [Застосунок, темна тема](docs/app-dark.png)

Запуск на емуляторі й реальному пристрої не виконувався (див. «Труднощі»).

## Hot Reload / Hot Restart

## Hot Reload / Hot Restart

Експеримент проведено на запущеному застосунку (`flutter run -d web-server`).

1. У застосунку увімкнено темну тему кнопкою «Змінити тему».
2. У файлі `business_card_screen.dart` тимчасово змінено текст спеціальності з «Flutter-розробник» на «Мобільний розробник».
3. **Hot Reload (`r`):** новий текст з'явився одразу, а темна тема збереглася.
4. **Hot Restart (`R`):** застосунок перезапустився, тема повернулась до початкової світлої.

| Дія | Нова спеціальність | Стан теми |
|---|---|---|
| Hot Reload (`r`) | з'явилась | збережений (темна) |
| Hot Restart (`R`) | відображається | скинутий (світла) |

**Пояснення.** Hot Reload підставляє змінений код у працюючу Dart VM і перебудовує віджети методом `build()`. Об'єкт `State` при цьому лишається, тому `_themeMode` не змінюється. Hot Restart перезапускає застосунок з нуля, створює `State` заново, і поле `_themeMode` отримує початкове значення `ThemeMode.light`.

## Труднощі та їх розв'язання

1. **Кирилиця в імені користувача Windows.** Flutter SDK, завантажений у домашню папку (`C:\Users\<ім'я>\flutter`), ламав `flutter doctor`: перевірка Flutter завершувалась помилкою `FileSystemException` через нечитабельний шлях. Розв'язання: перенесено SDK в `C:\dev\flutter` і оновлено змінну `PATH`.
2. **Нестача місця на диску C:.** Завантаження системного образу Android (1,5 ГБ) зупинилось через помилку `There is not enough space on the disk`. Розв'язання: видалено непотрібні образи й тимчасові файли.
3. **Емулятор не запустився.** Емулятор з Android 17 (API 37) не підключився протягом 5 хвилин: ноутбук має лише ~5,9 ГБ оперативної пам'яті. Тому застосунок запущено в браузері як веб-версію, а запуск на емуляторі й пристрої не виконувався.
4. **Windows Hypervisor Platform.** Android Studio повідомила, що вона вимкнена; її увімкнено й перезавантажено комп'ютер.
5. **`flutter run -d edge` зависав** на очікуванні підключення до debug-сервісу. Розв'язання: запуск через `flutter run -d web-server --web-port 8080` і відкриття `localhost:8080` у браузері.
6. **Chrome не знайдено у `flutter doctor`.** Розв'язання: `set CHROME_EXECUTABLE=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe`.

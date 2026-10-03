import 'package:dev_card/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Кнопка перемикає світлу й темну тему', (tester) async {
    await tester.pumpWidget(const DevCardApp());

    var app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.themeMode, ThemeMode.light);

    await tester.tap(find.text('Змінити тему'));
    await tester.pump();

    app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.themeMode, ThemeMode.dark);
  });

  testWidgets('Показано 4 контакти', (tester) async {
    await tester.pumpWidget(const DevCardApp());
    expect(find.byType(ListTile), findsNWidgets(4));
  });
}

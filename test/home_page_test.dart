import 'package:flutter_test/flutter_test.dart';
import 'package:care_connecet/pages/home_page/home_page_widget.dart';
import 'package:flutter/material.dart';

void main() {
  group('Home Page Unit Tests', () {
    testWidgets('Home page displays navigation buttons', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomePageWidget(),
        ),
      );

      expect(find.text('تتبع الوجبات'), findsOneWidget);
      expect(find.text('تتبع النوم'), findsOneWidget);
      expect(find.text('جدول اللقاحات'), findsOneWidget);
      expect(find.text('مكتبة الانشطة'), findsOneWidget);
    });

    testWidgets('Drawer opens and displays navigation options', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: HomePageWidget(),
        ),
      );

      final drawerButton = find.byIcon(Icons.dehaze);
      await tester.tap(drawerButton);
      await tester.pump();

      expect(find.text('الصفحة الرئيسية'), findsOneWidget);
      expect(find.text('بروفايل الطفل'), findsOneWidget);
    });
  });
}

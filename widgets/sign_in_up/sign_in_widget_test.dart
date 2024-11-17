import 'package:care_connecet/pages/sign_in/sign_in_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  group('اختبارات واجهة تسجيل الدخول', () {
    testWidgets('عرض عناصر صفحة تسجيل الدخول بشكل صحيح', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SignInWidget()));

      // التحقق من عرض النصوص الأساسية
      expect(find.text('البريد الاكتروني'), findsOneWidget);
      expect(find.text('كلمة السر'), findsOneWidget);
    });

    testWidgets('اختبار زر تسجيل الدخول', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SignInWidget()));

      // العثور على زر تسجيل الدخول والتحقق من تفاعله
      final signInButton = find.text('تسجيل الدخول');
      expect(signInButton, findsOneWidget);
      await tester.tap(signInButton);
      await tester.pump();
    });
  });
}

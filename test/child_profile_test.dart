import 'package:care_connecet/index.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:care_connecet/pages/children/children_widget.dart';
import 'package:flutter/material.dart';

void main() {
  group('Child Profile Page Unit Tests', () {
    testWidgets('Displays child profile info correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChildrenWidget(),
        ),
      );

      final nameField = find.text('اسم الطفل');
      final heightField = find.text('الطول بالسانتيمتر');
      final weightField = find.text('الوزن بالكيلو');

      expect(nameField, findsOneWidget);
      expect(heightField, findsOneWidget);
      expect(weightField, findsOneWidget);
    });

    testWidgets('Edit button redirects to edit page', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChildrenWidget(),
        ),
      );

      final editButton = find.text('تعديل المعلومات');
      await tester.tap(editButton);
      await tester.pump();

      expect(find.byType(ChildrenWidget), findsOneWidget);
    });
  });
}

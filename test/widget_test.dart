import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project1/main.dart';

void main() {
  testWidgets('Landing page smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}

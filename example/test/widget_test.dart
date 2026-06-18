import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:installer_info_example/main.dart';

void main() {
  testWidgets('Verify installer info is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is Text && widget.data!.startsWith('Installed by:'),
      ),
      findsOneWidget,
    );
  });
}

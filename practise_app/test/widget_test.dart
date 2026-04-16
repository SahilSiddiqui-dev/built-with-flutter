import 'package:flutter_test/flutter_test.dart';
import 'package:Stride/main.dart';

void main() {
  testWidgets('App starts test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our app shows the title "Focus List".
    expect(find.text('Focus List'), findsOneWidget);
  });
}

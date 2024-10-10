import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

//import 'package:news_reader_app/main.dart'; // Make sure to adjust the import path to your actual main.dart file

void main() {
  testWidgets('News app loads and shows title', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    //await tester.pumpWidget( NewsListScreen());

    // Verify if the app shows the expected title "Daily Times".
    expect(find.text('Daily Times'), findsOneWidget);

    // Verify if the ListView contains the news articles.
    expect(find.byType(ListView), findsOneWidget);

    // Optionally, check if a specific news article is loaded.
    expect(find.text('Supreme Court Ruling on Article 370'), findsOneWidget);
  });
}
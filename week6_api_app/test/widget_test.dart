import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:week6_api_app/main.dart';
import 'package:week6_api_app/viewmodels/article_viewmodel.dart';

void main() {
  testWidgets('News Hub smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ArticleViewModel()),
        ],
        child: const MyApp(),
      ),
    );

    // Verify that the app bar title is correct.
    expect(find.text('Latest News'), findsOneWidget);
    
    // Check if loading indicator is shown initially (before frame completes)
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}

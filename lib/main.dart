import 'package:flutter/material.dart';
import 'package:test_gpt_chat_mobile/constants/diamond_theme.dart';
import 'package:test_gpt_chat_mobile/providers/diamond_active_theme_provider.dart';
import 'package:test_gpt_chat_mobile/screens/diamond_chat_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTheme = ref.watch(activeThemeProvider);
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: activeTheme == Themes.dark ? ThemeMode.dark : ThemeMode.light,
      home: const ChatScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_gpt_chat_mobile/providers/diamond_active_theme_provider.dart';

class ThemeSwither extends ConsumerStatefulWidget {
  const ThemeSwither({super.key});

  @override
  ConsumerState<ThemeSwither> createState() => _ThemeSwitherState();
}

class _ThemeSwitherState extends ConsumerState<ThemeSwither> {
  void toggleTheme(bool value) {
    ref.read(activeThemeProvider.notifier).state =
        value ? Themes.dark : Themes.light;
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      activeColor: Theme.of(context).colorScheme.secondary,
      value: ref.watch(activeThemeProvider) == Themes.dark,
      onChanged: toggleTheme,
    );
  }
}

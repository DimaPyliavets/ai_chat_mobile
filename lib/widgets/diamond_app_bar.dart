import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_gpt_chat_mobile/constants/string.dart';
import 'package:test_gpt_chat_mobile/providers/diamond_active_theme_provider.dart';
import 'package:test_gpt_chat_mobile/widgets/diamond_theme_switcher.dart';

class DiamondAppBar extends StatelessWidget implements PreferredSize {
  const DiamondAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        app_bar_text,
        style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontFamily: 'OpenSans',
            ),
      ),
      actions: [
        Row(
          children: [
            Consumer(
                builder: ((context, ref, child) => Icon(
                    ref.watch(activeThemeProvider) == Themes.dark
                        ? Icons.light_mode
                        : Icons.dark_mode))),
            const SizedBox(
              width: 8,
            ),
            const ThemeSwither(),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget get child => throw UnimplementedError();
}

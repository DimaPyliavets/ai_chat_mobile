import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_gpt_chat_mobile/providers/diamond_chat_provider.dart';
import 'package:test_gpt_chat_mobile/widgets/diamond_app_bar.dart';
import 'package:test_gpt_chat_mobile/widgets/diamond_chat_item.dart';
import 'package:test_gpt_chat_mobile/widgets/diamond_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DiamondAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              final chats = ref.watch(chatsProvider);
              return ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) => DiamondChatItem(
                  text: chats[index].message,
                  isMe: chats[index].isMe,
                ),
              );
            }),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: DiamondField(),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

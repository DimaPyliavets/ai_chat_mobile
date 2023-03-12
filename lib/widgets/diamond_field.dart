import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_gpt_chat_mobile/constants/string.dart';
import 'package:test_gpt_chat_mobile/models/diamond_chat_model.dart';
import 'package:test_gpt_chat_mobile/providers/diamond_chat_provider.dart';
import 'package:test_gpt_chat_mobile/services/diamond_ai_handler.dart';
import 'package:test_gpt_chat_mobile/widgets/diamond_button.dart';

enum InputMode {
  text,
  voice,
}

class DiamondField extends ConsumerStatefulWidget {
  const DiamondField({super.key});

  @override
  ConsumerState<DiamondField> createState() => _DiamondFieldState();
}

class _DiamondFieldState extends ConsumerState<DiamondField> {
  InputMode _inputMode = InputMode.voice;
  final _messageController = TextEditingController();
  final AIHandler _openAI = AIHandler();
  var _isReplying = false;

  @override
  void dispose() {
    _messageController.dispose();
    //_openAI.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            onChanged: (value) {
              value.isNotEmpty
                  ? setInputMode(InputMode.text)
                  : setInputMode(InputMode.voice);
            },
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            minLines: 1,
            maxLines: 10,
            style: const TextStyle(fontSize: 18),
            decoration: InputDecoration(
              hintText: write_here,
              hintStyle: TextStyle(
                fontStyle: FontStyle.normal,
                color: Colors.grey[400],
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.primary,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),

        ),
        const SizedBox(
          width: 5,
        ),
        DiamondButton(
          isReplying: _isReplying,
          inputMode: _inputMode,
          sendTextMessage: () {
            final message = _messageController.text;
            _messageController.clear();
            sendTextMessage(message);
          },
          sendVoiceMessage: sendVoiceMessage,
        ),
      ],
    );
  }

  void setInputMode(InputMode inputMode) {
    setState(() {
      _inputMode = inputMode;
    });
  }

  void sendVoiceMessage() {}

  void sendTextMessage(String message) async {
    setReplyingState(true);
    addToChatList(message, true, DateTime.now().toString());
    addToChatList(typing, false, 'typing');
    setInputMode(InputMode.voice);
    final aiResponse = await _openAI.getResponse(message);
    removeTyping();
    addToChatList(aiResponse.toString(), false, DateTime.now().toString());
    setReplyingState(false);
  }

  void removeTyping(){
    final chats = ref.read(chatsProvider.notifier);
    chats.removeTyping();
  }

  void setReplyingState(bool isReplying){
    setState(() {
      _isReplying = isReplying;
    });
  }

  void addToChatList(String message, bool isMe, String id) {
    final chats = ref.read(chatsProvider.notifier);
    chats.add(ChatModel(id: id, message: message, isMe: isMe));
  }
}

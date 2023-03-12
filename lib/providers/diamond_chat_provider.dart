import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_gpt_chat_mobile/models/diamond_chat_model.dart';

class DiamondChatNotifier extends StateNotifier<List<ChatModel>> {
  DiamondChatNotifier() : super([]);
  void add(ChatModel chatModel) {
    state = [...state, chatModel];
  }

  void removeTyping(){
    state = state..removeWhere((chat) => chat.id == 'typing');
  }

}

final chatsProvider =
    StateNotifierProvider<DiamondChatNotifier, List<ChatModel>>(
        (ref) => DiamondChatNotifier());

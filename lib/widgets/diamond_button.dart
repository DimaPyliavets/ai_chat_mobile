import 'package:flutter/material.dart';
import 'package:test_gpt_chat_mobile/widgets/diamond_field.dart';

class DiamondButton extends StatefulWidget {
  final VoidCallback _sendTextMessage;
  final VoidCallback _sendVoiceMessage;
  final InputMode _inputMode;
  final bool _isReplying;

  const DiamondButton({
    super.key,
    required InputMode inputMode,
    required VoidCallback sendTextMessage,
    required VoidCallback sendVoiceMessage,
    required bool isReplying,
  })
      : _inputMode = inputMode,
        _sendTextMessage = sendTextMessage,
        _sendVoiceMessage = sendVoiceMessage,
        _isReplying = isReplying;

  @override
  State<DiamondButton> createState() => _DiamondButtonState();
}

class _DiamondButtonState extends State<DiamondButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .secondary,
        foregroundColor: Theme
            .of(context)
            .colorScheme
            .onSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(16),
      ),
      onPressed: widget._isReplying ? null : widget._inputMode == InputMode.text
          ? widget._sendTextMessage
          : widget._sendVoiceMessage,
      child: Icon(
        widget._inputMode == InputMode.text ? Icons.send : Icons.mic,
      ),
    );
  }
}

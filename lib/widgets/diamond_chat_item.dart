import 'package:flutter/material.dart';

class DiamondChatItem extends StatelessWidget {
  final String text;
  final bool isMe;
  const DiamondChatItem({super.key, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) DiamondProfileContainer(isMe: isMe),
          if (!isMe)
            const SizedBox(
              width: 10,
            ),
          Container(
            padding: const EdgeInsets.all(15),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.65),
            decoration: BoxDecoration(
              color: isMe
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
                bottomLeft: Radius.circular(isMe ? 15 : 0),
                bottomRight: Radius.circular(isMe ? 0 : 15),
              ),
            ),
            child: SelectableText(
              text,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 20),
            ),
          ),
          if (isMe)
            const SizedBox(
              width: 10,
            ),
          if (isMe) DiamondProfileContainer(isMe: isMe),
          const SizedBox(
            width: 5,
          ),
          if (!isMe)
            ElevatedButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10)),
              child: Icon(
                Icons.play_circle,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
        ],
      ),
    );
  }
}

class DiamondProfileContainer extends StatelessWidget {
  const DiamondProfileContainer({
    Key? key,
    required this.isMe,
  }) : super(key: key);

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isMe
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(5),
          topRight: const Radius.circular(5),
          bottomLeft: Radius.circular(isMe ? 0 : 15),
          bottomRight: Radius.circular(isMe ? 15 : 0),
        ),
      ),
      child: Icon(
        isMe ? Icons.person : Icons.computer,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
    );
  }
}

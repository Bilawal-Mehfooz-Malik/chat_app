import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authUser = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots(),
      builder: (ctx, chatSnapShots) {
        if (chatSnapShots.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!chatSnapShots.hasData || chatSnapShots.data!.docs.isEmpty) {
          return const Center(child: Text('No messages found.'));
        }
        if (chatSnapShots.hasError) {
          return const Center(child: Text('Something went wrong...'));
        }

        final loadedMessages = chatSnapShots.data!.docs;
        return ListView.builder(
            reverse: true,
            itemCount: loadedMessages.length,
            padding: const EdgeInsets.only(left: 13, right: 13, bottom: 40),
            itemBuilder: (ctx, index) {
              final chatMessage = loadedMessages[index].data();
              final nextChatMessage = index + 1 < loadedMessages.length
                  ? loadedMessages[index + 1].data()
                  : null;
              final currentMessageUsernameId = chatMessage['userId'];
              final nextMessageUsernameId =
                  nextChatMessage != null ? nextChatMessage['userId'] : null;
              final nexUserIsSame =
                  nextMessageUsernameId == currentMessageUsernameId;

              if (nexUserIsSame) {
                return MessageBubble.next(
                  message: chatMessage['text'],
                  isMe: authUser!.uid == currentMessageUsernameId,
                );
              } else {
                return MessageBubble.first(
                  userImage: chatMessage['userImage'],
                  username: chatMessage['username'],
                  message: chatMessage['text'],
                  isMe: authUser!.uid == currentMessageUsernameId,
                );
              }
            });
      },
    );
  }
}

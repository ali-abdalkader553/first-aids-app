import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:first_aids_app_pro1/controller/consts.dart';
import 'package:flutter/material.dart';

class Chat_Page extends StatefulWidget {
  const Chat_Page({Key? key}) : super(key: key);

  @override
  State<Chat_Page> createState() => _Chat_PageState();
}

class _Chat_PageState extends State<Chat_Page> {
  final _openAI = OpenAI.instance.build(
    token: OPENAI_API_KEY,
    baseOption: HttpSetup(
        receiveTimeout: const Duration(
      seconds: 5,
    )),
    enableLog: true,
  );

  final ChatUser _currentUser = ChatUser(id: '1', firstName: 'Ali');

  final ChatUser _gptChatUser = ChatUser(id: '2', firstName: 'Chatgpt');

  List<ChatMessage> _messagges = <ChatMessage>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          'Gpt Chat',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: DashChat(
        currentUser: _currentUser,
        messageOptions: const MessageOptions(
          currentUserContainerColor: Colors.black,
          containerColor: Colors.redAccent,
          textColor: Colors.white,
        ),
        onSend: (ChatMessage m) {
          getChatResponse(m);
        },
        messages: _messagges,
      ),
    );
  }

  Future<void> getChatResponse(ChatMessage m) async {
    setState(() {
      _messagges.insert(0, m);
    });
    List<Messages> _messagesHistory = _messagges.reversed.map((m) {
      if (m.user == _currentUser) {
        return Messages(role: Role.user, content: m.text);
      } else {
        return Messages(role: Role.assistant, content: m.text);
      }
    }).toList();
    final request = ChatCompleteText(
      messages: _messagesHistory,
      maxToken: 200,
      model: GptTurbo0301ChatModel(),
    );
    final response = await _openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      if (element.message != null) {
        setState(() {
          _messagges.insert(
            0,
            ChatMessage(
                user: _gptChatUser,
                createdAt: DateTime.now(),
                text: element.message!.content),
          );
        });
      }
    }
  }
}

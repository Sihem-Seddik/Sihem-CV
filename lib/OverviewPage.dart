import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:provider/provider.dart';

import 'Theme.dart';

class OverviewPage extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {"text": "Hi, What's your name?".tr(), "type": BubbleType.sendBubble},
    {
      "text": "Hello, My name is Sihem Seddik.".tr(),
      "type": BubbleType.receiverBubble
    },
    {"text": "How old are you?".tr(), "type": BubbleType.sendBubble},
    {"text": "I am 22 years old.".tr(), "type": BubbleType.receiverBubble},
    {"text": "Where are you from?".tr(), "type": BubbleType.sendBubble},
    {"text": "I am from Tunisia 🇹🇳.".tr(), "type": BubbleType.receiverBubble},
    {"text": "What do you do?".tr(), "type": BubbleType.sendBubble},
    {
      "text":
          "I am a  developer and a master student 👩‍🎓 in computer science 🖥️."
              .tr(),
      "type": BubbleType.receiverBubble
    },
    {
      "text": "You can discover more about me in the next pages.🥰❤️".tr(),
      "type": BubbleType.receiverBubble
    },
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.themeMode == ThemeMode.light
          ? Colors.white
          : Colors.black,
      body: MainScreen(messages: messages),
    );
  }
}

class MainScreen extends StatefulWidget {
  final List<Map<String, dynamic>> messages;

  MainScreen({required this.messages});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _messageIndex = 0;
  late List<Map<String, dynamic>> _displayedMessages;

  @override
  void initState() {
    super.initState();
    _displayedMessages = [];
    _showMessages();
  }

  void _showMessages() async {
    for (var message in widget.messages) {
      await Future.delayed(Duration(seconds: 1, milliseconds: 500));
      if (mounted) {
        setState(() {
          _displayedMessages.add(message);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: ListView.builder(
        itemCount: _displayedMessages.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return getTitleText("About Me", context);
          }
          final message = _displayedMessages[index - 1];
          return ChatBubble(
            clipper: ChatBubbleClipper10(type: message["type"]),
            alignment: message["type"] == BubbleType.sendBubble
                ? Alignment.topRight
                : Alignment.topLeft,
            margin: EdgeInsets.only(top: 20),
            backGroundColor: message["type"] == BubbleType.sendBubble
                ? Theme.of(context).primaryColor // Use primaryColor from theme
                : Theme.of(context).cardColor, // Use cardColor from theme
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: Text(
                message["text"],
                style: TextStyle(
                  color: message["type"] == BubbleType.sendBubble
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getTitleText(String title, BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Text(
          title,
          style: TextStyle(
            color:
                Color.fromARGB(255, 67, 220, 146), // Use accentColor from theme
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}

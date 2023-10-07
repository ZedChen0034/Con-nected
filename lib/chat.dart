import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<ChatMessage> messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text('Chat with AI')),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(messages[index]);
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }


  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 5.0,
              color: Colors.black12,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Type a message...',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(Icons.send, color: Theme.of(context).primaryColor),
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    setState(() {
                      messages.add(ChatMessage(content: _controller.text, isUser: true));
                      _generateAIResponse(); // 生成AI回复
                    });
                    _controller.clear();
                    _scrollToBottom(); // 滚动到底部
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(ChatMessage message) {
    // 根据消息的类型来对齐消息
    final align = message.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final color = message.isUser ? Colors.blue[700] : Colors.grey[200];
    final txtColor = message.isUser ? Colors.white : Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(
              message.content,
              style: TextStyle(color: txtColor),
            ),
          ),
        ],
      ),
    );
  }

  void _generateAIResponse() {
    // 模拟AI的回复
    final aiResponse = "AI's reply to: ${_controller.text}";
    messages.add(ChatMessage(content: aiResponse, isUser: false));
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}

class ChatMessage {
  final String content;
  final bool isUser; // 用户发送还是AI发送

  ChatMessage({required this.content, required this.isUser});
}

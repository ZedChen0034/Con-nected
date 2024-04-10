import 'package:flutter/material.dart';

enum SupportType { chat, group, mentor }

class Peer extends StatefulWidget {
  @override
  _PeerPageState createState() => _PeerPageState();
}

class _PeerPageState extends State<Peer> {
  SupportType _currentType = SupportType.chat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Expanded(
            child: _buildSegmentedControl(),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Handle add icon action
            },
          ),
          IconButton(
            icon: const Text("Discover"),
            onPressed: () {
              // Handle search icon action
            },
          ),
        ],
      ),
      body: _buildContent(),
    );
  }

  Widget _buildSegmentedControl() {
    return ToggleButtons(
      children: <Widget>[
        Icon(Icons.chat_bubble),
        Icon(Icons.group),
        Icon(Icons.school),
      ],
      isSelected: [
        _currentType == SupportType.chat,
        _currentType == SupportType.group,
        _currentType == SupportType.mentor,
      ],
      onPressed: (int index) {
        setState(() {
          _currentType = SupportType.values[index];
        });
      },
      renderBorder: false, // This removes the border
      fillColor: Colors.transparent,
      selectedColor: Colors.black26,
      color: Colors.white,
    );
  }

  Widget _buildContent() {
    switch (_currentType) {
      case SupportType.chat:
        return _buildChatList();
      case SupportType.group:
        return _buildGroupList();
      case SupportType.mentor:
        return _buildMentorList();
      default:
        return _buildChatList(); // default to chat list
    }
  }

  Widget _buildChatList() {
    // Updated to include onTap callback
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Card(
        margin: EdgeInsets.all(8.0),
        child: ListTile(
          title: Text('Chat $index'),
          subtitle: Text('Last message...'),
          onTap: () => _navigateToChat(context, 'Chat $index'),
        ),
      ),
    );
  }
  void _navigateToChat(BuildContext context, String chatTitle) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChatPage(chatTitle: chatTitle)),
    );
  }

  Widget _buildGroupList() {
    // Placeholder for group list
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        title: Text('Group $index'),
        subtitle: Text('Last message...'),
      ),
    );
  }

  Widget _buildMentorList() {
    // Placeholder for mentor list
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => ListTile(
        title: Text('Mentor $index'),
        subtitle: Text('Last message...'),
      ),
    );
  }
}


class ChatPage extends StatelessWidget {
  final String chatTitle;

  ChatPage({required this.chatTitle});

  @override
  Widget build(BuildContext context) {
    // Placeholder messages
    List<Map<String, dynamic>> messages = [
      {'text': 'Hi there!', 'isMe': true},
      {'text': 'Hello! How are you?', 'isMe': false},
      // Add more messages here
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(chatTitle),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          final alignment = message['isMe'] ? CrossAxisAlignment.end : CrossAxisAlignment.start;
          return Align(
            alignment: alignment == CrossAxisAlignment.end ? Alignment.topRight : Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              decoration: BoxDecoration(
                color: message['isMe'] ? Colors.blue[100] : Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                message['text'],
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
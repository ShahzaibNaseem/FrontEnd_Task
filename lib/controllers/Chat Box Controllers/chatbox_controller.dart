import 'package:get/get.dart';

class ChatBoxController extends GetxController {
  var messages = [
    {
      'sender': 'Jane Wilson',
      'time': '10:43',
      'message': 'Hi Jacob and Brandon, any progress\non the project? 😊',
      'isMe': false,
      'type': 'text',
      'avatar': 'assets/images/avatar1.png',
    },
    {
      'sender': 'Jacob Hawkins',
      'time': '10:47',
      'message': 'Hi Jane! 👋',
      'isMe': true,
      'type': 'text',
      'avatar': 'assets/images/avatar1.png',
    },
    {
      'sender': 'Brandon Pena',
      'time': '10:52',
      'message': 'Hi Jane! I’ve completed 16 of 20 problems\nso far.',
      'isMe': false,
      'type': 'text',
      'avatar': 'assets/images/avatar1.png',
    },

    {
      'sender': 'Jacob Hawkins',
      'time': '11:48',
      'message': '@Brandon, can you send me the Style Guide?',
      'isMe': true,
      'type': 'text',
      'avatar': 'assets/images/avatar1.png',
    },
    {
      'sender': 'Brandon Pena',
      'time': '11:50',
      'message': 'Brand Styles Guide\n570 KB',
      'isMe': false,
      'type': 'file',
      'avatar': 'assets/images/avatar1.png',
    },
    {
      'sender': 'Jane Wilson',
      'time': '12:10',
      'message': 'Great work team! 🎉 Let’s aim to finalize\nby tomorrow.',
      'isMe': false,
      'type': 'text',
      'avatar': 'assets/images/avatar1.png',
    },
    {
      'sender': 'Jacob Hawkins',
      'time': '12:15',
      'message': 'Sure! I’ll have it ready by EOD. ✅',
      'isMe': true,
      'type': 'text',
      'avatar': 'assets/images/avatar1.png',
    },
    {
      'sender': 'Brandon Pena',
      'time': '12:30',
      'message': 'Uploading the initial draft now.',
      'isMe': false,
      'type': 'text',
      'avatar': 'assets/images/avatar1.png',
    },

    {
      'sender': 'Jane Wilson',
      'time': '15:45',
      'message': 'Team meeting scheduled at 4 PM. Please\njoin on time.',
      'isMe': false,
      'type': 'text',
      'avatar': 'assets/images/avatar1.png',
    },
    {
      'sender': 'Jacob Hawkins',
      'time': '15:50',
      'message': 'Noted! I’ll be there.',
      'isMe': true,
      'type': 'text',
      'avatar': 'assets/images/avatar1.png',
    },
    {
      'sender': 'Brandon Pena',
      'time': '15:55',
      'message': 'Will join in a few minutes.',
      'isMe': false,
      'type': 'text',
      'avatar': 'assets/images/avatar1.png',
    },
    {
      'sender': 'Jacob Hawkins',
      'time': '16:30',
      'message': 'Here’s the document you asked for. 😊',
      'isMe': true,
      'type': 'file',
      'avatar': 'assets/images/avatar1.png',
    },
    {
      'sender': 'Jane Wilson',
      'time': '16:45',
      'message': 'Thanks, Jacob! This looks perfect. 👍',
      'isMe': false,
      'type': 'text',
      'avatar': 'assets/images/avatar1.png',
    },

    {
      'sender': 'Brandon Pena',
      'time': '09:30',
      'message': 'Good morning team! ☀️ Ready for a\nproductive week?',
      'isMe': false,
      'type': 'text',
      'avatar': 'assets/images/avatar1.png',
    },
    {
      'sender': 'Jacob Hawkins',
      'time': '09:35',
      'message': 'Absolutely! Let’s make it count. 💪',
      'isMe': true,
      'type': 'text',
      'avatar': 'assets/images/avatar1.png',
    },
    {
      'sender': 'Jane Wilson',
      'time': '10:00',
      'message': 'Quick reminder: Submit your weekly report\nby noon today.',
      'isMe': false,
      'type': 'text',
      'avatar': 'assets/images/avatar1.png',
    },
  ].obs;

  var messageInput = ''.obs;

  void sendMessage(String message) {
    if (message.trim().isNotEmpty) {
      messages.add({
        'sender': 'Me',
        'time': DateTime.now().toString().substring(11, 16),
        'message': message,
        'isMe': true,
        'type': 'text',
        'avatar': 'https://via.placeholder.com/150/4682B4',
      });
      messageInput.value = '';
    }
  }
}

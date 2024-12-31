import 'package:get/get.dart';

class ChatController extends GetxController {
  var searchQuery = ''.obs;

  var pinnedMessages = [
    {'title': 'Alphaboard', 'subtitle': 'Jane: Hello, Mark! I am wr...', 'avatarColor': 0xFF42A5F5, 'initials': 'A', 'badge': true},
    {'title': 'Design Team', 'subtitle': 'You: Hello. Can you drop t...', 'avatarColor': 0xFFFFA726, 'initials': 'DT'},
    {'title': 'Dustin Williamson', 'subtitle': '🎤 Dustin is typing...', 'avatarColor': 0xFFAB47BC, 'initials': 'D' , 'badge': true},
  ].obs;

  var allMessages = [
    {'title': 'Jane Wilson', 'subtitle': 'Hi! How are you, Steve? 😊', 'avatarColor': 0xFFFFA726, 'initials': 'J'},
    {'title': 'Brandon Pena', 'subtitle': 'How about going somew...', 'avatarColor': 0xFF66BB6A, 'initials': 'B'},
    {'title': 'Nathan Fox', 'subtitle': 'Hello. We have a meeting...', 'avatarColor': 0xFF42A5F5, 'initials': 'N'},
    {'title': 'Jacob Hawkins', 'subtitle': 'Well done! 👍', 'avatarColor': 0xFFFFEB3B, 'initials': 'J', 'badge': true},
    {'title': 'Shane Black', 'subtitle': 'Paul’s having a party tom...', 'avatarColor': 0xFF42A5F5, 'initials': 'S'},
    {'title': 'Priscilla Edwards', 'subtitle': 'It looks amazing!', 'avatarColor': 0xFF66BB6A, 'initials': 'P'},
    {'title': 'Kristin Mccoy', 'subtitle': 'Hi, any progress on the p...', 'avatarColor': 0xFFFFA726, 'initials': 'K'},
    {'title': 'Bruce Russell', 'subtitle': 'Hi, any progress on the p...', 'avatarColor': 0xFF66BB6A, 'initials': 'B', 'badge': true},
  ].obs;

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}

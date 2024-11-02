import 'package:chat_app/views/chats_screen.dart';
import 'package:chat_app/views/groups_screen.dart';
import 'package:chat_app/views/people_chats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageController = PageController(initialPage: 0);
  int currentindex = 0;
  final List<Widget> pages = const [
    ChatsScreen(),
    GroupsScreen(),
    PeopleScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat App'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('assets/images/user_icon.png'),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentindex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.chat_bubble_2_fill,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.group,
            ),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person,
            ),
            label: 'People',
          ),
        ],
        currentIndex: currentindex,
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: const Duration(microseconds: 300),
            curve: Curves.easeIn,
          );
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}

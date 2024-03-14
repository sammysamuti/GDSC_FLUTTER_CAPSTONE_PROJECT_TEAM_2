// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40.0,
              backgroundImage: NetworkImage(
                'https://i.imgur.com/removed.png',
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Mark Adam',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            const Text(
              'Sunny_Koelpin45@hotmail.com',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20.0),
            const NavigationButton(
              text: 'Profile',
              icon: Icons.person,
              showArrowIcon: true,
            ),
            const NavigationButton(
              text: 'Settings',
              icon: Icons.settings,
              showArrowIcon: true,
            ),
            const NavigationButton(
              text: 'Contact',
              icon: Icons.mail,
              showArrowIcon: true,
            ),
            const NavigationButton(
              text: 'Share App',
              icon: Icons.share,
              showArrowIcon: true,
            ),
            const NavigationButton(
              text: 'Help',
              icon: Icons.help,
              showArrowIcon: true,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0), // Add spacing between navigation buttons and bottom buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomIconButton(
                  icon: Icons.home,
                  isActive: false,
                  onPressed: () {
                    // Navigate to home screen
                  },
                ),
                BottomIconButton(
                  icon: Icons.search,
                  isActive: false,
                  onPressed: () {
                    // Navigate to search screen
                  },
                ),
                BottomIconButton(
                  icon: Icons.shopping_bag,
                  isActive: false,
                  onPressed: () {
                    // Navigate to bag screen
                  },
                ),
                BottomIconButton(
                  icon: Icons.person,
                  isActive: true,
                  onPressed: () {
                    // Navigate to profile screen
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomIconButton extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onPressed;

  const BottomIconButton({
    Key? key,
    required this.icon,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: isActive ? Colors.blue : Colors.grey,
      ),
    );
  }
}
class NavigationButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool showArrowIcon;
  final bool isSignOutButton;

  const NavigationButton({
    Key? key,
    required this.text,
    required this.icon,
    this.showArrowIcon = false,
    this.isSignOutButton = false,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 48.0,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          foregroundColor: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 10.0),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: isSignOutButton
                        ? Colors.red
                        : const Color.fromARGB(255, 5, 5, 5),
                  ),
                ),
              ],
            ),
            if (showArrowIcon) const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

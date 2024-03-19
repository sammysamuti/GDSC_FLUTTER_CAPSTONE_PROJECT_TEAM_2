import 'package:flutter/material.dart';
import './pages/Sign_up/page2.dart';
import './filter.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(userName: 'YourUserName'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final String userName;

  const ProfilePage({
    Key? key,
    required this.userName,
  }) : super(key: key);

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
            Text(
              userName,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              '${userName}@gmail.com',
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20.0),
            NavigationButton(
              text: 'Profile',
              icon: Icons.person,
              showArrowIcon: true,
            ),
            NavigationButton(
              text: 'Settings',
              icon: Icons.settings,
              showArrowIcon: true,
            ),
            NavigationButton(
              text: 'Contact',
              icon: Icons.mail,
              showArrowIcon: true,
            ),
            NavigationButton(
              text: 'Share App',
              icon: Icons.share,
              showArrowIcon: true,
            ),
            NavigationButton(
              text: 'Help',
              icon: Icons.help,
              showArrowIcon: true,
            ),
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.filter),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FilterPage()),
                  );
                },
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn_Screen()),
                  );
                },
                child: const Text(
                  'Sign Out',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
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
  }) : super(key: key);

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

  const NavigationButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.showArrowIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      trailing: showArrowIcon ? Icon(Icons.arrow_forward_ios) : null,
    );
  }
}

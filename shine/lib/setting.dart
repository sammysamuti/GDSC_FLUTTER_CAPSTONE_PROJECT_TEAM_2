import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  Widget buildSettingItem({IconData? icon, String? title}) {
    if (title == 'Language') {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10.0),
            Text(title ?? ''),
            const Spacer(),
            const Text('English'), // Add this line
            const SizedBox(width: 10.0), // Add this line
            const Icon(Icons.navigate_next),
          ],
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade200,
        ),
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10.0),
            Text(title ?? ''),
            const Spacer(),
            const Icon(Icons.navigate_next),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: const Row(
              // Add your widgets here
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Text(
              'Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 80.0,
              width: 380,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey.shade200,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 20.0,
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage('i1.jpeg'),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'john.doe@example.com',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.navigate_next),
                    onTap: () {
                  // Navigate to the user profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()),
                  );
                },
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Divider(
              color: Color.fromARGB(255, 212, 202, 202),
              thickness: 1.0,
              indent: 30.0,
              endIndent: 30.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40.0, top: 10.0),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSettingItem(
                  icon: Icons.notifications,
                  title: 'Notifications',
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to the user notification page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationsPage()),
                    );
                  },
                ),
                const SizedBox(height: 20.0),
                buildSettingItem(
                  icon: Icons.language_rounded,
                  title: 'Language',
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to the user languages page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LanguagesPage()),
                    );
                  },
                ),
                const SizedBox(height: 20.0),
                buildSettingItem(
                  icon: Icons.privacy_tip_sharp,
                  title: 'Privacy',
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to the user privacy page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyPage()),
                    );
                  },
                ),
                const SizedBox(height: 20.0),
                buildSettingItem(
                  icon: Icons.help_center,
                  title: 'Help Center',
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to the user help page
                            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HelpPage()),
                    );
                  },
                ),
                const SizedBox(height: 20.0),
                buildSettingItem(
                  icon: Icons.info,
                  title: 'About Us',
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to the user profile page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

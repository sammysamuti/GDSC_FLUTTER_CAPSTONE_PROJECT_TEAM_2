import 'package:flutter/material.dart';
import 'package:shine/pages/HomeScreen/featured.dart';
import 'package:shine/pages/HomeScreen/mostPopular.dart';
import 'package:shine/pages/HomeScreen/updates.dart';
import '../../cart.dart';
import '../../search_page.dart';
import '../../profile.dart';

class HomeScreen extends StatefulWidget {
  final String userEmail;

  const HomeScreen({Key? key, required this.userEmail}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedScreen = 0;

  late String userName;

  @override
  void initState() {
    super.initState();
    userName = widget.userEmail.contains("@")
        ? widget.userEmail.split("@")[0]
        : widget.userEmail;
  }

  void _currentScreen(int index) {
    setState(() {
      _selectedScreen = index;
    });
    // Navigate to different screens based on index
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SearchContainer()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CartPage(
            addToCart: (product) {}, // Pass your addToCart function here
            product: null, // Pass your product here if necessary
          ),
        ),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfilePage(userName: userName)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.fromLTRB(
              width * 0.04, height * 0.003, width * 0.04, 0),
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/frontpage/profile_img.jpg"),
              ),
              title: Text("Hello!"),
              subtitle: Text(
                userName,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              trailing: CircleAvatar(
                backgroundColor: Color(0XFFF8F7F7),
                child: Icon(Icons.notifications),
              ),
            ),
            SearchBar(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 15)),
              backgroundColor:
                  MaterialStateProperty.all<Color?>(Color(0XFFF8F7F7)),
              shadowColor:
                  MaterialStateProperty.all<Color?>(Colors.transparent),
              leading: Icon(Icons.search),
              hintText: "Search here",
              hintStyle: MaterialStateProperty.all<TextStyle?>(
                  TextStyle(color: Colors.grey, fontSize: 20)),
            ),
            Updates(),
            FeaturedPart(),
            MostPopular(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _currentScreen,
        currentIndex: _selectedScreen,
        selectedItemColor: const Color(0xFF6055D8),
        unselectedItemColor: Colors.grey,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}

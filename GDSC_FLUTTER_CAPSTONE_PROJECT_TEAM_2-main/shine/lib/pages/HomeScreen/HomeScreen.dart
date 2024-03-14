import 'package:shine/pages/HomeScreen/featured.dart';
import 'package:shine/pages/HomeScreen/mostPopular.dart';
import 'package:shine/pages/HomeScreen/updates.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: ListView(
      padding:
          EdgeInsets.fromLTRB(width * 0.04, height * 0.003, width * 0.04, 0),
      children: [
        const ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: CircleAvatar(
              backgroundImage:
                  AssetImage("FrontPage_asset/image/profile_img.jpg")),
          title: Text("Hello!"),
          subtitle: Text(
            "John William",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          trailing: CircleAvatar(
              backgroundColor: Color(0XFFF8F7F7),
              child: Icon(Icons.notifications)),
        ),
        SearchBar(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 15)),
          backgroundColor:
              const MaterialStatePropertyAll<Color?>(Color(0XFFF8F7F7)),
          shadowColor:
              const MaterialStatePropertyAll<Color?>(Colors.transparent),
          leading: const Icon(Icons.search),
          hintText: "Search here",
          hintStyle: const MaterialStatePropertyAll<TextStyle?>(
              TextStyle(color: Colors.grey, fontSize: 20)),
        ),
        const Updates(),
        const FeaturedPart(),
        const MostPopular(),
      ],
    ));
  }
}

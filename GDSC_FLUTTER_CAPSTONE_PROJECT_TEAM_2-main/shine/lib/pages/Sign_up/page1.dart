import 'package:shine/pages/Sign_up/page2.dart';

import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Data for each page
  final List<String > imageURL = [
    "FrontPage_asset/image/front_girl.png",
    "FrontPage_asset/image/front_girl.png",
    "FrontPage_asset/image/front_girl.png",
    "FrontPage_asset/image/front_girl.png",
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.5,
            width: width * 0.9,
            child: PageView.builder(
              controller: _pageController,
              itemCount: imageURL.length, // Number of items in the PageView
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: height*0.4,
                    child: Image.asset(
                      imageURL[index],
                      height: height * 0.3, // Adjust image height as needed
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),
           Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      imageURL.length, // Number of pages
                      (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        // margin: const EdgeInsets.only(right:1),
                        height: 10,
                        width: _currentPage == index ? 25 : 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index ? const Color(0XFF6055D8) : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),

           SizedBox(
            height: height * 0.03,
          ),
          const Text(
            "Welcome to our Shop!",
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Text(
            "Lorem ipsum dolor sit amet, consectetur \nadipiscing elit, sed do eiusmod tempor",
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          SizedBox(
            height: height * 0.05,
            width: width * 0.6,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignIn_Screen()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF6055D8)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                 
                  Icon(
                     Icons.navigate_next_outlined,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              ), // Add your button text here
            ),
          )
        ],
      ),
    );
  }
}

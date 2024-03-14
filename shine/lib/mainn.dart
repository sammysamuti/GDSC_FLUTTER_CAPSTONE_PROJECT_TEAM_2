import 'package:flutter/material.dart';
import 'dart:async';
import 'signin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Added a named 'key' parameter

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      home: ImageSlideshow(),
    );
  }
}

class ImageSlideshow extends StatefulWidget {
  const ImageSlideshow({Key? key})
      : super(key: key); // Added a named 'key' parameter

  @override
  ImageSlideshowState createState() =>
      ImageSlideshowState(); // Made the state class public
}

class ImageSlideshowState extends State<ImageSlideshow> {
  final List<String> images = [
    'assets/img1.jpg',
    'assets/img2.jpg',
    'assets/img3.jpg',
    'assets/img4.jpg',
  ];
  int _currentPage = 0;
  final PageController _controller = PageController(initialPage: 0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      if (_currentPage < images.length - 1) {
        _controller.animateToPage(
          _currentPage + 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        _controller.animateToPage(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: images.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (_, index) {
                return Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: RichText(
              text: const TextSpan(
                text: 'Welcome to Our Shop!',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 32),
                children: <TextSpan>[
                  TextSpan(
                    text: '\n',
                    style: TextStyle(fontSize: 36, height: 10),
                  ),
                  TextSpan(
                    text:
                        'Lorem ipsum dolor sit amet, consecutetur adipiscing elit sed do eisumod tempor',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List<Widget>.generate(images.length, (int index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 10,
                width: 10,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _currentPage == index
                      ? const Color.fromARGB(255, 103, 31, 136)
                      : Colors.grey.withOpacity(0.5),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('GET STARTED'),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

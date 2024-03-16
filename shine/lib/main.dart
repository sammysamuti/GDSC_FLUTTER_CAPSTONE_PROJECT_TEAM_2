import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart.dart';
<<<<<<< HEAD
import 'orderhistory.dart';
=======
//test 123
>>>>>>> 78df2d3b5efcbe92140b1d13a61c51c613e07cd6
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Using GetMaterialApp instead of MaterialApp
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      getPages: [
        GetPage(
          name: '/orderhistory',
          page: () => OrderHistory(),
        ),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigating to the CartPage using GetX
            Get.toNamed('/orderhistory');
          },
          child: Text('Cart Page'),
        ),
      ),
    );
  }
}

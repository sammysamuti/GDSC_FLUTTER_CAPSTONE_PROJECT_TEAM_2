import 'package:flutter/material.dart';
import 'cart.dart';
class Details extends StatelessWidget {
  const Details({super.key});
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Image.asset(
                  'assets/details/image.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 220, 219, 219),
                            shape: BoxShape.circle),
                        child: InkWell(
                          onTap: () {
            Navigator.pop(context);  //navigate to the previous
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 15),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 220, 219, 219),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Color.fromARGB(255, 128, 124, 124),
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Nike Shoes",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "\$430",
                      style: TextStyle(
                          color: Color.fromARGB(168, 46, 5, 157),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 236, 221, 13),
                      size: 30,
                    ),
                    Text(
                      "4.5",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    Text(
                      "(20 review)",
                      style: TextStyle(
                          color: Color.fromARGB(163, 93, 91, 91),
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Description",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Culpa aliquam consequuntur veritatis at consequuntur praesentium beatae temporibus nobis. Velit dolorem facilis neque autem. Itaque voluptatem expedita qui eveniet id veritatis eaque. Blanditiis quia placeat nemo. Nobis laudantium nesciunt perspiciatis sit eligendi.",
                  style: TextStyle(color: Color.fromARGB(255, 102, 102, 101)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Size",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            const  MyWidget(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:SizedBox(
                      height: 50,
                      width: 275,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CartPage()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 88, 88, 221),
                          ),
                        ),
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(
                            color: Color.fromARGB(255, 250, 250, 248),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 243, 236, 236),
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.work,
                      color: Color.fromARGB(255, 133, 133, 130),
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  @override
  MyWidgetState createState() => MyWidgetState();
}
class MyWidgetState extends State<MyWidget> {
  bool checkBox1Selected = false;
  bool checkBox2Selected = false;
  bool checkBox3Selected = false;
  bool checkBox4Selected = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    checkBox1Selected = !checkBox1Selected;
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: checkBox1Selected
                          ? Colors.green // Selected color
                          : const Color.fromARGB(255, 182, 182, 182),
                      width: 2,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '8',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                setState(() {
                  checkBox2Selected = !checkBox2Selected;
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: checkBox2Selected
                        ? Colors.green // Selected color
                        : const Color.fromARGB(255, 182, 182, 182),
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Text(
                    '10',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                setState(() {
                  checkBox3Selected = !checkBox3Selected;
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: checkBox3Selected
                        ? Colors.green // Selected color
                        : const Color.fromARGB(255, 182, 182, 182),
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Text(
                    '38',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                setState(() {
                  checkBox4Selected = !checkBox4Selected;
                });
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: checkBox4Selected
                        ? Colors.green // Selected color
                        : const Color.fromARGB(255, 182, 182, 182),
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Text(
                    '40',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

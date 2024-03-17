import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shine/product_page.dart';
import 'checkout.dart';
import 'orders.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    _CartPageState cartPage = _CartPageState();
    return GetMaterialApp(
      home: CartPage(addToCart: cartPage.addToCart),
      getPages: [
        GetPage(
          name: '/checkout',
          page: () {
            final Map<String, dynamic> args = Get.arguments;
            final cart = args['cart'];
            final total = args['total'];
            final delivery = args['delivery'];

            return CheckoutPage(
              cart: cart,
              total: total,
              delivery: delivery,
              clearCartCallback: cartPage.clearCart,
            );
          },
        ),
      ],
    );
  }
}

class CartPage extends StatefulWidget {
  // ignore: library_private_types_in_public_api
  // final _CartPageState cartPage;
  final void Function(MyProduct) addToCart;
  final MyProduct? product;
  const CartPage({Key? key, required this.addToCart, this.product})
      : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

const TextStyle customTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
  fontSize: 17.0,
  letterSpacing: 0.25,
);

class _CartPageState extends State<CartPage> {
  List<MyProduct> cart = [];
  Map<String, dynamic> cartItems = {};

  void initState() {
    super.initState();
    // If product is provided, add it to the cart initially
    if (widget.product != null) {
      addToCart(widget.product!);
    }
  }

  void addToCart(MyProduct product) {
    setState(() {
      cart.add(product);
    });
  }

  void removeItem(MyProduct product) {
    setState(() {
      cart.remove(product);
    });
  }

  void updateQuantity(MyProduct product, int quantity) {
    setState(() {
      final index = cart.indexOf(product);
      cart[index].quantity = quantity;
    });
  }

  void clearCart() {
    setState(() {
      cart.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    double total = 0;
    double delivery = 0.0;

    // Calculate total and delivery charges
    for (var item in cart) {
      total += (item.price * item.quantity) as double;
    }

    delivery = total * 0.05;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Cart',
            style: customTextStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16.0),
            child: PopupMenuButton<String>(
              icon: Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                ),
              ),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'order_history',
                  child: Text('Order History'),
                ),
                // You can add more options here if needed
              ],
              onSelected: (String value) {
                if (value == 'order_history') {
                  navigateToOrderHistory(context);
                }
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                MyProduct product = cart[index];
                return Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First Column: Image
                      Container(
                        width: 130.0,
                        height: 122.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                          child: Image.asset(
                            // item['underimgURL'],
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Second Column: Product Information
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: customTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                product.description,
                                style: customTextStyle.copyWith(
                                  color: Colors.grey,
                                  fontSize: 12.0,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                '\$${product.price.toStringAsFixed(2)}',
                                style: customTextStyle.copyWith(
                                  color: Color(0xFF6055D8),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Third Column: Buttons
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Delete icon
                          IconButton(
                            icon: const Icon(Icons.delete,
                                color: Color.fromARGB(246, 212, 66, 66)),
                            onPressed: () {
                              removeItem(product);
                            },
                          ),

                          SizedBox(height: 8.0),

                          // Row for incrementer and decrementer
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Incrementer
                              GestureDetector(
                                onTap: () {
                                  updateQuantity(product, product.quantity + 1);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF6055D8),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 18.0,
                                  ),
                                ),
                              ),

                              // Add space between incrementer and decrementer
                              SizedBox(width: 8.0),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  ' ${product.quantity}',
                                  style: customTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              // Decrementer
                              GestureDetector(
                                onTap: () {
                                  if (product.quantity > 1) {
                                    updateQuantity(
                                        product, product.quantity - 1);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF6055D8),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 18.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 8.0, right: 8.0, bottom: 4.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text(
                      'Order Summary',
                      style: customTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Items',
                      style: customTextStyle.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      cart.length.toString(),
                      style: customTextStyle.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Subtotal',
                      style: customTextStyle.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: customTextStyle.copyWith(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Discount',
                      style: customTextStyle.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      '\$0.00',
                      style: customTextStyle.copyWith(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Delivery Charges',
                      style: customTextStyle.copyWith(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      '\$${delivery.toStringAsFixed(2)}',
                      style: customTextStyle.copyWith(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Total',
                      style: customTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      '\$${(total + delivery).toStringAsFixed(2)}',
                      style: customTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CheckoutPage(
                            cart: cart,
                            total: total,
                            delivery: delivery,
                            clearCartCallback: clearCart,
                          )),
                );
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFF6055D8)),
                minimumSize: MaterialStateProperty.all<Size>(
                    const Size(double.infinity, 50)),
              ),
              child: Text(
                'Checkout',
                style: customTextStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToOrderHistory(BuildContext context) {
    if (cart.isNotEmpty) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OrderHistory(cartItems: cartItems),
          ),
        );
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderHistory(cartItems: cartItems),
        ),
      );
    }
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'checkout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _CartPageState cartPage = _CartPageState();
    return GetMaterialApp(
      home: CartPage(),
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
  @override
  State<CartPage> createState() => _CartPageState();
}

const TextStyle customTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontFamily: 'Poppins',
  fontSize: 17.0,
  letterSpacing: 0.25,
);

class _CartPageState extends State<CartPage> {
  Map<String, dynamic> cart = {
    "1": {
      "productName": "Watch",
      "productDescription": "Rolex",
      "productPrice": 40,
      "quantity": 2,
      "underimgURL": "assets/cart/watch.jpg", // Replace with actual image URL
    },
    "2": {
      "productName": "Airpods",
      "productDescription": "Apple",
      "productPrice": 333, // Default price for testing
      "quantity": 1,
      "underimgURL": "assets/cart/airpod.jpg" // Replace with actual image URL
    },
    "3": {
      "productName": "Hoodie",
      "productDescription": "Puma",
      "productPrice": 333, // Default price for testing
      "quantity": 1,
      "underimgURL": "assets/cart/hoodie.jpg", // Replace with actual image URL
    },
    // Add more items as needed
  };

  @override
  Widget build(BuildContext context) {
    double total = 0;
    double delivery = 0.0;

    // Calculate total and delivery charges
    cart.forEach((productId, item) {
      total += item['productPrice'] * item['quantity'];
    });

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
            child: Center(
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
            child: IconButton(
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
              onPressed: () {
                print('More options pressed');
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
                String productId = cart.keys.elementAt(index);
                Map<String, dynamic> item = cart[productId];

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
                            item['underimgURL'],
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
                                item['productName'],
                                style: customTextStyle.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                item['productDescription'],
                                style: customTextStyle.copyWith(
                                  color: Colors.grey, // Light gray color
                                  fontSize: 12.0, // Font size small
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                ' \$${item['productPrice']}',
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
                            icon: Icon(Icons.delete,
                                color: Color.fromARGB(246, 212, 66, 66)),
                            onPressed: () {
                              removeItem(productId);
                            },
                          ),

                          // Add space between delete icon and incrementer
                          SizedBox(height: 8.0),

                          // Row for incrementer and decrementer
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Incrementer
                              GestureDetector(
                                onTap: () {
                                  updateQuantity(
                                      productId, item['quantity'] + 1);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF6055D8),
                                  ),
                                  child: Icon(
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
                                  ' ${item['quantity']}',
                                  style: customTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              // Decrementer
                              GestureDetector(
                                onTap: () {
                                  if (item['quantity'] > 1) {
                                    updateQuantity(
                                        productId, item['quantity'] - 1);
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF6055D8),
                                  ),
                                  child: Icon(
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
                Get.to(() => CheckoutPage(
                      cart: cart,
                      total: total,
                      delivery: delivery,
                      clearCartCallback: clearCart,
                    ));
              },
              child: Text(
                'Checkout',
                style: customTextStyle.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFF6055D8)),
                minimumSize:
                    MaterialStateProperty.all<Size>(Size(double.infinity, 50)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void removeItem(String productId) {
    setState(() {
      cart.remove(productId);
    });
  }

  void updateQuantity(String productId, int newQuantity) {
    // Ensuring the product exists in the cart
    if (cart.containsKey(productId)) {
      // Updating the quantity in the cart
      setState(() {
        cart[productId]['quantity'] = newQuantity;
      });

      // Recalculating total and delivery charges after updating quantity
      double newTotal = 0;
      double newDelivery = 0.0;

      cart.forEach((productId, item) {
        newTotal += item['productPrice'] * item['quantity'];
      });

      newDelivery = newTotal * 0.05;

      // updating the total and delivery charges
      setState(() {
        var total = newTotal;
        var delivery = newDelivery;
      });
    }
  }

  void clearCart() {
    setState(() {
      cart.clear();
    });
  }
}

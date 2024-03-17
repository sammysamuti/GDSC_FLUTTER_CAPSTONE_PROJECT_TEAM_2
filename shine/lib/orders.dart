import 'package:flutter/material.dart';
import 'cart.dart';

class OrderHistory extends StatelessWidget {
  final Map<String, dynamic> cartItems;

  OrderHistory({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    TextStyle customTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15.0,
      letterSpacing: 0.25,
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
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
          title: Center(
            child: Text(
              "Orders",
              style: customTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Active',
                  style: customTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Completed',
                  style: customTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Cancelled',
                  style: customTextStyle.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            cartItems.isNotEmpty
                ? ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      var item = cartItems.values.toList()[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // First Column: Image
                              Container(
                                width: 130.0,
                                height: 122.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    item['underimgURL'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              // Second Column: Product Information
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          color: Colors.grey,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$${item['productPrice']}',
                                            style: customTextStyle.copyWith(
                                              color: Color(0xFF6055D8),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              // Add your logic for tracking the order
                                              // You can access the item details from cartItems[index]
                                            },
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Color(0xFF6055D8)),
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                              ),
                                            ),
                                            child: Text("Track Order"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      'No active Orders',
                      style:
                          customTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),

            // Content for Completed orders
            Center(
              child: Text(
                'Completed Orders',
                style: customTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            // Content for Cancelled orders
            Center(
              child: Text(
                'Cancelled Orders',
                style: customTextStyle.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  Map<String, dynamic> cartItems = {}; // Define your cart items here
  runApp(MaterialApp(
    home: OrderHistory(cartItems: cartItems),
  ));
}

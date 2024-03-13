import 'package:flutter/material.dart';

class CustomPaymentTile extends StatelessWidget {
  final String paymentMethod;
  final String imagePath;
  final bool isSelected;
  final Function(String) onChanged;

  CustomPaymentTile({
    required this.paymentMethod,
    required this.imagePath,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle customTextStyle1 = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15.0,
      letterSpacing: 0.25,
    );
    TextStyle textStyle = isSelected
        ? customTextStyle1.copyWith(fontWeight: FontWeight.bold)
        : customTextStyle1;

    return ListTile(
      leading: Image.asset(
        imagePath,
        width: 30,
        height: 30,
      ),
      title: Text(
        paymentMethod,
        style: textStyle,
      ),
      trailing: isSelected
          ? Stack(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200], // Set the background color
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.check,
                      color:
                          Color(0xFF6055D8), // Set the color of the check icon
                    ),
                  ),
                ),
              ],
            )
          : null,
      onTap: () {
        onChanged(paymentMethod);
      },
    );
  }
}

class CheckoutPage extends StatefulWidget {
  final Map<String, dynamic> cart;
  double total = 0.0;
  double delivery = 0.0;
  final VoidCallback clearCartCallback;
  CheckoutPage(
      {required this.cart,
      required this.total,
      required this.delivery,
      required this.clearCartCallback});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  TextStyle customTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    fontSize: 17.0,
    letterSpacing: 0.25,
  );

  String selectedPaymentMethod = 'Paypal'; // Added this line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: customTextStyle.copyWith(fontWeight: FontWeight.bold),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: Icon(
                  Icons.location_on,
                  color: Color(0xFF6055D8),
                ),
              ),
              title: Text(
                'Current Location',
                style: customTextStyle.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: Icon(
                  Icons.access_time_filled,
                  color: Color(0xFF6055D8),
                ),
              ),
              title: Text(
                'Current Time',
                style: customTextStyle.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
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
                        widget.cart.length.toString(),
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
                        '\$${widget.total.toStringAsFixed(2)}',
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
                        '\$${widget.delivery.toStringAsFixed(2)}',
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
                        '\$${(widget.total + widget.delivery).toStringAsFixed(2)}',
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
            Column(
              children: [
                ListTile(
                  title: Text('Choose payment method', style: customTextStyle),
                ),
                CustomPaymentTile(
                  paymentMethod: 'Paypal',
                  imagePath: 'assets/checkout/paypal.png',
                  isSelected: selectedPaymentMethod == 'Paypal',
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value;
                    });
                  },
                ),
                CustomPaymentTile(
                  paymentMethod: 'Credit Card',
                  imagePath: 'assets/checkout/creditcard.png',
                  isSelected: selectedPaymentMethod == 'Credit Card',
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value;
                    });
                  },
                ),
                CustomPaymentTile(
                  paymentMethod: 'Cash',
                  imagePath:
                      'assets/checkout/cash.png', // Replace with the actual path
                  isSelected: selectedPaymentMethod == 'Cash',
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value;
                    });
                  },
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Add new payment method', style: customTextStyle),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200], // Set the background color
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.add,
                            color: Colors.blue, // Set the color of the "+" sign
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    // Handle the action for adding a new payment method
                  },
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            if (selectedPaymentMethod == 'Cash') {
              // Simulate successful payment for Cash method
              _showSuccessAlert(context);
            } else {
              _showCreditCardAlert(context);
            }
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
    );
  }

  void _showCreditCardAlert(BuildContext context) {
    TextEditingController cardNumberController = TextEditingController();
    TextEditingController cvcController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Credit Card Details'),
          content: Container(
            width: 300, // Set the width to your desired value
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: cardNumberController,
                  decoration: InputDecoration(labelText: 'Credit Card Number'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: cvcController,
                  decoration: InputDecoration(labelText: 'CVC'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Validate credit card details (you may want to add more validation)
                String cardNumber = cardNumberController.text.trim();
                String cvc = cvcController.text.trim();

                if (cardNumber.isEmpty || cvc.isEmpty) {
                  // Show an error message or handle the validation as needed
                  // For simplicity, I'm just printing an error message here
                  print('Please enter valid credit card details');
                } else {
                  // Proceed with checkout logic (you can customize this part)
                  Navigator.of(context).pop();
                  _handleCheckout();
                }
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Successful'),
          content: Text('Your payment is successful!'),
          actions: [
            TextButton(
              onPressed: () {
                // Clear the order summary and close the alert
                Navigator.of(context).pop();
                _clearOrderSummary(widget.total, widget.delivery);
                widget.clearCartCallback();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _clearOrderSummary(double total, double delivery) {
    setState(() {
      widget.cart.clear();
      // Reset total and delivery to initial values or set them to 0
      widget.total = 0.0;
      widget.delivery = 0.0;
      // You may need to update other variables based on your app logic
    });

    // Call checkout function with total and delivery
    _showOrderConfirmation(total, delivery);
  }

  void _handleCheckout() {
    // Assuming you have total and delivery available in your widget
    double total = widget.total;
    double delivery = widget.delivery;

    // Add your checkout logic here
    // Call _showSuccessAlert() if the payment is successful

    // Call _clearOrderSummary to clear the cart and show the order confirmation
    _clearOrderSummary(total, delivery);
    widget.clearCartCallback();
  }

  void _showOrderConfirmation(double total, double delivery) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Order Confirmation',
            style: customTextStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Your order was received successfully.\n\nTotal Price: \$${total + delivery}',
            style: customTextStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Clear cart and close the dialog
                _clearCart();
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

// Add this method to clear the cart
  void _clearCart() {
    setState(() {
      widget.cart.clear();
    });
  }
}

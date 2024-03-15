import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _priceController = TextEditingController();
  bool _showError = false;

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  // ignore: unused_element
  void _validateInput() {
    final input = _priceController.text.trim();
    final isNumeric = double.tryParse(input) != null;

    setState(() {
      _showError = !isNumeric;
    });
  }

  void _showDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRecommendation(String size) {
    return GestureDetector(
      onTap: () {
        // Handle recommendation selection or cancellation
      },
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(color: const Color.fromARGB(255, 107, 108, 108)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0.0),
          child: Row(
            children: [
              Text(
                size,
                style: const TextStyle(
                  color: Color.fromARGB(255, 139, 139, 139),
                ),
              ),
              const SizedBox(width: 0.0),
              const Icon(
                Icons.cancel_outlined,
                color: Color.fromARGB(255, 107, 108, 108),
                size: 0.6 * 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 38, left: 10),
            child: Text(
              'Add new Product   ',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 14.0, 10.0, 12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color.fromARGB(255, 99, 82, 222),
                ),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 40.0),
                  Icon(
                    Icons.file_upload_outlined,
                    color: Color.fromARGB(255, 99, 82, 222),
                  ),
                  Text(
                    ' Upload product Picture',
                    style: TextStyle(
                      color: Color.fromARGB(255, 99, 82, 222),
                      fontSize: 20.0,
                      fontFamily: 'Arial',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50.0),
            const Text(
              'Product name',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: const InputDecoration(),
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16.0),
            const Text('Product price',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),
                _CurrencySymbolFormatter(),
              ],
              decoration: InputDecoration(
                errorText: _showError ? 'Enter number' : null,
              ),
              style: TextStyle(
                color: _showError ? Colors.red : Colors.grey,
              ),

              // style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16.0),
            const Text('Product description',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            TextFormField(
              maxLines: 3,
              decoration: const InputDecoration(),
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30.0),
            const Text('Product Size',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            Row(
              children: [
                _buildRecommendation('small'),
                _buildRecommendation('medium'),
                _buildRecommendation('large'),
              ],
            ),
            DropdownButtonFormField<String>(
              items: [
                'S',
                'M',
                'L',
                'XL',
                'XXL',
                'XXXL',
              ].map((size) {
                return DropdownMenuItem<String>(
                  value: size,
                  child: Row(
                    children: [
                      Text(size),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                // Handle size selection
              },
              decoration: const InputDecoration(
                hintText: "Select Size",
              ),
            ),
            const SizedBox(height: 80.0),
            ElevatedButton(
              onPressed: () {
                _showDialog(context, 'The product is added successfully');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 99, 82,
                    222), // perfect ila aan Color.fromARGB(255, 105, 86, 215),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text('ADD PRODUCT',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CurrencySymbolFormatter extends TextInputFormatter {
  static const _allowedSymbols = ['\$', '€', 'birr', 'Birr', 'Br', 'br'];

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final filteredText = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
    final symbol = _getCurrencySymbol(newValue.text);

    return TextEditingValue(
      text: '$symbol$filteredText',
      selection: TextSelection.collapsed(offset: '$symbol$filteredText'.length),
    );
  }

  String _getCurrencySymbol(String text) {
    for (final symbol in _allowedSymbols) {
      if (text.startsWith(symbol)) {
        return symbol;
      }
    }
    return '';
  }
}

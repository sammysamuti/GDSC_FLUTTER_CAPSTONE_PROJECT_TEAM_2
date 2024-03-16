import 'package:flutter/material.dart';

class EditProductPage extends StatelessWidget {
  const EditProductPage({Key? key}) : super(key: key);

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
              'Edit product',
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
          decoration: const InputDecoration(
              // filled: true,
              // fillColor: Colors.grey[200],
              ),
          style: const TextStyle(color: Colors.grey),
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
            // Handle submit button press
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
              child: Text('EDIT PRODUCT',
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
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shine/cart.dart';
import 'package:shine/details.dart';

class ProductController extends GetxController {
  final products = <MyProduct>[
    MyProduct(
      image: 'assets/product/watch.jpg',
      name: 'Watch',
      price: 40.0,
      description: 'Rolex',
    ),
    MyProduct(
      image: 'assets/product/nike.jpg',
      name: 'Nike Shoes',
      price: 340.0,
      description: 'Apple',
    ),
    MyProduct(
      image: 'assets/product/lgtv.jpg',
      name: 'LG TV',
      price: 330.0,
      description: 'LG',
    ),
    MyProduct(
      image: 'assets/product/airpodd.jpg',
      name: 'Airpod',
      price: 333.0,
      description: 'Apple',
    ),
    MyProduct(
      image: 'assets/product/jacket.jpg',
      name: 'Jacket',
      price: 50.0,
      description: 'Adidas',
    ),
    MyProduct(
      image: 'assets/product/hoodie.jpg',
      name: 'Hoodie',
      price: 400.0,
      description: 'Hoodie',
    ),
    MyProduct(
      image: 'assets/product/tshirt.jpg',
      name: 'Tshirt',
      price: 40.0,
      description: 'tshirt',
    ),
    MyProduct(
      image: 'assets/product/shoes.jpg',
      name: 'Shoes',
      price: 40.0,
      description: 'fullset',
    ),
  ].obs;
}

class ProductPage extends GetView<ProductController> {
  final void Function(MyProduct) addToCart;
  final CartPage? cartPage;
  const ProductPage({Key? key, required this.addToCart, this.cartPage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
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
          title: const Text(
            'Products',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: controller.products.length,
          itemBuilder: (BuildContext context, int index) {
            final MyProduct product = controller.products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      imageAsset: product.image,
                      productName: product.name,
                      price: product.price.toString(),
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                            height: 135,
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: IconButton(
                              icon: const Icon(Icons.favorite),
                              iconSize: 24,
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                product.price.toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(1, 96, 85, 216),
                                  fontSize: 12.0,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              MyProduct selectedProduct =
                                  controller.products[index];
                              addToCart(selectedProduct);
                              Get.snackbar(
                                'Added to Cart',
                                '${product.name} added to cart',
                              );
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CartPage(
                                      product: selectedProduct,
                                      addToCart: (MyProduct product) {
                                        cartPage?.addToCart(product);
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                            icon: const CircleAvatar(
                              radius: 20.0,
                              backgroundColor: Color(0xFF6055D8),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyProduct {
  final String image;
  final String name;
  final double price;
  final String description;
  int quantity;

  MyProduct({
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    this.quantity = 1,
  });
}

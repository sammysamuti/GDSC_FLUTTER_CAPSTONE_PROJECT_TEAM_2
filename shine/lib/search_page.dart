import 'package:flutter/material.dart';
import './product_page.dart'; // Import your product data
import './details.dart';

class SearchContainer extends StatefulWidget {
  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  TextEditingController _searchController = TextEditingController();
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
    // Initialize searchResults with default values
    _performSearch('');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    setState(() {
      _showClearButton = _searchController.text.isNotEmpty;
    });
  }

  void _clearSearchText() {
    setState(() {
      _searchController.clear();
    });
  }

  List<MyProduct> searchResults = []; // List to hold search results

  // Function to perform search and update the searchResults list
  void _performSearch(String searchText) {
    // Your search logic here
    // Assuming products is a list of MyProduct objects from your ProductController
    searchResults = ProductController()
        .products
        .where((product) =>
            product.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    setState(() {}); // Update the UI with search results
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(19.0),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged:
                          _performSearch, // Call search function on text change
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  // Show clear button if there is text in the search field
                  if (_showClearButton)
                    CircleAvatar(
                      child: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _clearSearchText,
                        color: Colors.black,
                        iconSize: 15,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Results for "${_searchController.text}"',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(1, 129, 127, 127),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Results found: ${searchResults.length}',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(1, 96, 85, 216),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (BuildContext context, int index) {
                  MyProduct product = searchResults[index];
                  return GestureDetector(
                    onTap: () {
                      // Handle tap on search result item
                      // For example, navigate to the details page
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
                    child: Card(
                      child: ListTile(
                        leading: Container(
                          width: 80, // Adjust width as needed
                          height: 80, // Adjust height as needed
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.cover, // Adjust as needed
                          ),
                        ), // Product image
                        title: Text(product.name),
                        subtitle: Text(product.description),
                        trailing: Text(product.price.toString()),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

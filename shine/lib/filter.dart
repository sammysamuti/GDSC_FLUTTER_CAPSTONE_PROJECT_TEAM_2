import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double hueValue = 0.0;
  double saturationValue = 0.0;
  double contrastValue = 0.0;
  double brightnessValue = 0.0;

  String selectedGender = 'All';
  String selectedBrand = 'Adidas';
  RangeValues selectedPriceRange = RangeValues(0, 100);
  List<String> selectedColors = [];

  List<String> genders = ['All', 'Men', 'Women'];
  List<String> brands = ['Adidas', 'Puma', 'CR7', 'Nike', 'Yeezy', 'Supreme'];
  List<String> colors = ['White', 'Black', 'Grey', 'Yellow', 'Red', 'Green'];

  @override
  Widget build(BuildContext context) {
    TextStyle customTextStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 15.0,
      letterSpacing: 0.25,
    );
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Filter',
            style: customTextStyle.copyWith(
                fontWeight: FontWeight.bold, fontSize: 20),
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
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Gender',
                    style:
                        customTextStyle.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Wrap(
                  spacing: 3.0, // spacing between columns
                  runSpacing: 10.0, // spacing between rows
                  children: genders.map((String color) {
                    bool isSelected = selectedColors.contains(color);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedColors.remove(color);
                          } else {
                            selectedColors.add(color);
                          }
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: 130,
                          height: 50,
                          color:
                              isSelected ? Color(0xFF6055D8) : Colors.grey[200],
                          child: Center(
                            child: Text(
                              color,
                              style: customTextStyle.copyWith(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Text('Brand',
                    style:
                        customTextStyle.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Wrap(
                  spacing: 3.0, // spacing between columns
                  runSpacing: 10.0, // spacing between rows
                  children: brands.map((String color) {
                    bool isSelected = selectedColors.contains(color);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedColors.remove(color);
                          } else {
                            selectedColors.add(color);
                          }
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: 130,
                          height: 50,
                          color:
                              isSelected ? Color(0xFF6055D8) : Colors.grey[200],
                          child: Center(
                            child: Text(
                              color,
                              style: customTextStyle.copyWith(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Text('Price Range',
                    style:
                        customTextStyle.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$16',
                        style:
                            customTextStyle.copyWith(color: Colors.grey[700]),
                      ),
                      Text(
                        '\$453',
                        style:
                            customTextStyle.copyWith(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
                RangeSlider(
                  values: selectedPriceRange,
                  min: 0,
                  max: 100,
                  onChanged: (RangeValues values) {
                    setState(() {
                      selectedPriceRange = values;
                    });
                  },
                ),
                SizedBox(height: 20),
                Text('Color',
                    style:
                        customTextStyle.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Wrap(
                  spacing: 3.0,
                  runSpacing: 10.0,
                  children: colors.map((String color) {
                    bool isSelected = selectedColors.contains(color);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            selectedColors.remove(color);
                          } else {
                            selectedColors.add(color);
                          }
                        });
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: 130,
                          height: 50,
                          color:
                              isSelected ? Color(0xFF6055D8) : Colors.grey[200],
                          child: Center(
                            child: Text(
                              color,
                              style: customTextStyle.copyWith(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      print('Another options tapped');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Another options',
                              style: customTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.navigate_next,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            // Apply Filters logic here
          },
          child: Text(
            'Apply Filters',
            style: customTextStyle.copyWith(
              color: Colors.white,
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
}

void main() {
  runApp(MaterialApp(
    home: FilterPage(),
  ));
}

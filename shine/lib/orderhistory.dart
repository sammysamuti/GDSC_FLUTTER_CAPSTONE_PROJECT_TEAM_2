import 'package:flutter/material.dart';
class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title:
        const  Center(
              child: Text("Orders",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),),
            )
    ),
    body: ListView(
      children: const [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:  Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Active",style: TextStyle(
                  fontWeight:FontWeight.w600,
                  fontSize:16,
                ),),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Completed",style: TextStyle(
                  fontWeight:FontWeight.w600,
                  fontSize:16,
                ),),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("cancel",style: TextStyle(
                  fontWeight:FontWeight.w600,
                  fontSize:16,
                ),),
              )
            ],
          ),

        ),
      ],
    ),
    );
  }
}

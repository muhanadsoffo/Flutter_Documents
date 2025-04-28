import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [Expanded(child: Container(color: Colors.teal,height: 50,child: Text("hello there"),)),
              Flexible(flex: 2,child: Container(color: Colors.orangeAccent,height: 50,child: Text("hello there"),))]
            ,),

        ],
      ),
    );
  }
}

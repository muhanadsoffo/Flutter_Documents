import 'package:flutter/material.dart';

import '../../data/constants.dart';


class RandomPage extends StatefulWidget {
  const RandomPage({super.key});

  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        child: Padding(padding: EdgeInsets.all(20.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("hey there from random page",style: KtextStyle.titleText,),
              Text("it's me again lol this is random page for testing", style: KtextStyle.description,),
            ],
          ),

        ),
      ),
    );
  }
}

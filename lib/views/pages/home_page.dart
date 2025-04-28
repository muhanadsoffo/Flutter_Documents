import 'package:flutter/material.dart';
import 'package:flutters/data/constants.dart';
import 'package:flutters/views/Widgets/hero_widget.dart';
import 'package:flutters/views/pages/random_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10,),
            HeroWidget(title:'Flutter app',nextPage: RandomPage(),),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Card(
              child: Padding(padding: EdgeInsets.all(20.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("hey there",style: KtextStyle.titleText,),
                    Text("it's me again lol", style: KtextStyle.description,),
                  ],
                ),
      
              ),
            ),
          )
        ],
      ),
    ),);
  }
}

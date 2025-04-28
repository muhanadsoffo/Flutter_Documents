import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../data/classes/album_class.dart';
import '../../data/constants.dart';

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {


  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/albums/1');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(
        convert.jsonDecode(response.body) as Map<String, dynamic>,
      );

    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState ==ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          if(snapshot.hasData){
            Album album = snapshot.data;
            return Column(
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(album.title, style: KtextStyle.titleText),
                        Text(album.userId.toString(), style: KtextStyle.description),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }else{
            return Center(child: Text("Error"),);
          }

        },
      ),
    );
  }
}

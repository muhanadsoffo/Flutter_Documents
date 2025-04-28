import 'package:flutter/material.dart';
import 'package:flutters/views/pages/api_page.dart';
import 'package:flutters/views/pages/expanded_flexible_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  bool? isChecked = false;
  double sliderValue = 0.0;
  String? menuItem;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(value: 'e1', child: Text("element 1")),
                  DropdownMenuItem(value: 'e2', child: Text("element 2")),
                  DropdownMenuItem(value: 'e3', child: Text("element 3")),
                ],
                onChanged: (value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              Text(controller.text),
              Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("CHECK ME NIGGA"),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              Slider(
                max: 100.0,
                divisions: 10,
                value: sliderValue,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                  print(value);
                },
              ),
              InkWell(
                splashColor: Colors.greenAccent,
                onTap: () {
                  print("it's clicking");
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.white38,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("hi there"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.blue,
                ),
              ),ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ExpandedFlexiblePage();
                  },));
                },
                child: Text("show expanded and flexible page"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.blue,
                ),
              ),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 5),
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        "it's me i can be used as an error message or just give info",
                      ),
                    ),
                  );
                },
                child: Text("snack baar"),
              ),
              OutlinedButton(onPressed: () {}, child: Text("wassup")),
              OutlinedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ApiPage();
                },));
              }, child: Text("wassup")),
              Divider(height: 10, color: Colors.greenAccent,thickness: 5,endIndent: 50,),
              OutlinedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("alert text"),
                        content: Text("alert content"),
                        actions: [
                          FilledButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("close"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Alert button"),
              ),
              CloseButton(),
              BackButton(),
            ],
          ),
        ),
      ),
    );
  }
}

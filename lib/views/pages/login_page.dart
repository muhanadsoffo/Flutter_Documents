import 'package:flutter/material.dart';
import 'package:flutters/views/Widgets/hero_widget.dart';
import 'package:flutters/views/pages/home_page.dart';
import 'package:flutters/views/widget_tree.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEm = TextEditingController(text: "123");
  TextEditingController controllerPw = TextEditingController(text: "456");
  String confirmedEm='123';
  String confirmedPw='456';
  @override
  void dispose() {
    controllerEm.dispose();
    controllerPw.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return  FractionallySizedBox(
                  widthFactor: widthScreen > 400 ? 0.8 : 1.0,
                  child: Column(
                    children: [
                      HeroWidget(title: 'Login page'),
                      SizedBox(height: 20),
                      TextField(
                        controller: controllerEm,
                        decoration: InputDecoration(
                          hintText: 'email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      TextField(
                        controller: controllerPw,
                        decoration: InputDecoration(
                          hintText: 'password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      FilledButton(
                        onPressed: () {
                          onLoginPressed();
                        },
                        style: FilledButton.styleFrom(minimumSize: Size(double.infinity,40)),
                        child: Text('login'),
                      ),
                      SizedBox(height: 100,)
                    ],
                  ),
                );
              },

            ),
          ),
        ),
      ),
    );
  }
  void onLoginPressed(){
    if(confirmedEm==controllerEm.text && confirmedPw==controllerPw.text){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WidgetTree();
          },
        ),
        (route) => false,
      );
    }


  }
}

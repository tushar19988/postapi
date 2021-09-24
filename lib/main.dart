import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:postapi/user_model.dart';


void main() {
  runApp(postapp());
}

class postapp extends StatelessWidget {
  const postapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PostApi",
      theme: ThemeData(primarySwatch: Colors.brown),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}
  Future<UserModel?> submitdata(String phone)  async{
  var response = await http.post(Uri.http('catchride.in', 'catchride/api/login'),
      body: {"phone" : phone});
  var data = response.body;
  print(data);

  if(response.statusCode == 201){
    String responseString = response.body;
    userModelFromJson(responseString);
  }
  else return null;
  }

class _MyHomeState extends State<MyHome> {
    late UserModel _userModel;
    final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),

      body: Container(
        padding: EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Number',
                ),
                controller: phoneController,

              ),
              ElevatedButton(onPressed: () async {
                String phone = phoneController.text;
                UserModel? data = await submitdata(phone);

                setState(() {
                  _userModel = data!;
                });

              }, child: Text("Submit"))

              // TextButton(
              //   onPressed: ,
              //   child: ,
              // ),
            ],
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     Container(
      //       padding: EdgeInsets.all(10),
      //       child:  TextField(
      //         cursorColor: Colors.red,
      //           decoration: new InputDecoration(labelText: "Enter your number") ,
      //           keyboardType: TextInputType.number,
      //           style: new TextStyle(
      //             color: Colors.lightGreen
      //           ),
      //           inputFormatters:  [
      //             FilteringTextInputFormatter.digitsOnly
      //           ],
      //         ),
      //       ),
      //     TextButton(
      //       onPressed: () {
      //         callLoginApi();
      //       },
      //       child: Text("Submit"),
      //     ),
      //   ],
      // ),
    );
  }
}


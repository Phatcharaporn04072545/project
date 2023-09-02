import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:tproject/models/user.dart';
import 'package:tproject/pages/page1.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();

  String email = " ";
  String password = " ";

  late List<User> loginResult;

  Future<void> loginState(email, password) async {
    var parameter = {'email': email, 'password': password};
    var url = Uri.http("10.65.5.154:3000", "users", parameter);
    var resp = await http.get(url);
    loginResult = userFromJson(resp.body);
    if (loginResult.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Email or password invalid')));
    } else {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page1()),
  );
}

    print(resp.body);
    return;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20), // เพิ่มช่องว่างด้านบนรูปภาพ
              Image.asset('assets/pro.jpg'),
              SizedBox(height: 10), // เพิ่มช่องว่างระหว่างรูปภาพกับข้อความ
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black, width: 2), // ตั้งค่าขอบกรอบ
                  borderRadius:
                      BorderRadius.circular(10), // ตั้งค่าการมีมนต์ของขอบกรอบ
                ),
                padding:
                    EdgeInsets.all(10), // ตั้งค่าระยะห่างระหว่างกรอบกับข้อความ
                child: Text(
                  'MEDICAL SUPPLY STORE',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              emailInputField(),
              passwordInputField(),
              SizedBox(height: 20.0),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailInputField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Input your Email',
          icon: Icon(Icons.email)),
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required';
        }
        if (!EmailValidator.validate(value)) {
          return 'It is not email format';
        }
        return null;
      },
      onSaved: (newValue) => email = newValue!,
    );
  }

  Widget passwordInputField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'password',
          hintText: 'Input your password',
          icon: Icon(Icons.password)),
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      onSaved: (newValue) => password = newValue!,
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          _formkey.currentState!.save();
          loginState(email, password);
          //print("${email} ${password}");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Connet to Server')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
      ),
      child: Text(
        'Login',
        style: TextStyle(
          color: Colors.black, // กำหนดสีตัวอักษรในปุ่ม
        ),
      ),
    );
  }
}

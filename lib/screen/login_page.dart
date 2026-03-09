import 'package:flutter/material.dart';
import 'package:kuis/screen/food_list_page.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isLogin = false;

  void _login(){
    String username = _usernameController.text;
    String pass = _passController.text;

    if(username == "086" && pass == "086"){
      setState(() {
        isLogin = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromARGB(255, 94, 119, 141),
          content: Text("Login Berhasil")
          ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return FoodListPage(username: username);
      }));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Login Gagal")
          ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:EdgeInsets.symmetric(vertical: 10,
          horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("LOGIN", style: TextStyle(fontSize: 30),),
              Text("Welcome back to MiniLens!"),
              _usernameField(_usernameController),
              _passField(_passController),
              _buttonLogin()
            ],
          ), 
          ),
      ),
    );
  }

  Widget _usernameField(TextEditingController username){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: username,
        decoration: InputDecoration(
          hintText: "Username",
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16)
          ) 
        ),
      ),
    );
  }

  Widget _passField(TextEditingController pass){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: pass,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          contentPadding: EdgeInsets.all(8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16)
          ) 
        ),
      ),
    );
  }

  Widget _buttonLogin(){
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _login,
      child: Text("Login"),
      ),
    );
  }
}
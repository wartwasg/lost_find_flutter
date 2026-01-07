import 'package:flutter/material.dart';
import 'package:found/screen/login.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceW = MediaQuery.of(context).size.width;
    double deviceH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: deviceW,
        height: deviceH,
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 65),
                Center(child: welcomeWord()),
                const SizedBox(height: 10),
                Center(child: moto()),
                emailLabel(),
                emailField(),
                passwordLabel(),
                passwordField(),
                confirmPasswordLabel(),
                confirmPasswordField(),
                rememberMe(),
                const SizedBox(height: 35),
                elevatedButton(deviceW),
                const SizedBox(height: 20),
                loginWord(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center loginWord(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
        },
        child: RichText(
          text: TextSpan(
            text: "Already have an account?",
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
            children: [
              TextSpan(
                text: " Login",
                style: TextStyle(color: Color(0xFF4B68AB)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container confirmPasswordField() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextField(
        controller: confirmPassword,
        obscureText: false,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 219, 219, 219)),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 219, 219, 219), width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: "Confirm Password",
          hintStyle: TextStyle(color: Colors.grey, letterSpacing: 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey),
          ),
          suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.visibility_off)),
        ),
      ),
    );
  }

  Container confirmPasswordLabel() {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 20, 0, 10),
      child: Text(
        "Confirm Password",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1),
      ),
    );
  }

  Center elevatedButton(double deviceW) {
    return Center(
      child: Material(
        child: Ink(
          width: deviceW * 0.7,
          height: 45,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFF4B68AB), Color.fromARGB(255, 40, 63, 115)]),
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () {
              
            },
            child: Center(
              child: Text("register", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }

  Container rememberMe() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(value: false, onChanged: (_) {}),
              Text("Remember me"),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Text(
              "Forgot password?",
              style: TextStyle(color: Color(0xFF4B68AB), fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  Container passwordField() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextField(
        controller: password,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 219, 219, 219)),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 219, 219, 219), width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: "Create Password",
          hintStyle: TextStyle(color: Colors.grey, letterSpacing: 1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey),
          ),
          suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.visibility_off)),
        ),
      ),
    );
  }

  Container passwordLabel() {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 20, 0, 10),
      child: Text(
        "Password",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1),
      ),
    );
  }

  Container emailField() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextField(
        controller: email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Color.fromARGB(255, 219, 219, 219), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 219, 219, 219), width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: "Enter your email",
          hintStyle: TextStyle(color: Colors.grey, letterSpacing: 1),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 219, 219, 219), width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Container emailLabel() {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 50, 0, 10),
      child: Text(
        "Email",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 1),
      ),
    );
  }

  Text moto() {
    return const Text(
      "Pocket Pilot seamlessly digitized, always organized",
      style: TextStyle(fontSize: 20, color: Colors.grey, letterSpacing: -1),
    );
  }

  Text welcomeWord() {
    return const Text(
      "Welcome to Lost And Find app",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: -1),
    );
  }
}

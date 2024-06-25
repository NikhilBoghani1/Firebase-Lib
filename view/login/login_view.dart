import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kind_app/view/dashboard/dashboard_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );
      Navigator.pop(context);
      /*Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => dashboard_view(),
          ));*/
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        /* wrongEmailMessage();*/
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => dashboard_view(),
        ));
    /* Navigator.pop(context);*/
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Password'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 210),
              Container(
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: "PoppinsEB",
                        fontSize: 25,
                        color: Colors.deepPurpleAccent.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'login to access your account',
                      style: TextStyle(
                        fontFamily: "PoppinsSB",
                        fontSize: 17,
                        color: Colors.deepPurpleAccent.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  /*   crossAxisAlignment: CrossAxisAlignment.end,*/
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          fontFamily: "PoppinsR",
                          fontSize: 16,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      controller: emailcontroller,
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontFamily: "PoppinsR",
                          fontSize: 16,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      controller: passwordcontroller,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(fontFamily: "PoppinsR"),
                        ),
                      ),
                    ),
                    SizedBox(height: 7),
                    /*Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontFamily: "PoppinsR",
                        color: Colors.deepPurpleAccent.withOpacity(0.5),
                      ),
                    ),*/
                    SizedBox(height: 25),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        backgroundColor:
                            Colors.deepPurpleAccent.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: signUserIn,
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "PoppinsB",
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    /*Row(
                      children: <Widget>[
                        Expanded(
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Another option',
                            style: TextStyle(
                              color: Colors.deepPurpleAccent.shade100,
                              fontFamily: "PoppinsR",
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),*/
                    SizedBox(height: 30),
                    /* Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/instagram.jpg",
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image(
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/twitter.jpg",
                            ),
                          ),
                        ),
                      ],
                    ),*/
                    SizedBox(height: 30),
                    /*   ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.deepPurpleAccent.withOpacity(0.2),
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      onPressed: () {},
                      child: Text(
                        'Login With Number',
                        style: TextStyle(
                          fontFamily: "PoppinsR",
                          color: Colors.white,
                        ),
                      ),
                    ),*/
                    SizedBox(height: 150),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontFamily: "PoppinsM",
                            color: Colors.deepPurpleAccent.withOpacity(0.4),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontFamily: "PoppinsB",
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

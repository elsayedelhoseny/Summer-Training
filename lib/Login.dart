import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Register.dart';
import 'package:untitled/home.dart';

import 'provider/login_provider.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailadress = new TextEditingController();
  TextEditingController password = new TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 22),
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 155),
                Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text("Login how to browse our hot offers",
                    style: TextStyle(color: Colors.grey, fontSize: 10.0)),
                SizedBox(height: 25),
                TextFormField(
                  controller: emailadress,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Enter email adress";
                    } else if (value.length < 5) {
                      return " The text cannot be less than 5 characters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Email Address",
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  controller: password,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock_outline),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 21),
                Consumer<LoginProvider>(
                  builder: (context, login, child) {
                    return Center(
                      child: MaterialButton(
                        onPressed: () {
                          login
                              .login(
                            email: emailadress.text,
                            password: password.text,
                          )
                              .then((value) {
                            //
                            if (formkey.currentState!.validate()) {
                              if (login.loginModel!.status == false) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      login.loginModel!.message.toString()),
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.blue,
                                ));
                              } else {
                                if (login.loginModel!.status == true) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                        login.loginModel!.message.toString()),
                                    duration: Duration(seconds: 1),
                                    backgroundColor: Colors.blue,
                                  ));

                                  login.loginModel! == null
                                      ? Center(
                                          child: CircularProgressIndicator(
                                              color: Colors.blue),
                                        )
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home()));
                                }
                              }
                            } // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                          });
                        },
                        padding: EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 20,
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        color: Colors.blue[400],
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont have an account?",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.blue, fontSize: 20.0),
                      ),
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return RegisterScreen();
                        }));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

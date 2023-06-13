import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:socialmedia/firebase/firebase.dart';
import 'package:socialmedia/screen/homepage.dart';
import 'package:socialmedia/widgest/advancecontainer.dart';
import 'package:socialmedia/widgest/glasscontainer.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  ///o is nonun,1 is signup,2 is login value
  int isLogin = 0;
  String email = '';
  String password = '';
  String username = '';
  bool isChecked = false;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 36, 35, 35),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLogin == 0)
                  const Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                if (isLogin == 1)
                  const Text(
                    'Sigup',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                if (isLogin == 2)
                  const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                SizedBox(
                  height: height * 0.02,
                ),
                if (isLogin == 0)
                  const Text(
                    'Please login or signup to continue using\n our app',
                    style: TextStyle(
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                if (isLogin == 1)
                  const Text(
                    'Please Registration with email and sign up\n to continue using our app',
                    style: TextStyle(
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                if (isLogin == 2)
                  const Text(
                    'Please login to continue using our app',
                    style: TextStyle(
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                if (isLogin == 0)
                  Lottie.asset('assest/a3.json',
                      height: height * 0.4, width: width),
                if (isLogin == 1)
                  SizedBox(
                    height: height * 0.08,
                  ),
                if (isLogin == 2)
                  SizedBox(
                    height: height * 0.17,
                  ),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Enter via Social Networks',
                        style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      GestureDetector(
                        onTap: () {
                          googleSignIn.signIn().then((googlevalue) {
                            String? googleusername = googlevalue!.displayName;
                            String? profilepicture = googlevalue.photoUrl;

                            print(googleusername);
                            print(profilepicture);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return LandingPage(
                                    username: googleusername!, email: email);
                              },
                            ));
                            print("Sucessfully Googlesign in");
                          });
                        },
                        child: GlassContainer(
                            height: height * 0.05,
                            width: width * 0.45,
                            borderRadius: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assest/g1.png',
                                  height: height * 0.04,
                                ),
                                const Text(
                                  'Sign in with Google',
                                  style: TextStyle(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      const Text(
                        'or login with Email',
                        style: TextStyle(
                            fontSize: 15,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      if (isLogin != 0)
                        Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                isLogin != 0 && isLogin != 2
                                    ? AdvanceGlassContainer(
                                        height: height * 0.065,
                                        width: width * 0.65,
                                        borderRadius: 8,
                                        child: TextFormField(
                                          key: const ValueKey('username'),
                                          style: const TextStyle(
                                              color: Colors.white),
                                          cursorColor: Colors.white,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: " username",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey)),
                                          validator: (value) {
                                            if (value.toString().length < 3) {
                                              return 'Username is so small';
                                            } else {
                                              return null;
                                            }
                                          },
                                          onSaved: (value) {
                                            setState(() {
                                              print('username is  $value');
                                              username = value!;
                                            });
                                          },
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                if (isLogin != 0)
                                  AdvanceGlassContainer(
                                    height: height * 0.065,
                                    width: width * 0.65,
                                    borderRadius: 8,
                                    child: TextFormField(
                                      key: const ValueKey('email'),
                                      style:
                                          const TextStyle(color: Colors.white),
                                      cursorColor: Colors.white,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          hintText: "  email"),
                                      validator: (value) {
                                        if (!(value.toString().contains('@'))) {
                                          return 'Invalid Email';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          print('email is  $value');
                                          email = value!;
                                        });
                                      },
                                    ),
                                  ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                if (isLogin != 0)
                                  AdvanceGlassContainer(
                                    height: height * 0.065,
                                    width: width * 0.65,
                                    borderRadius: 8,
                                    child: TextFormField(
                                      key: const ValueKey('password'),
                                      style:
                                          const TextStyle(color: Colors.white),
                                      cursorColor: Colors.white,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          hintText: " password"),
                                      validator: (value) {
                                        if (value.toString().length < 6) {
                                          return 'Password is so small';
                                        } else {
                                          return null;
                                        }
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          print('password is  $value');
                                          password = value!;
                                        });
                                      },
                                    ),
                                  ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                if (isLogin == 1)
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: width * 0.145),
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          activeColor: Colors.white,
                                          checkColor: Colors.black,
                                          focusColor: Colors.white,
                                          splashRadius: 10,
                                          value: isChecked,
                                          tristate: true,
                                          onChanged: (value) {
                                            setState(() {
                                              isChecked = !isChecked;
                                              print(isChecked);
                                            });
                                          },
                                        ),
                                        const Text(
                                          '    I agree with privacy policy',
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                // if (isLogin == 2)
                                //   Padding(
                                //     padding:
                                //         EdgeInsets.only(right: width * 0.145),
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.end,
                                //       children: [
                                //         GestureDetector(
                                //           onTap: () {
                                //             print('Forget password clicking');
                                //           },
                                //           child: const Text(
                                //             '    Forget Password?',
                                //             style:
                                //                 TextStyle(color: Colors.white),
                                //           ),
                                //         )
                                //       ],
                                //     ),
                                //   ),
                              ],
                            )),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      isLogin == 2
                          ? GestureDetector(
                              onTap: () {
                                if (_formkey.currentState!.validate()) {
                                  _formkey.currentState!.save();
                                  loginbutton(
                                      email, password, context, username);
                                  print('LoginButton clicking');
                                }
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: height * 0.05,
                                  width: width * 0.65,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  )),
                            )
                          : GestureDetector(
                              onTap: () {
                                if (isLogin == 0) {
                                  setState(() {
                                    isLogin = 1;
                                  });
                                } else {
                                  if (_formkey.currentState!.validate()) {
                                    _formkey.currentState!.save();
                                    sigUpbutton(
                                        email, password, username, context);
                                    print('sigupbutton clicking');
                                  }
                                }
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: height * 0.05,
                                  width: width * 0.65,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: const Text(
                                    'SignUp',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  )),
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                BottomText()
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomText() {
    return isLogin == 2
        ? GestureDetector(
            onTap: () {
              setState(() {
                isLogin = 1;
              });
            },
            child: RichText(
              text: const TextSpan(
                  text: 'Don\'t have an account?  ',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                isLogin = 2;
              });
            },
            child: RichText(
              text: const TextSpan(
                  text: 'You already have an account?  ',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ]),
            ),
          );
  }
}

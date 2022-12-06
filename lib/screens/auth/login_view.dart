import 'package:eccomerceapp/screens/home/home_view.dart';
import 'package:eccomerceapp/services/auth/login_service.dart';
import 'package:eccomerceapp/theme/color.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController login_email = TextEditingController();
  TextEditingController login_password = TextEditingController();
  String message = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool loading = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.15,
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.0105,
                ),
                Text(
                  'Sigin',
                  style: theme.bodyText1!.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.10,
                      fontWeight: FontWeight.w800),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 8.0),
                  child: Text(
                    'Email'.toUpperCase(),
                    style: theme.bodyText2!
                        .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
                TextField(
                  controller: login_email,
                  style: theme.bodyText1!.copyWith(
                      color: textFieldfont,
                      // fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: primaryColor,
                      ),
                      focusColor: primaryColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: textFieldback,
                      // border: UnderlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Email',
                      contentPadding: EdgeInsets.all(15),
                      hintStyle: theme.bodyText2!.copyWith(
                          color: fontSecondary,
                          // fontSize: MediaQuery.of(context).size.height * 0.032,
                          fontSize: 13,
                          fontWeight: FontWeight.w500)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 8.0),
                  child: Text(
                    'password'.toUpperCase(),
                    style: theme.bodyText2!
                        .copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
                TextField(
                  obscureText: _isObscure,
                  controller: login_password,
                  style: theme.bodyText1!.copyWith(
                      color: textFieldfont,
                      // fontSize: MediaQuery.of(context).size.height * 0.02,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: primaryColor),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          }),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: primaryColor,
                      ),
                      focusColor: primaryColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: textFieldback,
                      // border: UnderlineInputBorder(borderSide: BorderSide.none),
                      hintText: '*******',
                      contentPadding: EdgeInsets.all(15),
                      hintStyle: theme.bodyText2!.copyWith(
                          color: fontSecondary,
                          // fontSize: MediaQuery.of(context).size.height * 0.032,
                          fontSize: 13,
                          fontWeight: FontWeight.w500)),
                ),
                loading == false
                    ? Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03),
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(primaryColor)),
                            onPressed: () {
                              setState(() {
                                loading = true;
                              });

                              final bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(login_email.text);
                              // Loginfunc("ra@digitalgraphiks.pk", "Pakistan123").then((value) {
                              if (emailValid) {
                                Loginfunc("${login_email.text}",
                                        "${login_password.text}")
                                    .then((value) {
                                  // print(value['status']);
                                  setState(() {
                                    loading = false;
                                  });
                                  if (value['result'] == true) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomeView()),
                                    );
                                  } else {
                                    setState(() {
                                      message = "${value['message']}";
                                    });
                                  }
                                });
                              } else {
                                message = "Email Not Valid";
                                setState(() {
                                  loading = false;
                                });
                              }

                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => const HomeView()),
                              // );
                            },
                            child: Text("login".toUpperCase(),
                                style: theme.subtitle1!.copyWith(
                                    color: cardBg,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500))))
                    : Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03),
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(primaryColor)),
                            onPressed: () {},
                            child: CircularProgressIndicator())),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08),
                    child: Text(
                      '$message'.toUpperCase(),
                      style: TextStyle(color: secondary),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.08),
                    child: Text(
                      'dont have an account?'.toUpperCase(),
                      style: TextStyle(color: primaryColor1),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor1)),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const HomeView()),
                      // );
                    },
                    child: Text(
                      'Create Account',
                      style: theme.subtitle1!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: cardBg),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

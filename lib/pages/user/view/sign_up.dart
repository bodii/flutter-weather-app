import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  bool passwdVisible = false;
  bool rePasswdVisible = false;
  final _formKey = GlobalKey<FormState>();
  int countdown = 60;
  bool reSend = false;
  bool sendEventing = false;

  @override
  Widget build(BuildContext context) {
    FormState? formState = _formKey.currentState;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("sign up"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "邮箱",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          counterStyle: TextStyle(fontSize: 20),
                        ),
                        validator: (String? value) {
                          debugPrint(value);
                          return;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: "登录密码",
                          prefixIcon: const Icon(Icons.lock),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passwdVisible = !passwdVisible;
                              });
                            },
                            icon: Icon(
                              passwdVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        obscureText: !passwdVisible,
                        validator: (value) {
                          debugPrint(value);
                          return;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: "确认密码",
                          prefixIcon: const Icon(Icons.lock_clock),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                rePasswdVisible = !rePasswdVisible;
                              });
                            },
                            icon: Icon(
                              rePasswdVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        obscureText: !rePasswdVisible,
                        validator: (value) {
                          debugPrint(value);
                          return;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "手机号",
                          prefixIcon: Icon(Icons.phone_iphone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(11),
                        ],
                        validator: (value) {
                          debugPrint(value);
                          return;
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 130.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "验证码",
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(6),
                              ],
                              validator: (value) {
                                debugPrint(value);
                                return;
                              },
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          width: 100.0,
                          height: 60.0,
                          child: Text(
                            "$countdown's",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 120,
                          height: 50,
                          child: OutlinedButton(
                            onPressed:
                                sendEventing ? null : sendVerificationCode,
                            child: Text(reSend ? '重新发送' : '发送'),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 160.0,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (formState != null &&
                                      formState.validate()) {
                                    formState.reset();
                                  }
                                });

                                /*
                                if (_formKey.currentState.!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Processing data')),
                                  );
                                }
                                */
                              },
                              child: const Text(
                                '取消',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 160.0,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () {
                                debugPrint("取消");
                              },
                              child: const Text(
                                '提交',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void sendVerificationCode() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      sendEventing = true;
      countdown--;

      if (countdown <= 0) {
        timer.cancel();
        sendEventing = false;
        countdown = 60;
      }
      debugPrint(countdown.toString());

      setState(() {});
    });
  }
}

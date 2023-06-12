import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey();
    bool passwdVisible = 1 > 0;
    bool rePasswdVisible = 1 > 0;

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
                        decoration: const InputDecoration(
                          // labelText: "用户名",
                          hintText: "邮箱",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        validator: (String? value) {
                          debugPrint(value);
                          return value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          // labelText: "密码",
                          hintText: "登录密码",
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(
                                // passwdVisible
                                //     ?
                                Icons.visibility
                                //     : Icons.visibility_off,
                                ),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          debugPrint(value);
                          return value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          // labelText: "确认密码",
                          hintText: "确认密码",
                          prefixIcon: Icon(Icons.lock_clock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          suffixIcon: IconButton(
                            onPressed: null,
                            icon: Icon(
                                // rePasswdVisible
                                //     ?
                                Icons.visibility
                                //     :Icons.visibility_off,
                                ),
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          debugPrint(value);
                          return value;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          // labelText: "手机号",
                          hintText: "手机号",
                          prefixIcon: Icon(Icons.phone_iphone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        maxLength: 11,
                        validator: (value) {
                          debugPrint(value);
                          return '';
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
                              maxLength: 6,
                              // validator: (value) {
                              //   debugPrint(value);
                              //   return value;
                              // },
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 160,
                          child: OutlinedButton(
                            onPressed: null,
                            child: Text("60's 重新发送"),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 160.0,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () {
                                debugPrint("取消");

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
}

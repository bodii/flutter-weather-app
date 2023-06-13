import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool passwdVisible = false;
  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    FormState? signinFormState = signinFormKey.currentState;

    return AlertDialog(
      title: const Text('登录'),
      content: SizedBox(
        height: 150,
        child: SingleChildScrollView(
          child: Form(
            key: signinFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "邮箱",
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Theme.of(context).primaryColor,
                        size: 18.0,
                      ),
                    ),
                    autofocus: true,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  margin: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !passwdVisible,
                    decoration: InputDecoration(
                      labelText: "密码",
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Theme.of(context).primaryColor,
                        size: 18.0,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(passwdVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwdVisible = !passwdVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextButton(
                      onPressed: () {
                        context.goNamed("/user/sign_up");
                      },
                      child: const Text('Not registered yet?'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          child: const Text("取消"),
          onPressed: () {
            if (signinFormState != null) {
              signinFormState.reset();
            }
            context.pop(false);
          },
        ),
        ElevatedButton(
          child: const Text("确定"),
          onPressed: () {
            context.pop(true);
          },
        ),
      ],
    );
  }
}

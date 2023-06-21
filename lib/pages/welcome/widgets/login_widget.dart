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
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;

    return AlertDialog(
      title: const Text('登录'),
      content: SizedBox(
        height: screenHeight * 0.15,
        child: SingleChildScrollView(
          child: Form(
            key: signinFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.05,
                  margin: const EdgeInsets.only(top: 5),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "邮箱",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.mail,
                      ),
                    ),
                    autofocus: true,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.05,
                  margin: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !passwdVisible,
                    decoration: InputDecoration(
                      labelText: "密码",
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(
                        Icons.lock,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
        FilledButton(
          child: const Text("取消"),
          onPressed: () {
            if (signinFormState != null) {
              signinFormState.reset();
            }
            context.pop(false);
          },
        ),
        FilledButton(
          onPressed: () {
            context.pop(true);
          },
          child: const Text(
            "确定",
          ),
        ),
      ],
    );
  }
}

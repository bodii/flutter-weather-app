import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('登录'),
      content: SizedBox(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: double.infinity,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "邮箱",
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Theme.of(context).primaryColor,
                    size: 18.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "密码",
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                    size: 18.0,
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
                    context.goNamed("/sign_in");
                  },
                  child: const Text('sign in?'),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text("取消"),
          onPressed: () {
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

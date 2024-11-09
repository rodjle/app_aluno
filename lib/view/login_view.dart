import 'package:flutter/material.dart';
import '../presenter/login_presenter.dart';

class LoginView extends StatelessWidget {
  final LoginPresenter presenter;

  LoginView({Key? key, required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login with Google"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool success = await presenter.signInWithGoogle();
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Login successful!")),
                  );
                  // Navegue para a próxima tela
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Login failed!")),
                  );
                }
              },
              child: Text("Login with Google"),
            ),
          ],
        ),
      ),
    );
  }
}

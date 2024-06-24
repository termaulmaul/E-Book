import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  String? successMessage;
  String? errorMessage;

  Future<void> _resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      setState(() {
        successMessage = "Password reset email sent!";
        errorMessage = null;
      });
    } catch (e) {
      print(e);
      setState(() {
        errorMessage = e.toString();
        successMessage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            if (successMessage != null) ...[
              Text(
                successMessage!,
                style: TextStyle(color: Colors.green),
              ),
            ],
            if (errorMessage != null) ...[
              Text(
                errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
            ],
            ElevatedButton(
              onPressed: _resetPassword,
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}

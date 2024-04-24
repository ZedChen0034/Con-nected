import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: LayoutBuilder(  // Using LayoutBuilder to get parent widget constraints
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,  // Setting minimum height to the viewport height
              ),
              child: IntrinsicHeight(
                child: Padding( // Padding added here to give space around the Column
                  padding: EdgeInsets.symmetric(horizontal: 20.0), // Horizontal padding for left and right edges
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,  // Centering content vertically
                    children: <Widget>[
                      TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Logic for logging in goes here
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.deepPurple,
                          textStyle: TextStyle(
                            fontSize: 20,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        ),
                      ),
                      SizedBox(height: 20),  // Keeps space so content remains centered even when the keyboard is displayed
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

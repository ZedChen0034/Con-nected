import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Con-nected"),
        centerTitle: true,
        automaticallyImplyLeading: false,  // This prevents the back button from appearing
      ),
      body: SingleChildScrollView(  // Add SingleChildScrollView here
        child: Column(
          children: <Widget>[
            Image.asset('images/01-welcome.png'),  // Ensure this image is in your assets directory
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
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
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text('Register'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple,
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

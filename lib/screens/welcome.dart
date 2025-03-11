import 'package:flutter/material.dart';
import 'package:kyucsa/screens/login.dart';
import 'package:kyucsa/screens/signup.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/pics/page.jpg',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 16),
              const Text(
                'Welcome to KYUCSA App!',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the main screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupScreen()),
                    );
                  },
                  child: const Text('SIGNUP'),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the main screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    //primary: Colors.blue, // Background color
                    //onPrimary: Colors.white, // Text color
                    minimumSize: const Size(200, 60), // Size of the button
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                  child: const Text('LOGIN'),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:kyucsa/pages/homepage.dart';
import 'package:kyucsa/screens/welcome.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Signup'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(

            context,
            MaterialPageRoute(builder: (context)
            => const WelcomeScreen()
            ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/pics/sign.jpg',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20,),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the main screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  //primary: Colors.blue, // Background color
                  //onPrimary: Colors.white, // Text color
                  minimumSize: const Size(200, 60), // Size of the button
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                child: const Text('SUBMIT'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(33, 65, 45, 100),
        //body
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              const Text(
                'Tasty',
                style: TextStyle(color: Colors.white, fontSize: 44),
              ),
              const SizedBox(
                height: 120,
              ),
              const Text(
                'Find Your Next Favorite Dish With Tasty',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(width: 2.0))),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(width: 2.0))),
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () {
                      debugPrint('forget password');
                    },
                    child: const Text(
                      'forget password?',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                iconAlignment: IconAlignment.end,
                onPressed: () {},
                label: const Text('Explore the app', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                icon: const Icon(Icons.arrow_forward),
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromRGBO(33, 65, 45, 100),
                  fixedSize: const Size(200, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ]),
          ),
        ));
  }
}

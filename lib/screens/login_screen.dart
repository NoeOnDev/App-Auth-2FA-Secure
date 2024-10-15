import 'package:flutter/material.dart';
import '/widgets/custom_text_field.dart';
import '/widgets/custom_button.dart';
import '/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void _login() async {
    final email = _usernameController.text;
    final password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      final result = await _authService.login(email, password);

      if (!mounted) return;

      if (result != null) {
        int userId = result['userId'];
        Navigator.pushReplacementNamed(
          context,
          '/2fa',
          arguments: userId,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid credentials')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  void _goToRegister() {
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: -150,
            left: -170,
            child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 39, 11, 163),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -240,
            left: 0,
            child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 39, 11, 163),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -140,
            right: -230,
            child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 4, 54, 95),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -265,
            right: 0,
            child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 4, 54, 95),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double containerWidth = constraints.maxWidth * 0.90;
                double buttonPosition = constraints.maxWidth * 0.85 - 30;

                return Stack(
                  children: <Widget>[
                    Positioned(
                      left: 0,
                      right: 0,
                      top: MediaQuery.of(context).size.height / 2 - 180,
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 52,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 40),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 0),
                              width: containerWidth,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(65),
                                  bottomRight: Radius.circular(65),
                                ),
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.grey[300]!,
                                    width: 3.5,
                                  ),
                                  right: BorderSide(
                                    color: Colors.grey[300]!,
                                    width: 3.5,
                                  ),
                                  bottom: BorderSide(
                                    color: Colors.grey[300]!,
                                    width: 3.5,
                                  ),
                                  left: BorderSide.none,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  CustomTextField(
                                    controller: _usernameController,
                                    labelText: 'Email',
                                    icon: Icons.email_outlined,
                                  ),
                                  const Divider(
                                    color: Colors.grey,
                                    height: 0,
                                  ),
                                  CustomTextField(
                                    controller: _passwordController,
                                    labelText: 'Password',
                                    icon: Icons.lock_outlined,
                                    obscureText: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 115),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: containerWidth * 0.35,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                                border: Border(
                                  top: BorderSide(
                                    color: Colors.grey[300]!,
                                    width: 3.5,
                                  ),
                                  right: BorderSide(
                                    color: Colors.grey[300]!,
                                    width: 3.5,
                                  ),
                                  bottom: BorderSide(
                                    color: Colors.grey[300]!,
                                    width: 3.5,
                                  ),
                                  left: BorderSide.none,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: TextButton(
                                onPressed: _goToRegister,
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: buttonPosition,
                      top: MediaQuery.of(context).size.height / 2 + -27,
                      child: CustomButton(
                        onPressed: _login,
                        icon: Icons.arrow_forward,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

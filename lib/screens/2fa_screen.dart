import 'package:flutter/material.dart';

class TwoFAScreen extends StatefulWidget {
  const TwoFAScreen({super.key});

  @override
  State<TwoFAScreen> createState() => _TwoFAScreenState();
}

class _TwoFAScreenState extends State<TwoFAScreen> {
  final TextEditingController _codeController = TextEditingController();

  void _verifyCode() {
    if (_codeController.text == '123456') {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Código incorrecto')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verificación 2FA'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _codeController,
              decoration:
                  const InputDecoration(labelText: 'Ingrese el código 2FA'),
              keyboardType: TextInputType.number,
              maxLength: 6,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyCode,
              child: const Text('Verificar'),
            ),
          ],
        ),
      ),
    );
  }
}

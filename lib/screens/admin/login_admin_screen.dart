import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'admin_dashboard_screen.dart';

class LoginAdminScreen extends StatefulWidget {
  const LoginAdminScreen({super.key});

  @override
  State<LoginAdminScreen> createState() => _LoginAdminScreenState();
}

class _LoginAdminScreenState extends State<LoginAdminScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  static const String _adminUsername = "admin";
  static const String _adminPassword = "admin123";

  void _login() {
    final usernameInput = _usernameController.text.trim();
    final passwordInput = _passwordController.text;

    if (usernameInput.isEmpty || passwordInput.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username dan password wajib diisi!"),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (usernameInput == _adminUsername && passwordInput == _adminPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login berhasil"),
          backgroundColor: Color(0xFF6B113B),
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AdminDashboardScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username atau password salah!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Panel Admin"),
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "< Kembali",
            style: TextStyle(color: AppTheme.darkTextColor, fontWeight: FontWeight.bold),
          ),
        ),
        leadingWidth: 90,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Masuk sebagai pengelola",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text("Username", style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.darkTextColor)),
            const SizedBox(height: 6),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: "Masukkan username",
              ),
            ),
            const SizedBox(height: 14),
            const Text("Password", style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.darkTextColor)),
            const SizedBox(height: 6),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Masukkan password",
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _login,
                child: const Text("Masuk"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CreatedAccountPage extends StatelessWidget {
  const CreatedAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF76BD9C),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),

              // รูป Register.png
              Image.asset(
                'assets/icons/Register.png',
                height: 120,
              ),

              const SizedBox(height: 16),

              // รูป Text.png
              Image.asset(
                'assets/icons/Register-text.png',
                height: 60,
              ),

              const SizedBox(height: 32),

              // Input fields
              _buildTextField(label: 'First Name'),
              _buildTextField(label: 'Last Name'),
              _buildTextField(label: 'Email', keyboardType: TextInputType.emailAddress),
              _buildTextField(label: 'Username'),
              _buildTextField(label: 'Password', obscureText: true),
              _buildTextField(label: 'Password Again', obscureText: true),

              const SizedBox(height: 24),

              // Register button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // TODO: handle registration
                },
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Color(0xFF76BD9C),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          filled: true,
          fillColor: Colors.white.withOpacity(0.2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

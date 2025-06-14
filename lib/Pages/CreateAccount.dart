import 'package:flutter/material.dart';

class CreatedAccountPage extends StatelessWidget {
  const CreatedAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> inputLabels = [
      '0 - First Name',
      'Last Name',
      'Email',
      'Username',
      'Password',
      'Password Again',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF76BD9C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),

                Image.asset(
                  'assets/icons/Register.png',
                  width: 144,
                  height: 144,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 12),

                Image.asset(
                  'assets/icons/registerlogotext.png',
                  width: 266,
                  height: 45,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 16),

                // Input Fields
                ...inputLabels.map((label) {
                  return _buildTextField(
                    label: label,
                    obscureText: label.toLowerCase().contains('password'),
                    keyboardType: label == 'Email' ? TextInputType.emailAddress : TextInputType.text,
                  );
                }).toList(),

                const SizedBox(height: 16),

                // Register Button
                SizedBox(
                  width: 149,
                  height: 36,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    onPressed: () {
                      // TODO: handle registration
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        color: Color(0xFF76BD9C),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
              ],
            ),
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
      padding: const EdgeInsets.symmetric(vertical: 3.0), // รวมให้แน่นขึ้น
      child: SizedBox(
        width: 225,
        height: 125,
        child: TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: label,
            hintStyle: const TextStyle(
              color: Color(0xFFDBDBDB),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          ),
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

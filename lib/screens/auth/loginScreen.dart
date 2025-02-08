import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:vividdrive/screens/auth/widget/custom_button.dart';
import 'package:vividdrive/screens/auth/widget/textfield.dart';


/// A stateless widget representing the Login screen.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false; // Track password visibility

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive layouts
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Custom painted curved background
            CustomPaint(
              size: Size(screenWidth,
                  screenHeight * 0.3), // Dynamic height based on screen size
              painter: CurvedPainter(),
            ),
            // Main content of the form
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      screenWidth * 0.05), // 5% padding from left and right
              child: SingleChildScrollView(
                // Ensure scrollability on smaller screens
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Space between top and content
                    SizedBox(height: screenHeight * 0.1),

                    // Login Text
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: screenWidth * 0.08, // Dynamic font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    // Space between title and text fields
                    SizedBox(height: screenHeight * 0.1),

                    // Form fields
                    const CustomTextField(
                      hintText: 'Email',
                      icon: Icons.email,
                    ),
                    const SizedBox(height: 10),

                    // Password TextField with visibility toggle
                    CustomTextField(
                      hintText: 'Password',
                      icon: Icons.lock,
                      isPassword:
                          !_isPasswordVisible, // Toggle password visibility
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Remember Me Toggle and Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Remember Me Switch
                            /* Switch(
                              value: _isRememberMeChecked,
                              onChanged: (value) {
                                setState(() {
                                  _isRememberMeChecked = value;
                                });
                              },
                              activeColor:
                                  Colors.red, // Red color when toggled on
                              inactiveThumbColor:
                                  Colors.white, // White button when off
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Remember Me',
                              style: TextStyle(fontSize: 16),
                            ), */
                          ],
                        ),

                        // Forgot Password Button
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/forgetpassword');
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Login Button
                    CustomButton(
                      text: 'Login',
                      onPressed: () {
                        Get.toNamed('/nav');
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      fontSize: screenWidth * 0.05,
                      borderRadius: 10,
                    ),

                    // Space between buttons
                    const SizedBox(height: 20),

                    // Divider with "or"
                    Row(
                      children: [
                        const Expanded(child: Divider(thickness: 1)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('or'),
                        ),
                        const Expanded(child: Divider(thickness: 1)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Google Login Button
                    

                    // Sign Up redirection text
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Do not have an account yet?',
                            style: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(width: 3),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/Signup');
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// CustomPainter for the curved background that appears at the top of the screen.
class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue; // Red background color
    Path path = Path();

    // Draw the curve
    path.lineTo(0, size.height - 27); // Adjusted lower-left corner height
    path.quadraticBezierTo(
      size.width / 4, // Control point X
      size.height - 40, // Control point Y (height)
      size.width, // End point X
      size.height - 80, // End point Y (height)
    );
    path.lineTo(size.width, 0); // Top-right corner
    path.close(); // Close the path

    // Draw the path on the canvas
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

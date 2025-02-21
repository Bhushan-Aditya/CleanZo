import 'package:flutter/material.dart';
// Assuming HomePage is in 'home_page.dart' within the screens folder.
// If your HomePage is in a different location, adjust the import path.
import 'home_page.dart'; // <-- Import HomePage

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false; // To manage loading state for the button

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async { // Make _handleLogin async to handle loading state and potential delays
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Start loading
      });

      // Get email and password from controllers
      final email = _emailController.text;
      final password = _passwordController.text;

      // **Important: Implement your actual login logic here.**
      // (Replace the placeholder print with your backend communication)
      print('Login attempt - Email: $email, Password: $password');

      // Simulate a delay for login process (replace with your actual login logic)
      await Future.delayed(const Duration(seconds: 2)); // Remove or adjust this delay in real app

      setState(() {
        _isLoading = false; // Stop loading
      });

      // **Navigation to HomePage after successful login:**
      // Using MaterialPageRoute for direct navigation to HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()), // <-- Navigate to HomePage
      );
      // OR if you are using named routes, use:
      // Navigator.pushReplacementNamed(context, '/home'); // Assuming '/home' route is defined
    }
  }

  @override
  Widget build(BuildContext context) {
    // **Color Palette:** (Slightly adjusted colors for a softer look)
    const mainColor = Color(0xFF323232);
    const fontColorSub = Color(0xFF777777); // Slightly lighter sub-text color
    const inputFocusColor = Color(0xFF2D8CF0);
    const backgroundColor = Colors.white;
    const formBackgroundColor = Color(0xFFF0F0F0); // Light grey form background

    return Scaffold(
      body: Center( // <--- Center widget to center content vertically and horizontally
        child: Padding( // Added Padding around the entire body for screen edge spacing
          padding: const EdgeInsets.all(24.0), // Adjust padding value as needed
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: formBackgroundColor, // Using the softer grey form background
                borderRadius: BorderRadius.circular(10), // Slightly more rounded corners
                border: Border.all(width: 1, color: mainColor), // Thinner border, can adjust width
                boxShadow: const [
                  BoxShadow(
                    color: mainColor,
                    offset: Offset(3, 3), // Adjusted shadow offset
                    blurRadius: 2,         // Added blur radius for a softer shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24), // Increased padding inside container
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children to fill width
                  mainAxisSize: MainAxisSize.min, // Minimize column height to content
                  children: [
                    // **Title Text: "Welcome Back," (Centered Title)**
                    Center( // Center the title text
                      child: Text(
                        'Welcome Back,',
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 22, // Slightly larger font size for title
                        ),
                        textAlign: TextAlign.center, // Explicitly center text
                      ),
                    ),
                    const SizedBox(height: 8), // Reduced spacing
                    // **Sub-title Text: "login to continue" (Centered Subtitle)**
                    Center( // Center the subtitle text
                      child: Text(
                        'login to continue',
                        style: TextStyle(
                          color: fontColorSub,
                          fontWeight: FontWeight.w600,
                          fontSize: 16, // Slightly smaller font size for subtitle
                        ),
                        textAlign: TextAlign.center, // Explicitly center text
                      ),
                    ),
                    const SizedBox(height: 30), // Increased spacing after titles

                    // **Email Form Field:**
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email', // Using labelText for better accessibility and UI clarity
                        hintText: 'you@example.com', // More helpful hint text
                        labelStyle: TextStyle(color: fontColorSub), // Label text color
                        hintStyle: TextStyle(color: fontColorSub.withOpacity(0.6)), // Lighter hint text
                        fillColor: backgroundColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: mainColor.withOpacity(0.7), width: 1), // Slightly lighter border
                          borderRadius: BorderRadius.circular(8), // Rounded input borders
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: inputFocusColor, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0), // Adjust content padding
                      ),
                    ),
                    const SizedBox(height: 16), // Reduced spacing

                    // **Password Form Field:**
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password', // Using labelText
                        hintText: 'Your password', // More helpful hint text
                        labelStyle: TextStyle(color: fontColorSub), // Label text color
                        hintStyle: TextStyle(color: fontColorSub.withOpacity(0.6)), // Lighter hint text
                        fillColor: backgroundColor,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: mainColor.withOpacity(0.7), width: 1), // Slightly lighter border
                          borderRadius: BorderRadius.circular(8), // Rounded input borders
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: inputFocusColor, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0), // Adjust content padding
                      ),
                    ),
                    const SizedBox(height: 20), // Reduced spacing

                    // **"Login with" Social Icons Row (Optional):**
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround, // Spread icons more evenly
                      children: [
                        _RoundIconButton(
                          icon: const Icon(
                            Icons.apple,
                            color: mainColor,
                            size: 28, // Slightly larger icons
                          ),
                          onTap: () {
                            // Handle Apple login
                            print('Apple Login Tapped');
                          },
                        ),
                        _RoundIconButton(
                          icon: const Icon(
                            Icons.g_mobiledata,
                            color: mainColor,
                            size: 28, // Slightly larger icons
                          ),
                          onTap: () {
                            // Handle Google login
                            print('Google Login Tapped');
                          },
                        ),
                        _RoundIconButton(
                          icon: const Icon(
                            Icons.facebook,
                            color: mainColor,
                            size: 28, // Slightly larger icons
                          ),
                          onTap: () {
                            // Handle Facebook login
                            print('Facebook Login Tapped');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30), // Increased spacing before button

                    // **"Login" Button (Loading State and Centered):**
                    Center( // Center the button
                      child: SizedBox( // Use SizedBox to control button width
                        width: 150, // Set a fixed width for the button
                        height: 45,  // Set a fixed height for the button
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _handleLogin, // Disable button when loading
                          style: ElevatedButton.styleFrom(
                            backgroundColor: backgroundColor, // Button background color
                            foregroundColor: mainColor,     // Button text color
                            elevation: 3,                  // Button elevation (shadow)
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8), // Rounded button corners
                              side: BorderSide(color: mainColor, width: 1), // Button border
                            ),
                            padding: EdgeInsets.zero, // Remove default button padding for custom size
                          ),
                          child: _isLoading // Show loading indicator or text based on _isLoading
                              ? const SizedBox(
                            width: 24, height: 24,
                            child: CircularProgressIndicator(strokeWidth: 3, color: mainColor),
                          )
                              : const Text(
                            'Login',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600), // Larger button text
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// **Reusable Round Icon Button Widget:** (No changes needed)
class _RoundIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onTap;

  const _RoundIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const mainColor = Color(0xFF323232);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50, // Slightly larger button size
        height: 50, // Slightly larger button size
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: mainColor), // Thinner border for icons
          boxShadow: const [
            BoxShadow(
              color: mainColor,
              offset: Offset(3, 3), // Adjusted shadow for icons
              blurRadius: 2,         // Added blur radius for icons
            ),
          ],
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
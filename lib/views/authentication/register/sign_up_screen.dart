import 'package:flutter/material.dart';
import '../../../components/txt_box.dart';
import '../../../src/app_color.dart';
import '../login/login_screen.dart'; // Ensure you import your MapView

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String location = "Choose your city";
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false; // Local state for loading

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryColor,
      // appBar: AppBar(
      //   centerTitle: true,
      //   elevation: 0.0,
      //   backgroundColor: AppColor.defaultColor,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildSignUpForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
        color: AppColor.defaultColor,
      ),
      child: Center(
        child: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TxtBox(
              label: 'Full Name',
              txtController: nameController,
              icon: Icons.person_rounded,
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 25),
            TxtBox(
              label: 'Age',
              txtController: ageController,
              icon: Icons.person,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 25),
            TxtBox(
              label: 'Phone Number',
              txtController: phoneController,
              icon: Icons.phone_rounded,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 25),
            TxtBox(
              label: 'Email Address',
              txtController: emailController,
              icon: Icons.email_rounded,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 25),
            TxtBox(
              label: 'Password',
              txtController: passwordController,
              icon: Icons.lock,
              keyboardType: TextInputType.visiblePassword,
              // obscureText: true,
            ),
            SizedBox(height: 25),
            _buildLocationButton(),
            SizedBox(height: 25),
            _buildSignUpButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationButton() {
    return Container(
      width: 340,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColor.textBoxBackgroundColor,
      ),
      child: MaterialButton(
        onPressed: () async {
          // String? selectedLocation = await Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => MapView(),
          //   ),
          // );
          // if (selectedLocation != null) {
          //   setState(() {
          //     location = selectedLocation;
          //   });
          // }
        },
        child: Row(
          children: [
            Icon(
              Icons.location_on,
              color: AppColor.iconsColor,
            ),
            SizedBox(width: 10),
            Text(
              location,
              style: TextStyle(
                color: location == "Choose your city" ? AppColor.txtShade : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return isLoading
        ? Center(child: CircularProgressIndicator(color: Colors.orangeAccent))
        : MaterialButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  isLoading = true; // Set loading state
                });

                // Create a UserModel instance
                // UserModel _ = UserModel(
                //   email: emailController.text,
                //   age: ageController.text,
                //   address: location,
                //   password: passwordController.text,
                //   phone: phoneController.text,
                //   name: nameController.text,
                // );

                // Simulate a registration process
                Future.delayed(Duration(seconds: 2), () {
                  setState(() {
                    isLoading = false; // Reset loading state
                  });

                  // Here you would typically send the user data to your backend
                  // MyToast.getToast("Registration successful!"); // Show success message
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                });
              }
            },
            color: AppColor.defaultColor,
            height: 60,
            minWidth: 250,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
  }
}

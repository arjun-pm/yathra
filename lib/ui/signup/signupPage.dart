import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yathra/common/widgets/bookingFormTextFields.dart';
import 'package:yathra/ui/login/loginPage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  late SharedPreferences registerData;

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    addressController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/icons/logo.png",
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              Text(
                "Lets get started!",
                style: GoogleFonts.openSans(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: BookingFormTextFields(
                  hint: "Name",
                  controller: nameController,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: BookingFormTextFields(
                  hint: "Phone",
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: BookingFormTextFields(
                  hint: "Address",
                  controller: addressController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: BookingFormTextFields(
                  hint: "Email",
                  controller: emailController,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                child: BookingFormTextFields(
                  hint: "Password",
                  controller: passwordController,
                  maxLines: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 20.0),
                child: BookingFormTextFields(
                  hint: "Confirm Password",
                  controller: confirmPasswordController,
                  maxLines: 1,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if(nameController.text.isEmpty &&
                      emailController.text.isEmpty &&
                      phoneController.text.isEmpty &&
                      addressController.text.isEmpty &&
                      passwordController.text.isEmpty &&
                      confirmPasswordController.text.isEmpty
                  ){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.cyan.shade600,
                        content: const Text("Please fill all fields"),
                      ),
                    );
                  }else {
                    addtoSharedPreference();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan.shade600,
                ),
                child: Text(
                  "   Create Account   ",
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.openSans(
                        color: Colors.cyan.shade600,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addtoSharedPreference() async {

    registerData = await SharedPreferences.getInstance();

    String name = nameController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String address = addressController.text;
    String password = passwordController.text;

    if (email != "" && password != ""){
      registerData.setString("name", name);
      registerData.setString("email", email);
      registerData.setString("phone", phone);
      registerData.setString("address", address);
      registerData.setString("password", password);
    }
  }
}

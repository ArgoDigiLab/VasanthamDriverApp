import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vasanthamdriverapp/theme/color_palette.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _phone;
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.btnColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          backgroundColor: AppColors.btnColor,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Vasantham Taxi',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.whiteBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    top: 0.0,
                    bottom: 0.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 80),
                      Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 26,
                          fontWeight: FontWeight.normal,
                          color: AppColors.head1,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 2.5,
                        color: AppColors.yellow,
                      ),
                      const SizedBox(height: 80),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _phoneController,
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            hintText: '10-digit number',
                            prefixIcon: Icon(Icons.phone_android),
                            suffixIcon: _phoneController.text.isNotEmpty
                                ? IconButton(
                                    icon: const Icon(
                                      Icons.close,
                                      color: AppColors.black,
                                    ),
                                    onPressed: () {
                                      _phoneController.clear();
                                      setState(() {});
                                    },
                                  )
                                : null,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 16,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: AppColors.lightGrey,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: AppColors.yellow,
                                width: 2,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Mobile number is required';
                            }
                            final digits = value.replaceAll(RegExp(r'\D'), '');
                            if (digits.length != 10) {
                              return 'Mobile number must have exactly 10 digits';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {});
                          },
                          onSaved: (v) => _phone = v,
                        ),
                      ),

                      const SizedBox(height: 80),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellow,
                          foregroundColor: AppColors.black,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState!.save();
                            print('Form Data: $_phone');
                          } else {
                            print('Validation failed');
                          }
                        },
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: AppColors.head1,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

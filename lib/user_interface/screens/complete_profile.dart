import 'package:crafty_bay/user_interface/utils/input_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets.dart';
import '../utils/theme_color.dart';

class CompleteProfile extends StatelessWidget {
  CompleteProfile({super.key});

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _shippingAddressController =
      TextEditingController();

  void _onProfileDetailsSubmission() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: MediaQuery.sizeOf(context).height / 10),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.logo,
                    height: MediaQuery.sizeOf(context).height / 10),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Complete Profile",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0),
                  child: Text(
                    "Get started with us with your details",
                    style: TextStyle(color: ThemeColor.softBlack),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) {
                      if (value != null) {
                        if (value.trim().isEmpty) {
                          return "Please enter your first name";
                        }
                        return null;
                      }
                      return null;
                    },
                    controller: _firstNameController,
                    decoration: InputDecoration(hintText: "First name"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) {
                      if (value != null) {
                        if (value.trim().isEmpty) {
                          return "Please enter your last name";
                        }
                        return null;
                      }
                      return null;
                    },
                    controller: _lastNameController,
                    decoration: InputDecoration(hintText: "Last name"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) {
                      if (value != null) {
                        if (value.trim().isEmpty) {
                          return "Please enter your mobile number";
                        } else if (!InputVerification.phoneNumberValidator
                            .hasMatch(value)) {
                          return "Please enter a valid number";
                        }
                        return null;
                      }
                      return null;
                    },
                    controller: _mobileController,
                    decoration: InputDecoration(hintText: "Mobile"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) {
                      if (value != null) {
                        if (value.trim().isEmpty) {
                          return "Please enter your city name";
                        }
                        return null;
                      }
                      return null;
                    },
                    controller: _cityController,
                    decoration: InputDecoration(hintText: "City"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: TextFormField(

                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) {
                      if (value != null) {
                        if (value.trim().isEmpty) {
                          return "Please enter your shipping address";
                        }
                        return null;
                      }
                      return null;
                    },
                    controller: _shippingAddressController,
                    maxLines: 3,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        hintText: "Shipping Address"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: ElevatedButton(
                      onPressed: _onProfileDetailsSubmission,
                      child: Text("Complete")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

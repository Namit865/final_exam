import 'package:final_exam/Model/contactmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class addContact extends StatefulWidget {
  const addContact({super.key});

  @override
  State<addContact> createState() => _addContactState();
}

class _addContactState extends State<addContact> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Add New Contacts",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: firstNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Can't Remain Blank";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text("First Name"),
                  alignLabelWithHint: true,
                  border: UnderlineInputBorder(),
                ),
              ),
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  label: Text("Last Name"),
                  alignLabelWithHint: true,
                  border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Can't Remain Blank";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  label: Text("Contact Number"),
                  alignLabelWithHint: true,
                  prefixText: "+91 ",
                  border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Phone Number Can't Remain Blank";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text("Email Address"),
                  alignLabelWithHint: true,
                  border: UnderlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Valid Email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: const ButtonStyle(
                      side: MaterialStatePropertyAll(
                        BorderSide(style: BorderStyle.solid),
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Cancel"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    style: const ButtonStyle(
                      side: MaterialStatePropertyAll(
                        BorderSide(style: BorderStyle.solid),
                      ),
                    ),
                    onPressed: () {
                      Contact newContact = Contact(
                        email: emailController.text,
                        firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        phoneNumber: phoneController.text,
                      );
                      Get.back(result: newContact);
                    },

                    child: const Text("Save"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vyzen/model/form_input.dart';
import 'package:vyzen/model/input_type.dart';

class FormScreen extends StatefulWidget {
  final String? formId;

  const FormScreen({super.key, this.formId});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  var currentIndex = 0;
  final formFields = [
    [
      FormInput(
        name: "email",
        labelText: "Email",
        description: "Enter your email",
        inputType: InputType.email,
        mandatory: true,
      ),
      FormInput(
        name: "firstname",
        labelText: "First Name",
        description: "Enter your first name",
        inputType: InputType.text,
        mandatory: true,
      ),
      FormInput(
        name: "middlename",
        labelText: "Middle Name",
        description: "Enter your middle name",
        inputType: InputType.text,
        mandatory: false,
      ),
      FormInput(
        name: "lastname",
        labelText: "Last Name",
        description: "Enter your last name",
        inputType: InputType.text,
        mandatory: true,
      ),
      FormInput(
        name: "phone",
        labelText: "Phone No",
        description: "Enter your phone number",
        inputType: InputType.number,
        mandatory: true,
      ),
      FormInput(
        name: "alternativephone",
        labelText: "Alternative Phone No",
        description: "Enter your alternative phone number",
        inputType: InputType.number,
        mandatory: true,
      ),
      FormInput(
        name: "dob",
        labelText: "Date of Birth",
        description: "Enter your date of birth",
        inputType: InputType.date,
        mandatory: true,
      ),
      FormInput(
        name: "age",
        labelText: "Age",
        description: "Enter your age",
        inputType: InputType.number,
        mandatory: true,
      ),
      FormInput(
        name: "gender",
        labelText: "Gender",
        description: "Enter your gender",
        inputType: InputType.radio,
        mandatory: true,
        options: ["Male", "Female", "Other"],
      ),
      FormInput(
        name: "maritalstatus",
        labelText: "Marital Status",
        description: "Enter your marital status",
        inputType: InputType.radio,
        mandatory: true,
        options: [
          "Single",
          "Married",
          "Divorced",
          "Widowed",
        ],
      ),
      FormInput(
        name: "bloodgroup",
        labelText: "Blood Group",
        description: "Enter your blood group",
        inputType: InputType.radio,
        mandatory: true,
        options: [
          "A+",
          "A-",
          "B+",
          "B-",
          "AB+",
          "AB-",
          "O+",
          "O-",
        ],
      ),
    ],
    //page 2
    [
      FormInput(
          name: "residentialaddress",
          labelText: "Residential Address",
          description: "Enter your residential address",
          inputType: InputType.text,
          mandatory: true),
      FormInput(
          name: "permanentaddress",
          labelText: "Permanent Address",
          description: "Enter your permanent address",
          inputType: InputType.text,
          mandatory: true),
      FormInput(
          name: "location",
          labelText: "Location",
          description: "Enter your location",
          inputType: InputType.text,
          mandatory: true),
      FormInput(
        name: "preferedLocation",
        labelText: "Prefered Location",
        description: "Enter your prefered location",
        inputType: InputType.text,
        mandatory: true,
      )
    ],
    //Page 3
    [
      FormInput(
        name: "hasPassport",
        labelText: "Has Passport",
        description: "Enter your has passport",
        inputType: InputType.radio,
        mandatory: true,
        options: [
          "Yes",
          "No",
        ],
      ),
      FormInput(
        name: "passportNumber",
        labelText: "Passport Number",
        description: "Enter your passport number",
        inputType: InputType.text,
        mandatory: false,
      ),
      FormInput(
        name: "passportFile",
        labelText: "Attach Passport File",
        description: "Enter your passport file",
        inputType: InputType.image,
        mandatory: true,
      ),
      FormInput(
        name: "aadharNo",
        labelText: "Aadhar Number",
        description: "Enter your aadhar number",
        inputType: InputType.number,
        mandatory: true,
      ),
      FormInput(
        name: "aadharFile",
        labelText: "Attach Aadhar File",
        description: "Enter your aadhar file",
        inputType: InputType.image,
        mandatory: true,
      ),
      FormInput(
        name: "panNo",
        labelText: "PAN Number",
        description: "Enter your pan number",
        inputType: InputType.text,
        mandatory: true,
      ),
      FormInput(
        name: "panFile",
        labelText: "Attach PAN File",
        description: "Enter your pan file",
        inputType: InputType.image,
        mandatory: true,
      ),
      FormInput(
        name: "drivingLicenseNo",
        labelText: "Driving License Number",
        description: "Enter your driving license number",
        inputType: InputType.text,
        mandatory: false,
      ),
      FormInput(
        name: "drivingLicenseFile",
        labelText: "Attach Driving License File",
        description: "Enter your driving license file",
        inputType: InputType.file,
        mandatory: false,
      ),
      FormInput(
        name: "voterIdNo",
        labelText: "Voter ID Number",
        description: "Enter your voter id number",
        inputType: InputType.text,
        mandatory: false,
      ),
      FormInput(
        name: "voterIdFile",
        labelText: "Attach Voter ID File",
        description: "Enter your voter id file",
        inputType: InputType.image,
        mandatory: false,
      ),
    ],
    [
      FormInput(
        name: "picture",
        labelText: "Picture",
        description: "Enter your picture",
        inputType: InputType.image,
        mandatory: true,
      ),
      FormInput(
        name: "linkedin",
        labelText: "Linkedin",
        description: "Enter your linkedin",
        inputType: InputType.text,
        mandatory: true,
      ),
      FormInput(
        name: "resume",
        labelText: "Resume",
        description: "Enter your resume",
        inputType: InputType.file,
        mandatory: true,
      ),
      FormInput(
        name: "onlinePortfolio",
        labelText: "Online Portfolio",
        description: "Enter your online portfolio",
        inputType: InputType.text,
        mandatory: true,
      ),
      FormInput(
        name: "socialMedia",
        labelText: "Social Media",
        description: "Enter your social media",
        inputType: InputType.text,
        mandatory: true,
      ),
      FormInput(
        name: "skills",
        labelText: "Skills",
        description: "Enter your skills",
        inputType: InputType.text,
        mandatory: true,
      ),
      FormInput(
        name: "languages",
        labelText: "Languages",
        description: "Enter your languages",
        inputType: InputType.text,
        mandatory: true,
      ),
    ],
    [
      FormInput(
        name: "education",
        labelText: "Education",
        description: "Enter your education",
        inputType: InputType.text,
        mandatory: true,
      ),
      FormInput(
        name: "experience",
        labelText: "Experience",
        description: "Enter your experience",
        inputType: InputType.text,
        mandatory: true,
      ),
      FormInput(
        name: "educationInstitute",
        labelText: "Education Institute",
        description: "Enter your education institute",
        inputType: InputType.text,
        mandatory: true,
      ),
      FormInput(
        name: "yearOfPassing",
        labelText: "Year of Passing",
        description: "Enter your year of passing",
        inputType: InputType.text,
        mandatory: true,
      ),
      FormInput(
        name: "percentage",
        labelText: "Percentage",
        description: "Enter your percentage",
        inputType: InputType.text,
        mandatory: true,
      ),
      FormInput(
        name: "educationFile",
        labelText: "Attach Education File",
        description: "Enter your education file",
        inputType: InputType.file,
        mandatory: true,
      ),
      FormInput(
        name: "isFresher",
        labelText: "Is Fresher",
        description: "Are you a fresher",
        inputType: InputType.radio,
        options: [
          "Yes",
          "No",
        ],
        mandatory: true,
      ),
    ],
    //
    [
      FormInput(
        name: "consentBackgroundChecks",
        labelText: "Consent Background Checks",
        description: "Do you consent to background checks",
        inputType: InputType.radio,
        options: [
          "Yes",
          "No",
        ],
        mandatory: true,
      ),
      FormInput(
          name: "consentDrugTest",
          labelText: "Consent Drug Test",
          description: "Do you consent to drug test",
          inputType: InputType.radio,
          mandatory: true,
          options: ["Yes", "No"]),
      FormInput(
          name: "hasCriminalCase",
          labelText: "Has Criminal Case",
          description: "Do you have a criminal case",
          inputType: InputType.radio,
          mandatory: true,
          options: ["Yes", "No"]),
      FormInput(
        name: "criminalCase",
        labelText: "About Criminal Case",
        description: "About your criminal case (if any)",
        inputType: InputType.text,
        mandatory: false,
      ),
    ]
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    if (widget.formId != null) {
      var data = (await FirebaseFirestore.instance
              .collection('forms')
              .doc(widget.formId)
              .get())
          .data();
      if (data == null) return;
      formFields.expand((elements) => elements).forEach((element) {
        if (data.containsKey(element.name)) {
          if (data[element.name] is Timestamp) {
            element.value = DateTime.fromMillisecondsSinceEpoch(
                data[element.name].millisecondsSinceEpoch);
          } else {
            element.value = data[element.name];
          }
        }
      });
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Screen'),
      ),
      body: Column(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  'This a Form Screen, Some random text to make it longer, to see if it works. Bla bla bla bls'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: formFields[currentIndex].length,
              itemBuilder: (context, index) {
                return buildTextField(
                    formFields[currentIndex][index], widget.formId != null);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                FilledButton.tonal(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(5.0),
                  ),
                  onPressed: () {
                    setState(() {
                      if (currentIndex > 0) currentIndex--;
                    });
                  },
                  child: const Text('Previous'),
                ),
                const SizedBox(
                  width: 10,
                ),
                //animate progress change
                Expanded(
                  child: LinearProgressIndicator(
                    value: currentIndex / (formFields.length - 1),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                //padding 8 for all sides
                FilledButton.tonal(
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.all(5.0),
                  ),
                  onPressed: () async {
                    debugPrint("length: " +
                        formFields[currentIndex].length.toString());
                    for (var i = 0; i < formFields[currentIndex].length; i++) {
                      var input = formFields[currentIndex][i];
                      print(
                          'Checking input: ${input.labelText}, value: ${input.value}');
                      if (input.mandatory) {
                        if (input.value == null ||
                            input.value.toString().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('${input.labelText} is needed'),
                            backgroundColor: Colors.red,
                          ));
                          return;
                        }
                      }
                      print(
                          'completed Checking input: ${input.labelText}, value: ${input.value}');
                    }
                    print("for completed");
                    if (currentIndex == formFields.length - 1) {
                      if (widget.formId != null) {
                        Navigator.pop(context);
                        return;
                      }
                      Map<String, dynamic> data = {};
                      for (var elements in formFields) {
                        for (var element in elements) {
                          print(element);
                          if (element.value != null) {
                            data.putIfAbsent(element.name, () => element.value);
                          }
                        }
                      }
                      await FirebaseFirestore.instance
                          .collection('forms')
                          .add(data);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Form submitted'),
                        backgroundColor: Colors.green,
                      ));
                      Navigator.pop(context);
                      return;
                    } else {
                      setState(() {
                        currentIndex++;
                      });
                    }
                  },
                  child: Text(currentIndex == formFields.length - 1
                      ? widget.formId == null
                          ? 'Submit'
                          : 'Exit'
                      : 'Next'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextField(FormInput formInput, bool readOnly) {
    if (formInput.inputType == InputType.email ||
        formInput.inputType == InputType.text ||
        formInput.inputType == InputType.number) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(formInput.description),
            ),
            TextField(
              readOnly: readOnly,
              keyboardType: formInput.inputType == InputType.number
                  ? const TextInputType.numberWithOptions(decimal: false)
                  : null,
              controller: TextEditingController(
                text: formInput.value?.toString() ?? "",
              ),
              onChanged: (value) {
                formInput.value = value;
              },
              inputFormatters: formInput.inputType == InputType.number
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : [],
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: formInput.labelText,
              ),
            ),
          ],
        ),
      );
    } else if (formInput.inputType == InputType.radio) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(formInput.description),
            ),
            Column(
              children: formInput.options!
                  .map((option) => Row(
                        children: [
                          Radio<String?>(
                            value: option,
                            groupValue: formInput.value,
                            onChanged: (value) {
                              if (readOnly) return;
                              setState(() {
                                formInput.value = value;
                              });
                            },
                          ),
                          Text(option),
                        ],
                      ))
                  .toList(),
            ),
          ],
        ),
      );
    } else if (formInput.inputType == InputType.file ||
        formInput.inputType == InputType.image) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(formInput.description),
            ),
            TextField(
              onTap: () {
                if (readOnly) {
                  try {
                    launchUrl(Uri.parse(formInput.value!));
                  } catch (e) {}
                }
              },
              readOnly: true,
              controller: TextEditingController(
                  text: formInput.value?.toString() ?? ""),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: formInput.labelText,
                suffixIcon: IconButton(
                  icon: Icon(Icons.file_upload),
                  onPressed: () async {
                    if (readOnly) {
                      try {
                        launchUrl(Uri.parse(formInput.value!));
                      } catch (e) {}
                      return;
                    }
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(
                            type: formInput.inputType == InputType.image
                                ? FileType.image
                                : FileType.any);
                    if (result != null) {
                      File file = File(result.files.single.path!);
                      // get file name
                      String fileName = file.path.split('/').last;
                      // handle the file name or other file-related logic here
                      setState(() {
                        formInput.value = file.path;
                      });
                      FirebaseStorage.instance
                          .ref("files")
                          .putFile(file)
                          .then((val) {
                        val.ref.getDownloadURL().then((value) {
                          setState(() {
                            formInput.value = value;
                          });
                        });
                      });
                    } else {
                      // User canceled the picker
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      );
    } else if (formInput.inputType == InputType.date) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(formInput.description),
            ),
            TextField(
              readOnly: true,
              controller: TextEditingController(
                  text: (formInput.value as DateTime?)
                          ?.toString()
                          .split(' ')[0] ??
                      ""),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: formInput.labelText,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    if (readOnly) return;
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    ).then(
                      (value) {
                        if (value != null) {
                          setState(() {
                            formInput.value = value;
                          });
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Text(formInput.inputType
          .toString()); // Return an empty widget if the input type is not recognized
    }
  }
}

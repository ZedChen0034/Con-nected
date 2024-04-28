// import 1 - Function 1, 2, 3, 4, 5, 6
// Usage: This is the fundamental Flutter package that provides Material Design widgets and basic Flutter framework functionality.
// Code: Used throughout the entire code to provide UI components like Scaffold, AppBar, Text, ListView, etc.
import 'package:flutter/material.dart';

// import 2 - Function 6 (Upload)
// Usage: Used for picking files from the device's storage.
// Code: Used in the Upload() widget to allow users to pick files for uploading, specifically in the selectFile() method.
import 'package:file_picker/file_picker.dart';

// import 3 - Function 6 (Upload)
// Usage: Provides Dart APIs for file, socket, HTTP, and other I/O support for non-web applications.
// Code: Used in the Upload() widget where files are handled, specifically in saving files locally on the device in the selectFile() method.
import 'dart:io';

// import 4 - Function 6 (Upload)
// Usage: path_provider is specifically used in the Upload widget for saving files locally
// Code: This import and functionality are relevant in the section of code that handles file uploads. When a file is picked using the FilePicker, path_provider is used to determine where this file should be saved locally on the device if necessary
import 'package:path_provider/path_provider.dart';

// import 5 - Function 7 (Email)
// Usage: This package allows to send emails from a Flutter app using the native platform's email client.
// Code: Used in the sendEmail() method to send an email with the registration data.
import 'package:flutter_email_sender/flutter_email_sender.dart';

// import 6 - Function 7 (Email)
// Usage: Provides internationalization and localization facilities, including date/time formatting.
// Code: Used to format dates in the sendEmail() method and when displaying dates in the UI (e.g., formatting the date and time for the event in the Calendar widget).
import 'package:intl/intl.dart';

// import 7 - Function 7 (Email) - kIsWeb
// Usage: Provides API to interact with the platform services like copying data to the clipboard, listening to app lifecycle events, etc.
// Code: Web emulator to view terminal print resembling email if (kIsWeb) {
import 'package:flutter/services.dart';

// import 8 - Function 7 (Email) - kIsWeb
// Usage: Provides basic utilities and foundational classes for Flutter. This includes classes that help with diagnostics and inspecting framework in a platform-independent way.
// Code: This is used implicitly in the code for platform checks (like checking if running on Web) and other foundational tasks.import
import 'package:flutter/foundation.dart';

// Global Variable for Function 1 (Disclaimer)
bool agree = false;

// Global Variable for Function 6 (Upload)
Uint8List? selectedFileBytes;
String? selectedFileName;
String? selectedFileType;
String? selectedFilePath;
bool showSuccessMessage = false;
String errorMessage = '';

class Register extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<Register> {
  // Total 25 questions (pages), Index 0~24
  // Store answers by user-click or user-input
  List<dynamic> answers = List.filled(25, '');

  // Total 25 questions (pages), Index 0~24
  // Store question titles for the email to the administrator
  List<String> questions = List.filled(25, '');

  // Total 25 questions (pages), Index 0~24
  // Track the current page index
  int currentPageIndex = 0;

  // Total 25 questions (pages), Index 0~24
  // Page Controller
  final PageController _controller = PageController(initialPage: 0);

  // For - Function 2 (Single) & Function 3 (Single)
  // Without this controller, the cursor (mouse) jumps back to the leftmost side after each typing
  Map<int, TextEditingController> otherTextControllers = {};

  // For - Function 4 (Words)
  // Without this controller, the cursor (mouse) jumps back to the leftmost side after each typing
  Map<int, TextEditingController> wordstextControllers = {};

  void initAnswersList() {
    answers = List.generate(25, (index) {
      if ([2, 3, 13, 14, 15, 17, 20, 21, 22, 23, 24].contains(index)) {
        return []; // Empty list for multi-select options
      }
      return ''; // Empty string for all other questions
    });
  }

  @override
  void initState() {
    super.initState();
    initAnswersList(); // Call this method here
    // Questions with "other" for user text input
    _controller.addListener(updatePageIndex);
    [2, 3, 12, 13, 14, 15, 17, 20, 21, 22, 23, 24].forEach((index) {
      otherTextControllers[index] = TextEditingController();
    });
  }

  void updatePageIndex() {
    if (_controller.hasClients && _controller.page != null) {
      if (currentPageIndex != _controller.page!.toInt()) {
        setState(() {
          currentPageIndex = _controller.page!.toInt();
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.removeListener(updatePageIndex); // Remove the listener
    _controller.dispose(); // Dispose of the PageController
    wordstextControllers.forEach((key, controller) {
      controller.dispose();
    });
    otherTextControllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Using FutureBuilder to wait until the PageView is built
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (int page) {
          setState(() {}); // Update the AppBar title on page change
        },
        children: <Widget>[
          Disclaimer(0, 'Disclaimer'),
          Single(1, 'Have you ever committed a Crime or Misdemeanor?',
              ['YES', 'NO']),
          Multiple(2, 'Crime Type', [
            'Theft',
            'Assault',
            'Prohibited drugs',
            'Fraud',
            'Vandalism',
            'Prefer not to say',
            'Other'
          ]),
          Multiple(
            3,
            'Crime Location',
            [
              'Home',
              'Workplace',
              'School',
              'Retail Store',
              'Airport or train station',
              'Prefer not to say',
              'Other'
            ],
          ),
          Single(
              4,
              'How Long Have You Been Involved with the Criminal Justice System?',
              [
                '0 ~ 1 year',
                '1 ~ 3 years',
                '3 ~ 5 years',
                'More than 5 years',
                'Prefer not to say'
              ]),
          Single(5, 'How Long Have You Been in Prison?', [
            '0 ~ 1 year',
            '1 ~ 3 years',
            '3 ~ 5 years',
            'More than 5 years',
            'Prefer not to say'
          ]),
          Upload(
              6, 'Upload National Police Certificate (PNG / JPG / JEPG / PDF)'),
          Words(7, 'Name', true),
          Words(8, 'Email', true),
          Words(9, 'Phone Number', true),
          Words(10, 'Home Address', false),
          Calendar(11, 'Date of Birth'),
          Single(
              12, 'Gender', ['Male', 'Female', 'Prefer not to say', 'Other']),
          Multiple(13, 'Reason for Using Our App', [
            'Support or rehabilitation',
            'Community engagement',
            'Job search assistance',
            'Educational resources',
            'Legal advice',
            'Prefer not to say',
            'Other'
          ]),
          Multiple(14, 'How Did You Hear About Our App?', [
            'Court',
            'NGO',
            'Friend or family',
            'Social media',
            'Advertising',
            'Prefer not to say',
            'Other'
          ]),
          Multiple(15, 'Hobbies and Interests', [
            'Sports',
            'Arts or crafts',
            'Reading or writing',
            'Music',
            'Computer or cell phone games',
            'Prefer not to say',
            'Other'
          ]),
          Single(16, 'Addictions of Substance or Alcohol', ['YES', 'NO']),
          Multiple(17, 'Addictions Type', [
            'Alcohol',
            'Prohibited drugs',
            'Prescription medication',
            'Cigarette',
            'Gambling',
            'Prefer not to say',
            'Other'
          ]),
          Single(18, 'Addictions Duration', [
            '0 ~ 1 year',
            '1 ~ 3 years',
            '3 ~ 5 years',
            'More than 5 years',
            'Prefer not to say'
          ]),
          Single(19, 'Marriage Status', [
            'Married',
            'Single',
            'Divorced',
            'Widowed',
            'Prefer not to say'
          ]),
          Multiple(20, 'Employment Status', [
            'Employed full-time',
            'Employed part-time',
            'Self-employed',
            'Unemployed',
            'Student',
            'Retired',
            'Unable to work',
            'Prefer not to say',
            'Other'
          ]),
          Multiple(21, 'Skills Qualification', [
            'High school diploma or equivalent',
            'Vocational or technical training',
            'Bachelor’s degree',
            'Master’s degree',
            'Doctorate or professional degree',
            'Certifications',
            'Prefer not to say',
            'Other'
          ]),
          Multiple(22, 'Religious Affiliation', [
            'Christian',
            'Buddhist',
            'Hindu',
            'Jewish',
            'Muslim',
            'Atheist',
            'Prefer not to say',
            'Other'
          ]),
          Multiple(23, 'Source of Income', [
            'Employment',
            'Self-employment',
            'Investments/Dividends',
            'Pension',
            'Government assistance',
            'Support from family or friends',
            'No income',
            'Prefer not to say',
            'Other'
          ]),
          Multiple(24, 'Health Status', [
            'No chronic health conditions',
            'Allergies',
            'Chronic illnesses',
            'Physical disabilities',
            'Mental health conditions',
            'Prefer not to say',
            'Other'
          ]),
        ],
      ),
    );
  }

  // Function 1 - Disclaimer
  Widget Disclaimer(int pageIndex, String question) {
    questions[pageIndex] = question;
    return Scaffold(
      appBar: AppBar(
        title: Text("Question (${currentPageIndex}/24)"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: agree
                ? () {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                : null, // Disable button if not checked
            child: Text('Next'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled))
                    return Colors.grey;
                  return Colors.deepPurple; // Use the default button color
                },
              ),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 50)),
              textStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  question,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  children: [
                    TextSpan(
                        text:
                            "1. The information you provide is voluntary and will be used for managing your registration and participation in the event, including updates and future related notifications.\n\n"),
                    TextSpan(
                        text:
                            "2. By submitting this form, you agree that A Curious Tractor is not liable for any errors in your submission or any consequences thereof.\n\n"),
                    TextSpan(
                        text:
                            "3. Your data will be handled according to our Privacy Policy - PDF file link.\n\n"),
                    TextSpan(
                        text:
                            "4. Ensure the accuracy of your information as you are responsible for any errors.\n\n"),
                    TextSpan(
                        text:
                            "5. If there are legal implications associated with this form, they are described here.\n\n"),
                    TextSpan(
                        text:
                            "6. For those who disagree with our disclaimer, please exit the APP.\n\n"),
                    TextSpan(
                        text:
                            "7. For those who agree with our disclaimer, please tick \"YES, I have read and agree with all the statements\", representing you confirm that you have read and understand this disclaimer and all related documents. Then, click the \"Next\" button to start the registration.\n\n"),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Checkbox(
                      value: agree,
                      onChanged: (bool? value) {
                        setState(() {
                          agree = value ??
                              false; // Update state when checkbox is toggled
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "YES, I have read and agree with all the statements",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Function 2 - Single Answer
  Widget Single(int pageIndex, String question, List<String> options) {
    questions[pageIndex] = question;
    TextEditingController _otherTextController = TextEditingController();
    bool _isOtherSelected = answers[pageIndex].startsWith('Other:');

    if (_isOtherSelected) {
      _otherTextController.text =
          answers[pageIndex].substring('Other:'.length).trim();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Question (${currentPageIndex}/24)"),
        actions: <Widget>[
          if (pageIndex != 1 ||
              answers[pageIndex]
                  .isNotEmpty) // Conditionally display the "Next" button
            ElevatedButton(
              onPressed: () {
                if (pageIndex == 1 && answers[pageIndex].isEmpty) {
                  // Optionally, you can add a message to remind the user to make a selection on the first page
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please select an answer to proceed."),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                }
              },
              child: Text('Next'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                // Button color
                foregroundColor: MaterialStateProperty.all(Colors.white),
                // Text color
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 50)),
                // Increased horizontal padding
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 20, // Larger font size
                    fontWeight:
                        FontWeight.bold, // Optional: add bold font weight
                  ),
                ),
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        // Added SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  question,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center, // Center align text, if desired
                ),
              ),
              ...options.map((option) {
                return ListTile(
                  title: Text(option),
                  leading: Radio<String>(
                    value: option,
                    groupValue: _isOtherSelected && option == 'Other'
                        ? 'Other'
                        : answers[pageIndex],
                    onChanged: (value) {
                      setState(() {
                        if (option == 'Other') {
                          _isOtherSelected = true;
                          answers[pageIndex] =
                              'Other:' + (_otherTextController.text);
                        } else {
                          answers[pageIndex] = value!;
                          _isOtherSelected = false;
                          if (pageIndex == 1) {
                            // Special handling for the first question
                            if (value == "NO") {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Ending(
                                          'images/03-sorry.png',
                                          'Sorry, our App is only open to ex-prisoners & misdemeanants. If you are still interested in registering our APP, please contact our administrator by Email: AAA@BBB.com')));
                            } else if (value == "YES") {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                            }
                          } else if (pageIndex == 16) {
                            // Special handling for 12 - addiction
                            if (value == "NO") {
                              _controller.jumpToPage(
                                  19); // Directly jump to the page with index 15
                            } else if (value == "YES") {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                            }
                          }
                        }
                        ;
                      });
                    },
                  ),
                );
              }).toList(),
              if (_isOtherSelected)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: otherTextControllers[pageIndex],
                    decoration: InputDecoration(
                      hintText: 'Please specify other...',
                    ),
                    onChanged: (value) {
                      setState(() {
                        answers[pageIndex] = 'Other: ' + value.trim();
                      });
                    },
                  ),
                ),
              // Moved the Next button to AppBar
            ],
          ),
        ),
      ),
    );
  }

  // Function 3 - Muitiple Answer(s)
  Widget Multiple(int pageIndex, String question, List<String> options) {
    questions[pageIndex] = question;
    if (answers[pageIndex] == '') {
      answers[pageIndex] = <String>[];
    }

    List<String> currentAnswers = List<String>.from(answers[pageIndex]);
    bool isOtherSelected =
        currentAnswers.any((item) => item.startsWith('Other'));

    TextEditingController _otherTextController = TextEditingController(
        text: isOtherSelected
            ? currentAnswers
                .firstWhere((item) => item.startsWith('Other'))
                .split(': ')
                .last
            : '');

    ButtonStyle submitButtonStyle() {
      return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.purple),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding:
            MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50)),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    ButtonStyle nextButtonStyle() {
      return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        padding:
            MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50)),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Question (${currentPageIndex}/24)"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: pageIndex == 24
                ? () async {
                    await sendEmail();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Ending('images/02-thank.png',
                              'Thank you for your application for registration. Your application will be processed within 7 working days, please pay attention to your Email box.'),
                        ));
                  }
                : () => _controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut),
            child: pageIndex == 24 ? Text('Submit') : Text('Next'),
            style: pageIndex == 24 ? submitButtonStyle() : nextButtonStyle(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Added SingleChildScrollView here to enable scrolling
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  question,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center, // Center align text, if desired
                ),
              ),
              ListView(
                shrinkWrap: true,
                // Important to prevent infinite height error
                physics: NeverScrollableScrollPhysics(),
                // Disables scrolling inside ListView
                children: options.map((option) {
                  if (option == 'Other') {
                    return Column(
                      children: [
                        CheckboxListTile(
                          title: Text(option),
                          value: isOtherSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              if (value == true) {
                                currentAnswers
                                    .add('Other: ' + _otherTextController.text);
                              } else {
                                currentAnswers.removeWhere(
                                    (item) => item.startsWith('Other'));
                                _otherTextController.clear();
                              }
                              answers[pageIndex] = currentAnswers;
                              isOtherSelected = value!;
                            });
                          },
                        ),
                        if (isOtherSelected)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              controller: otherTextControllers[pageIndex],
                              decoration: InputDecoration(
                                hintText: 'Please specify other...',
                              ),
                              onChanged: (value) {
                                final index = currentAnswers.indexWhere(
                                    (item) => item.startsWith('Other'));
                                if (index != -1) {
                                  currentAnswers[index] = 'Other: $value';
                                  answers[pageIndex] = currentAnswers;
                                }
                              },
                            ),
                          ),
                      ],
                    );
                  }
                  return CheckboxListTile(
                    title: Text(option),
                    value: currentAnswers.contains(option),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          if (!currentAnswers.contains(option)) {
                            currentAnswers.add(option);
                          }
                        } else {
                          currentAnswers.remove(option);
                        }
                        answers[pageIndex] = currentAnswers;
                      });
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Function 4 - User Input Words
  Widget Words(int pageIndex, String question, bool required) {
    questions[pageIndex] = question;
    wordstextControllers.putIfAbsent(
        pageIndex, () => TextEditingController(text: answers[pageIndex]));

    // Check if the input is valid for enabling/disabling the Next button
    bool isInputValid =
        !required || wordstextControllers[pageIndex]!.text.trim().isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text("Question (${currentPageIndex}/24)"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: isInputValid
                ? () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  }
                : () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please fill in the required field'),
                      duration: Duration(seconds: 2),
                    ));
                  },
            child: Text('Next'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                return isInputValid
                    ? Colors.deepPurple
                    : Colors.grey; // DeepPurple if valid, Grey if not
              }),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 50)),
              textStyle: MaterialStateProperty.all(
                TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          // Add SingleChildScrollView here
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    question,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign:
                        TextAlign.center, // Center align text, if desired
                  ),
                ),
                TextField(
                  controller: wordstextControllers[pageIndex],
                  decoration: InputDecoration(
                    labelText: question + (required ? ' *' : ''),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      answers[pageIndex] = value.trim();
                      // Recheck input validity after a change is made
                      isInputValid = !required ||
                          wordstextControllers[pageIndex]!
                              .text
                              .trim()
                              .isNotEmpty;
                    });
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function 5 - Birthday Calendar
  Widget Calendar(int pageIndex, String question) {
    questions[pageIndex] = question;
    TextEditingController _dateController =
        TextEditingController(text: answers[pageIndex]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Question (${currentPageIndex}/24)"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => _controller.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut),
            child: Text('Next'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              // Button color
              foregroundColor: MaterialStateProperty.all(Colors.white),
              // Text color
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 50)),
              // Increased horizontal padding
              textStyle: MaterialStateProperty.all(
                TextStyle(
                  fontSize: 20, // Larger font size
                  fontWeight: FontWeight.bold, // Optional: add bold font weight
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          // Add SingleChildScrollView here
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    question,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign:
                        TextAlign.center, // Center align text, if desired
                  ),
                ),
                TextField(
                  controller: _dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: question,
                    border: OutlineInputBorder(),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        answers[pageIndex] = formattedDate;
                        _dateController.text = formattedDate;
                      });
                    }
                  },
                ),
                SizedBox(height: 20),
                // This button is now moved to AppBar
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function 6 - Upload (National Police Certificate)
  Widget Upload(int pageIndex, String question) {
    questions[pageIndex] = question;

    Future<void> selectFile() async {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg', 'pdf'],
        // Specify allowed extensions
        withData: true, // This will get the file data needed for web and mobile
      );

      if (result != null && result.files.single != null) {
        final fileBytes = result.files.single.bytes;
        final fileName = result.files.single.name;
        final fileType = result.files.single.extension;

        if (['png', 'jpg', 'jpeg', 'pdf'].contains(fileType)) {
          errorMessage = "";
          String newFileName =
              fileName; // Using original file name for simplicity
          File file;

          if (!kIsWeb) {
            // Mobile: Save the file locally
            final directory = await getApplicationDocumentsDirectory();
            file = File('${directory.path}/$newFileName');
            await file.writeAsBytes(fileBytes!);
            print('File saved: $newFileName');
            selectedFilePath = file.path;
          } else {
            // Web: Just prepare the name, no saving
            selectedFilePath = "/MyComputer/" + newFileName;
          }

          setState(() {
            selectedFileBytes = fileBytes;
            selectedFileType = fileType;
            selectedFileName = newFileName;
            showSuccessMessage = true;
          });

          print('File name: $newFileName');
          print('File type: $fileType');
          print('File size: ${fileBytes?.length} bytes');
        } else {
          setState(() {
            showSuccessMessage = false;
          });
          errorMessage =
              "Unsupported file type. Please upload PNG / JPG / JEPG / PDF";
          selectedFilePath = "Fail to upload - Unsupported file type.";
          print('Unsupported file type selected');
        }
      } else {
        setState(() {
          showSuccessMessage = false;
        });
        errorMessage = "No file selected";
        selectedFilePath = "Fail to upload - No file selected.";
        print('No file selected');
      }
    }

    Widget thumbnailDisplay() {
      if (selectedFileBytes != null &&
          ['png', 'jpg', 'jpeg'].contains(selectedFileType)) {
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.3,
          child: ClipRect(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.memory(selectedFileBytes!),
            ),
          ),
        );
      } else if (selectedFileType == 'pdf') {
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.3,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Icon(
              Icons.picture_as_pdf,
              color: Colors.red,
            ),
          ),
        );
      }
      return Text('WRONG');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Question (${currentPageIndex}/24)"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => _controller.nextPage(
                duration: Duration(milliseconds: 300), curve: Curves.easeInOut),
            child: Text('Next'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 50)),
              textStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Added SingleChildScrollView to enable scrolling
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  question,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                onPressed: selectFile,
                child: Text('Upload File'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, // Text color
                  backgroundColor: Colors.deepPurple, // Button background color
                  textStyle: TextStyle(
                    fontSize: 20, // Text size
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 20, horizontal: 16), // Adjusted button padding
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  errorMessage,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors
                        .red, // You can change the color to match your design
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (showSuccessMessage) thumbnailDisplay(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Function 7 - Click "Submit" button, Send Email to Administrator
  Future<void> sendEmail() async {
    // Generate timestamp
    final String timestamp =
        DateFormat('yyyy-MM-dd-HH-mm').format(DateTime.now());
    final String emailSubject = 'Registration-$timestamp';

    // Combine questions with answers
    List<String> formattedAnswers = [];
    for (int i = 0; i < questions.length; i++) {
      String formattedLine = '* ${i} - ${questions[i]}\n${answers[i]}';
      formattedAnswers.add(formattedLine);
    }

    final Email email = Email(
      body: formattedAnswers.join('\n\n'),
      // Join all formatted lines with double newlines for separation
      subject: emailSubject,
      recipients: ['AAA@BBB.com'],
      attachmentPaths: selectedFilePath != null ? [selectedFilePath!] : [],
      isHTML: false,
    );

    // Conditional logic to handle web or native platforms
    if (kIsWeb) {
      // Only simulate email sending on web platforms
      print('Simulating email sending on web simulator:');
      print('Email Details:');
      print('Subject: ${email.subject}');
      print('Body: ${email.body}');
      print('Recipients: ${email.recipients?.join(', ')}');
      print('Attachments: ${email.attachmentPaths?.join(', ')}');
    } else {
      try {
        await FlutterEmailSender.send(email);
      } catch (error) {
        print('Error sending email: $error');
      }
    }
  }

  // Function 8 - Ending scenes (two versions of registration ending)
  Widget Ending(String imagePath, String message) {
    return Center(
      child: SingleChildScrollView(
        // Add SingleChildScrollView here
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // Calculate the available width for the image
                double maxWidth = constraints.maxWidth;
                double maxHeight = MediaQuery.of(context).size.height *
                    0.5; // Take up to 50% of screen height

                return Image.asset(
                  imagePath,
                  width: maxWidth,
                  height: maxHeight,
                  fit: BoxFit
                      .contain, // Ensures the image maintains its aspect ratio
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DefaultTextStyle(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

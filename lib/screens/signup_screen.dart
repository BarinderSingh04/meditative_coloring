import 'dart:io';

import 'package:easy_mask/easy_mask.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:meditative_coloring/models/user.dart';
import 'package:meditative_coloring/screens/selectplan_screen.dart';
import 'package:meditative_coloring/screens/signup_notifier.dart';
import '../configs/extensions.dart';
import 'set_your_intension.dart';

class SetUpProfile extends ConsumerStatefulWidget {
  const SetUpProfile({Key? key}) : super(key: key);

  @override
  ConsumerState<SetUpProfile> createState() => _SetUpProfileState();
}

class _SetUpProfileState extends ConsumerState<SetUpProfile> {
  final fkey = GlobalKey<FormState>();
  final passwordFieldKey = GlobalKey<FormFieldState>();
  bool validEmail = false;
  bool obscuredText = true;
  bool verifyObscuredText = true;

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<User?>>(signupProvider, (previous, state) {
      state.showLoading(context, previous, (data) {
        ref.read(userProvider.notifier).update((state) => data);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const SelectPlanScreen(isSetup: true)),
            (route) => false);
      });
    });

    return Scaffold(
      appBar: const MyAppbar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: ListView(
            children: [
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  children: [
                    const TitleWidget(title: "Set Up Your Profile"),
                    const SizedBox(height: 30),
                    ImagePickerForm(context: context),
                    const SizedBox(height: 22),
                    Form(
                      key: fkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "First Name",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.sentences,
                            onSaved: ref
                                .read(signupProvider.notifier)
                                .onSaveFirstname,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter first name";
                              } else if (value.length < 3) {
                                return "Enter more than three characters";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "abc",
                            ),
                          ),
                          const SizedBox(height: 22),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Last Name",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.sentences,
                            onSaved: ref
                                .read(signupProvider.notifier)
                                .onSaveLastname,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter last name";
                              } else if (value.length < 3) {
                                return "Enter more than three characters";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              hintText: "xyz",
                            ),
                          ),
                          const SizedBox(height: 23),
                          const Text(
                            "Phone Number",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TextInputMask(mask: "999-999-9999"),
                            ],
                            onSaved: ref
                                .read(signupProvider.notifier)
                                .onSavePhonenumber,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a phone number";
                              } else if (value.length < 10) {
                                return "Enter ten digits";
                              } else if (value.length > 10) {
                                return "Enter ten digits only";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "000-000-0000",
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/images/call.png",
                                  fit: BoxFit.contain,
                                  width: 22,
                                  height: 22,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 23),
                          const Text(
                            " Email Address",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved:
                                ref.read(signupProvider.notifier).onSaveEmail,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter an email address";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "abc@abc.com",
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  "assets/images/email.png",
                                  fit: BoxFit.contain,
                                  width: 22,
                                  height: 22,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 23),
                          const Text(
                            "Password",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            key: passwordFieldKey,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: obscuredText,
                            obscuringCharacter: "*",
                            onSaved: ref
                                .read(signupProvider.notifier)
                                .onSavePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a password";
                              } else if (value.length < 6) {
                                return "Password can't be less than 6 characters";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "***********",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscuredText = !obscuredText;
                                  });
                                },
                                icon: Icon(
                                  obscuredText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Verify Password",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            obscureText: verifyObscuredText,
                            obscuringCharacter: "*",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              } else if (value !=
                                  passwordFieldKey.currentState?.value) {
                                return "Please make sure your passwords match";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "***********",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    verifyObscuredText = !verifyObscuredText;
                                  });
                                },
                                icon: Icon(
                                  verifyObscuredText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 23),
                          const Text(
                            "Date of Birth",
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          const SizedBox(height: 12),
                          DateTimeFormField(
                            context: context,
                            validator: (value) {
                              if (value == null) {
                                return "Please enter your birthday";
                              }
                              return null;
                            },
                            onSaved: (v) => ref
                                .read(signupProvider.notifier)
                                .onSaveDateofbirth(v.toString()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: PrimaryButton(
                  title: "SUBMIT",
                  onClick: () {
                    if (fkey.currentState!.validate()) {
                      fkey.currentState!.save();
                      ref.read(signupProvider.notifier).signup();
                    }
                  },
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppbar({
    Key? key,
    this.isRequired = true,
    this.isClose = false,
  }) : super(key: key);

  final bool isRequired;
  final bool isClose;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox.fromSize(
          size: const Size.fromHeight(56.0),
          child: Row(
            children: [
              if (isRequired)
                InkWell(
                  onTap: () => Navigator.of(context).maybePop(),
                  child: Container(
                    constraints: BoxConstraints.tight(const Size.square(30)),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff000000),
                    ),
                    child: Icon(
                      isClose ? Icons.close : Icons.chevron_left,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontFamily: "Calder",
        color: Color(0xff000000),
      ),
    );
  }
}

class DateTimeFormField extends FormField<DateTime> {
  final BuildContext context;

  DateTimeFormField({
    Key? key,
    required this.context,
    FormFieldSetter<DateTime>? onSaved,
    FormFieldValidator<DateTime>? validator,
    DateTime? initialValue,
    bool autovalidate = false,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          initialValue: initialValue,
          builder: (FormFieldState<DateTime> state) {
            return InkWell(
              onTap: () {
                showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) => Container(
                    height: 350,
                    padding: const EdgeInsets.only(top: 6.0),
                    margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    color:
                        CupertinoColors.systemBackground.resolveFrom(context),
                    child: SafeArea(
                      top: false,
                      child: Scaffold(
                        body: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Enter Birthday",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: CupertinoDatePicker(
                                initialDateTime: state.value ?? DateTime.now(),
                                mode: CupertinoDatePickerMode.date,
                                minimumYear: 1947,
                                maximumDate: DateTime.now(),
                                onDateTimeChanged: (DateTime date) {
                                  state.didChange(date);
                                  state.validate();
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: PrimaryButton(
                                title: "Select Date",
                                onClick: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 14.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: state.hasError
                            ? Theme.of(context).colorScheme.error
                            : const Color.fromARGB(255, 207, 207, 207),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              dateTime(state.value),
                              style: TextStyle(
                                color: state.value == null
                                    ? Colors.grey[600]
                                    : Colors.black,
                              ),
                            ),
                            Image.asset(
                              "assets/images/calendar.png",
                              fit: BoxFit.contain,
                              width: 22,
                              height: 22,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (state.hasError)
                    AnimatedOpacity(
                      opacity: state.hasError ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                              state.errorText ?? "Please select a dob",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
            );
          },
        );

  static String dateTime(DateTime? selectedDate) {
    if (selectedDate == null) {
      return "MM/DD/YYYY";
    } else {
      return DateFormat('MM/dd/yyyy').format(selectedDate);
    }
  }
}

class ImagePickerOptions extends StatelessWidget {
  const ImagePickerOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Select source"),
      content: Wrap(
        children: [
          ListTile(
            title: const Text("Camera"),
            leading: const Icon(Icons.camera_alt, color: Colors.black),
            onTap: () {
              final picker = ImagePicker();
              picker
                  .pickImage(source: ImageSource.camera, imageQuality: 70)
                  .then((value) {
                Navigator.of(context).pop(value);
              });
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Gallery"),
            leading: const Icon(Icons.image, color: Colors.black),
            onTap: () {
              final picker = ImagePicker();
              picker
                  .pickImage(source: ImageSource.gallery, imageQuality: 70)
                  .then((value) {
                Navigator.of(context).pop(value);
              });
            },
          ),
        ],
      ),
    );
  }
}

class ImagePickerForm extends FormField<XFile> {
  final BuildContext context;
  final String? image;

  ImagePickerForm({
    Key? key,
    this.image,
    required this.context,
    FormFieldSetter<XFile>? onSaved,
    bool autovalidate = false,
  }) : super(
          key: key,
          onSaved: onSaved,
          builder: (FormFieldState<XFile?> state) {
            return InkWell(
              onTap: () async {
                final pickedImage = await showDialog(
                  context: context,
                  builder: (context) {
                    return const ImagePickerOptions();
                  },
                );
                state.didChange(pickedImage);
              },
              child: Builder(builder: (context) {
                return Stack(
                  children: [
                    if (image != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          width: 100,
                          height: 100,
                          imageUrl: image,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) {
                            return Container(
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                size: 34,
                                Icons.error,
                                color: Theme.of(context).errorColor,
                              ),
                            );
                          },
                          placeholder: (context, url) => Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      )
                    else if (state.value != null)
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        backgroundImage: FileImage(File(state.value!.path)),
                      )
                    else
                      Image.asset(
                        "assets/images/person.png",
                        width: 100,
                        height: 100,
                      ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        "assets/images/edit.png",
                        width: 24,
                        height: 24,
                      ),
                    )
                  ],
                );
              }),
            );
          },
        );
}

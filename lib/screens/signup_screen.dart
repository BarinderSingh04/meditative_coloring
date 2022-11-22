import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  bool validEmail = false;
  bool obscuredText = true;

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
        child: ListView(
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  const TitleWidget(title: "Set Up Your Profile"),
                  const SizedBox(height: 30),
                  Stack(
                    children: [
                      Image.asset(
                        "assets/images/person.png",
                        width: 100,
                        height: 100,
                      ),
                      const Positioned(
                        right: 0,
                        bottom: 0,
                        child: ImageIcon(AssetImage("assets/images/edit.png")),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Form(
                    key: fkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "First Name",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          onSaved:
                              ref.read(signupProvider.notifier).onSaveFirstname,
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
                          child: Text("Last Name",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          onSaved:
                              ref.read(signupProvider.notifier).onSaveLastname,
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
                          onSaved: ref
                              .read(signupProvider.notifier)
                              .onSavePhonenumber,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Phone number can't be empty";
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
                          onSaved:
                              ref.read(signupProvider.notifier).onSaveEmail,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email field can't be empty";
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
                          obscureText: obscuredText,
                          obscuringCharacter: "*",
                          onSaved:
                              ref.read(signupProvider.notifier).onSavePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password field can't be empty";
                            } else if (value.length < 6) {
                              return "Password can't be less than six characters";
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
                              return "Please select a dob";
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
              onTap: () async {
                final date = await showDatePicker(
                    context: context,
                    initialDate: state.value ?? DateTime.now(),
                    firstDate: DateTime(1947),
                    lastDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: Colors.black, // header background color
                            onPrimary: Colors.white, // header text color
                            onSurface: Colors.black, // body text color
                          ),
                          dialogBackgroundColor: Colors.white,
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              textStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                fontFamily: 'Quicksand',
                              ),
                              backgroundColor: Colors.black, // Background color
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    });
                state.didChange(date);
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
                            Text(dateTime(state.value)),
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

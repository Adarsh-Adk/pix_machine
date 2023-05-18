import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';

import '../../model/entities/designation.dart';
import '../../model/entities/employee_input.dart';
import '../../view_model/blocs/add_employee_bloc/add_employee_bloc.dart';
import '../../view_model/blocs/designation_bloc/designation_bloc.dart';
import '../../view_model/blocs/employee_list_bloc/employee_list_bloc.dart';
import '../../view_model/util/utility.dart';
import '../core/app_constants.dart';
import '../widgets/app_padding.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({Key? key}) : super(key: key);

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final presentAddressController = TextEditingController();
  final permanentAddressController = TextEditingController();
  final landlineController = TextEditingController();
  DateTime? dateOfBirth;
  DateTime? joinDate;
  static List<String> genders = ["male", "female", "other"];
  static List<String> statuses = ["PERMANENT", "TEMPORARY"];
  String? status;
  String? gender;
  Designation? designation;
  File? resume;
  File? profilePicture;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  bool isValidInput = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: Text(
          "Add an employee",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocListener<AddEmployeeBloc, AddEmployeeState>(
        listener: (context, state) {
          state.when(
              initial: () {},
              loading: () {},
              success: () {
                BlocProvider.of<EmployeeListBloc>(context)
                    .add(const EmployeeListEvent.fetch());
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      "Added Data",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.background),
                    )));
                if (mounted) {
                  Future.delayed(const Duration(seconds: 2), () {
                    context.pop();
                  });
                }
              },
              failed: (response) {
                if (mounted) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Theme.of(context).colorScheme.error,
                      content: Text(
                        response,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      )));
                }
              });
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Form(
              key: formKey,
              onChanged: () {
                setState(() {
                  isValidInput = (formKey.currentState?.validate() ?? false) &&
                      profilePicture != null &&
                      dateOfBirth != null &&
                      joinDate != null &&
                      status != null &&
                      gender != null &&
                      designation != null &&
                      resume != null;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  profilePictureWidget(),
                  const AppPadding(),
                  textField(context,
                      label: "First Name",
                      controller: firstNameController,
                      hint: "Enter Name", validator: (value) {
                    if (value == null || value == "") {
                      return "Enter a valid first name";
                    }
                    return null;
                  }),
                  const AppPadding(),
                  textField(context,
                      label: "Last Name",
                      controller: lastNameController,
                      hint: "Enter Name", validator: (value) {
                    if (value == null || value == "") {
                      return "Enter a valid first name";
                    }
                    return null;
                  }),
                  const AppPadding(),
                  textField(context,
                      label: "Mobile Number",
                      controller: phoneController,
                      hint: "Enter Mobile Number", validator: (value) {
                    int? phone = int.tryParse(value ?? "");
                    if (!Utility.isValidPhone(phone)) {
                      return "Mobile number should be 10 digits";
                    }
                    return null;
                  }),
                  const AppPadding(),
                  textField(
                    context,
                    label: "Email",
                    controller: emailController,
                    hint: "Enter Email Address",
                    validator: (value) {
                      if (!Utility.isValidEmail(value)) {
                        return "Enter valid email";
                      }
                      return null;
                    },
                  ),
                  const AppPadding(),
                  textField(context,
                      label: "Landline",
                      controller: landlineController,
                      hint: "Enter Landline Number", validator: (value) {
                    int? phone = int.tryParse(value ?? "");
                    if (!Utility.isValidLandline(phone)) {
                      return "Landline should be 11 digits";
                    }
                    return null;
                  }),
                  const AppPadding(),
                  textField(context,
                      label: "Present Address",
                      controller: presentAddressController,
                      hint: "Enter Present Address", validator: (value) {
                    if (value == null || value == "") {
                      return "Enter a valid address";
                    }
                  }, maxLines: 3),
                  const AppPadding(),
                  textField(
                    context,
                    label: "Permanent Address",
                    controller: permanentAddressController,
                    hint: "Enter Permanent Address",
                    maxLines: 3,
                    validator: (value) {
                      if (value == null || value == "") {
                        return "Enter a valid address";
                      }
                    },
                  ),
                  const AppPadding(),
                  genderWidget(context),
                  const AppPadding(),
                  designationWidget(context),
                  const AppPadding(),
                  dobWidget(context),
                  const AppPadding(),
                  joinDateWidget(context),
                  const AppPadding(),
                  statusWidget(context),
                  const AppPadding(),
                  resumeWidget(context),
                  const AppPadding(multipliedBy: 2),
                  buttonWidget(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox buttonWidget(BuildContext context) {
    return SizedBox(
        width: double.maxFinite,
        child: (isValidInput)
            ? ElevatedButton(
                onPressed: () {
                  final employeeInput = EmployeeInput(
                      resume: resume,
                      presentAddress: presentAddressController.text,
                      permanentAddress: permanentAddressController.text,
                      lastName: lastNameController.text,
                      landline: landlineController.text,
                      joinDate: joinDate?.toUtc().toString(),
                      dateOfBirth: dateOfBirth?.toUtc().toString(),
                      status: status,
                      firstName: firstNameController.text,
                      profilePicture: profilePicture,
                      gender: gender,
                      email: emailController.text,
                      designationId: designation?.id?.toString(),
                      mobile: phoneController.text);
                  log("EmployeeInput $employeeInput");
                  BlocProvider.of<AddEmployeeBloc>(context)
                      .add(AddEmployeeEvent.add(employeeInput: employeeInput));
                },
                child: const Text("Save"))
            : ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColorLight.withOpacity(0.3))),
                onPressed: () {},
                child: const Text("Save")));
  }

  Column resumeWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label("Resume", context),
        const AppPadding(
          dividedBy: 3,
        ),
        InkWell(
          onTap: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ["pdf"],
                allowMultiple: false);
            if (result != null) {
              if (result.files.isNotEmpty) {
                setState(() {
                  resume = File(result.files.first.path!);
                  isValidInput = (formKey.currentState?.validate() ?? false) &&
                      profilePicture != null &&
                      dateOfBirth != null &&
                      joinDate != null &&
                      status != null &&
                      gender != null &&
                      designation != null &&
                      resume != null;
                });
              }
            }
          },
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
                borderRadius: AppConstants.borderRadius,
                color: Theme.of(context).colorScheme.background),
            padding: const EdgeInsets.all(
              AppConstants.defaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  resume?.path != null ? basename(resume!.path) : "Select File",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: resume?.path != null
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(0.3)),
                  textAlign: TextAlign.start,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: AppConstants.borderRadius),
                  child: Center(
                    child: Icon(
                      Icons.attach_file,
                      size: 25,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column statusWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label("Status", context),
        const AppPadding(
          dividedBy: 3,
        ),
        DropdownButtonFormField<String>(
            iconSize: 30,
            icon: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: AppConstants.borderRadius),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            decoration: const InputDecoration(
              hintText: "Select one",
            ),
            items: statuses
                .map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: status,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  status = value;
                  isValidInput = (formKey.currentState?.validate() ?? false) &&
                      profilePicture != null &&
                      dateOfBirth != null &&
                      joinDate != null &&
                      status != null &&
                      gender != null &&
                      designation != null &&
                      resume != null;
                });
              }
            })
      ],
    );
  }

  Column joinDateWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label("Join Date", context),
        const AppPadding(
          dividedBy: 3,
        ),
        InkWell(
          onTap: () async {
            DateTime? join = await showDatePicker(
              context: context,
              initialDate: joinDate ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
            );
            if (join != null) {
              setState(() {
                joinDate = join;
                isValidInput = (formKey.currentState?.validate() ?? false) &&
                    profilePicture != null &&
                    dateOfBirth != null &&
                    joinDate != null &&
                    status != null &&
                    gender != null &&
                    designation != null &&
                    resume != null;
              });
            }
          },
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
                borderRadius: AppConstants.borderRadius,
                color: Theme.of(context).colorScheme.background),
            padding: const EdgeInsets.all(
              AppConstants.defaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  joinDate != null
                      ? Utility.formattedDate(
                          joinDate.toString(),
                        )
                      : "Select a date",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: joinDate != null
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(0.3)),
                  textAlign: TextAlign.start,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: AppConstants.borderRadius),
                  child: Center(
                    child: Icon(
                      Icons.calendar_today_outlined,
                      size: 25,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column dobWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label("Date of Birth", context),
        const AppPadding(
          dividedBy: 3,
        ),
        InkWell(
          onTap: () async {
            DateTime? dob = await showDatePicker(
                context: context,
                initialDate: dateOfBirth ??
                    DateTime.now().subtract(const Duration(days: 6570)),
                firstDate: DateTime(1950),
                lastDate: DateTime.now().subtract(const Duration(days: 6570)));
            if (dob != null) {
              setState(() {
                dateOfBirth = dob;
                isValidInput = (formKey.currentState?.validate() ?? false) &&
                    profilePicture != null &&
                    dateOfBirth != null &&
                    joinDate != null &&
                    status != null &&
                    gender != null &&
                    designation != null &&
                    resume != null;
              });
            }
          },
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
                borderRadius: AppConstants.borderRadius,
                color: Theme.of(context).colorScheme.background),
            padding: const EdgeInsets.all(
              AppConstants.defaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateOfBirth != null
                      ? Utility.formattedDate(
                          dateOfBirth.toString(),
                        )
                      : "Select a date",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: dateOfBirth != null
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(0.3)),
                  textAlign: TextAlign.start,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: AppConstants.borderRadius),
                  child: Center(
                    child: Icon(
                      Icons.calendar_today_outlined,
                      size: 25,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Column designationWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label("Designation", context),
        const AppPadding(
          dividedBy: 3,
        ),
        BlocBuilder<DesignationBloc, DesignationState>(
          builder: (context, state) {
            return state.when(initial: () {
              return _defaultDropDown(context);
            }, loading: () {
              return Container(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: const Center(child: CircularProgressIndicator()),
              );
            }, success: (response) {
              return DropdownButtonFormField<Designation>(
                  validator: (value) {
                    if (value == null) {
                      return "Select a valid value";
                    }
                  },
                  iconSize: 30,
                  icon: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: AppConstants.borderRadius),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                  decoration: const InputDecoration(
                    hintText: "Select one",
                  ),
                  items: response
                      .map((e) => DropdownMenuItem<Designation>(
                            value: e,
                            child: Text(e.name ?? "Nil"),
                          ))
                      .toList(),
                  value: designation,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        designation = value;
                        isValidInput =
                            (formKey.currentState?.validate() ?? false) &&
                                profilePicture != null &&
                                dateOfBirth != null &&
                                joinDate != null &&
                                status != null &&
                                gender != null &&
                                designation != null &&
                                resume != null;
                      });
                    }
                  });
            }, failed: (response) {
              return Container(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Center(child: Text(response)),
              );
            });
          },
        ),
      ],
    );
  }

  Column genderWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label("Gender", context),
        const AppPadding(
          dividedBy: 3,
        ),
        DropdownButtonFormField<String>(
            validator: (value) {
              if (value == null) {
                return "Select a valid value";
              }
            },
            iconSize: 30,
            icon: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: AppConstants.borderRadius),
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            decoration: const InputDecoration(
              hintText: "Select one",
            ),
            items: genders
                .map((e) => DropdownMenuItem<String>(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            value: gender,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  gender = value;
                  isValidInput = (formKey.currentState?.validate() ?? false) &&
                      profilePicture != null &&
                      dateOfBirth != null &&
                      joinDate != null &&
                      status != null &&
                      gender != null &&
                      designation != null &&
                      resume != null;
                });
              }
            })
      ],
    );
  }

  InkWell profilePictureWidget() {
    return InkWell(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ["jpeg", "jpg", "png"],
            allowMultiple: false);
        if (result != null) {
          if (result.files.isNotEmpty) {
            setState(() {
              profilePicture = File(result.files.first.path!);
              isValidInput = (formKey.currentState?.validate() ?? false) &&
                  profilePicture != null &&
                  dateOfBirth != null &&
                  joinDate != null &&
                  status != null &&
                  gender != null &&
                  designation != null &&
                  resume != null;
            });
          }
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (profilePicture != null)
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(profilePicture!),
              ),
            ),
          if (profilePicture == null)
            const Center(
              child: CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person_2_outlined,
                  size: 40,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Text _label(String text, BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }

  Column textField(
    BuildContext context, {
    required String label,
    required TextEditingController controller,
    required String hint,
    TextInputAction textInputAction = TextInputAction.next,
    String? Function(String?)? validator,
    int? maxLines,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(label, context),
        const AppPadding(
          dividedBy: 3,
        ),
        TextFormField(
          maxLines: maxLines,
          controller: controller,
          decoration: InputDecoration(
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                  borderRadius: AppConstants.borderRadius,
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary))),
          textInputAction: textInputAction,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }

  DropdownButtonFormField<Designation> _defaultDropDown(BuildContext context) {
    return DropdownButtonFormField<Designation>(
        iconSize: 30,
        icon: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: AppConstants.borderRadius),
          child: Icon(
            Icons.keyboard_arrow_down,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        decoration: const InputDecoration(
          hintText: "Select one",
        ),
        items: const [],
        value: designation,
        onChanged: (value) {});
  }
}

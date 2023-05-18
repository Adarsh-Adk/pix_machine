import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../model/entities/employee.dart';
import '../../view_model/util/utility.dart';
import '../core/app_constants.dart';
import '../widgets/app_padding.dart';

class EmployeeDetailScreen extends StatefulWidget {
  final Employee? employee;
  const EmployeeDetailScreen({Key? key, required this.employee})
      : super(key: key);

  @override
  State<EmployeeDetailScreen> createState() => _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends State<EmployeeDetailScreen> {
  Employee? employee;

  @override
  void didChangeDependencies() {
    employee = widget.employee;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => context.pop(),
        ),
        title: Text(
          employee?.firstName ?? "Nil",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(employee!.profileImage ?? ""),
                child: employee?.profileImage == null
                    ? const FlutterLogo()
                    : Container(),
              ),
              const AppPadding(),
              Text(
                "${employee?.firstName ?? ""} ${employee?.lastName ?? ""}",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const AppPadding(
                dividedBy: 2,
              ),
              Text(
                employee?.designation?.name ?? "Nil",
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              const AppPadding(),
              Card(
                elevation: 3,
                child: Container(
                  padding: const EdgeInsets.all(AppConstants.defaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: AppConstants.borderRadius,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DetailWidget(
                              value: (employee?.mobile ?? "").toString(),
                              caption: "Contact Number",
                            ),
                          ),
                          const AppPadding(),
                          Expanded(
                            child: DetailWidget(
                              value: employee?.email,
                              caption: "Email",
                            ),
                          ),
                        ],
                      ),
                      const AppPadding(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DetailWidget(
                              value:
                                  Utility.formattedDate(employee?.dateOfBirth),
                              caption: "Date of Birth",
                            ),
                          ),
                          const AppPadding(),
                          Expanded(
                            child: DetailWidget(
                              value: employee?.gender,
                              caption: "Gender",
                            ),
                          ),
                        ],
                      ),
                      const AppPadding(),
                      DetailWidget(
                        value: employee?.presentAddress,
                        caption: "Address",
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class DetailWidget extends StatelessWidget {
  const DetailWidget({
    super.key,
    required this.value,
    required this.caption,
  });
  final String caption;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          caption,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.start,
        ),
        const AppPadding(
          dividedBy: 3,
        ),
        Text(
          value ?? "Nil",
          textAlign: TextAlign.start,
        )
      ],
    );
  }
}

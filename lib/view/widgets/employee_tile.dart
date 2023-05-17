import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../custom_router.dart';
import '../../model/entities/employee.dart';

class EmployeeTile extends StatelessWidget {
  final Employee employee;
  const EmployeeTile({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.pushNamed(CustomRouter.employeeDetailsScreen,
          extra: employee),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(employee.profileImage ?? ""),
      ),
      title: Text(employee.firstName ?? "Nil"),
      subtitle: Text("${employee.mobile ?? "Nil"}"),
    );
  }
}

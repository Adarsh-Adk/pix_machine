import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'model/entities/employee.dart';
import 'model/services/shared_preference.dart';
import 'view/screens/add_employee_screen.dart';
import 'view/screens/employee_detail_screen.dart';
import 'view/screens/home_screen.dart';
import 'view/screens/login_screen.dart';

class CustomRouter {
  static const home = "/";
  static const loginScreen = "/loginScreen";
  static const employeeDetailsScreen = "/employeeDetailsScreen";
  static const addEmployeeScreen = "/addEmployeeScreen";
}

final navigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  initialLocation: SharedPreference.isLoggedIn
      ? CustomRouter.home
      : CustomRouter.loginScreen,
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      name: CustomRouter.home,
      path: CustomRouter.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: CustomRouter.loginScreen,
      path: CustomRouter.loginScreen,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: CustomRouter.employeeDetailsScreen,
      path: CustomRouter.employeeDetailsScreen,
      builder: (context, state) {
        Employee employee = state.extra as Employee;
        return EmployeeDetailScreen(employee: employee);
      },
    ),
    GoRoute(
      name: CustomRouter.addEmployeeScreen,
      path: CustomRouter.addEmployeeScreen,
      builder: (context, state) => const AddEmployeeScreen(),
    ),
  ],
);

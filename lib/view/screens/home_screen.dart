import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../custom_router.dart';
import '../../model/entities/employee.dart';
import '../../view_model/blocs/designation_bloc/designation_bloc.dart';
import '../../view_model/blocs/employee_list_bloc/employee_list_bloc.dart';
import '../widgets/employee_tile.dart';
import '../widgets/error_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  reFetch() {
    BlocProvider.of<EmployeeListBloc>(context)
        .add(const EmployeeListEvent.fetch());
    BlocProvider.of<DesignationBloc>(context)
        .add(const DesignationEvent.fetch());
  }

  @override
  void initState() {
    reFetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Employee",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => reFetch(),
        child: SingleChildScrollView(
          child: BlocBuilder<EmployeeListBloc, EmployeeListState>(
            builder: (context, state) {
              return state.map(
                  initial: (_) => const CustomErrorWidget(),
                  loading: (_) => const CustomErrorWidget(),
                  success: (response) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: response.data.length,
                      itemBuilder: (context, index) {
                        Employee employee = response.data[index];
                        return EmployeeTile(
                          employee: employee,
                        );
                      },
                    );
                  },
                  failed: (response) => CustomErrorWidget(
                        error: response.error,
                      ));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(CustomRouter.addEmployeeScreen);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

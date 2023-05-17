import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String? error;
  const CustomErrorWidget({Key? key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Center(
          child: error == null
              ? const CircularProgressIndicator()
              : Text(
                  error!,
                  style: Theme.of(context).textTheme.titleLarge,
                )),
    );
  }
}

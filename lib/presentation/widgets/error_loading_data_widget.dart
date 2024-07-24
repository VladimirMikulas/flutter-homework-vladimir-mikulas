import 'package:flutter/material.dart';

class ErrorLoadingDataWidget extends StatelessWidget {
  const ErrorLoadingDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error loading data',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

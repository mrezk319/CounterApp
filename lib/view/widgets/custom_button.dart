import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:counter_app/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.title});

  final Function? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        height: 50,
        onPressed: () {
          onTap!();
        },
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: title?.toLowerCase().contains('reset') ?? false
            ? Colors.red
            : Colors.blue,
        child: Text(
          title.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

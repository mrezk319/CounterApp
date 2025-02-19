import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:counter_app/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.textFieldController, this.onTap, this.title});

  final TextEditingController textFieldController;
  final Function? onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        var cubit = context.read<CounterCubit>();
        return Expanded(
          child: MaterialButton(
            onPressed: () {
              onTap!();
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.blue,
            child: Text(
              title.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}

import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:counter_app/cubit/counter_state.dart';
import 'package:counter_app/view/widgets/custm_text_field.dart';
import 'package:counter_app/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  final TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => CounterCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Counter App",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocSelector<CounterCubit, CounterState, int?>(
                selector: (state) => state.numberValue,
                builder: (context, value) {
                  return Text(
                    value?.toString() ?? "",
                    style: const TextStyle(color: Colors.blue, fontSize: 35),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                textFieldController: textFieldController,
              ),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      CustomButton(
                          onTap: () {
                            if (textFieldController.value.text.isNotEmpty) {
                              context.read<CounterCubit>().decreaseNumber(
                                  newValue: int.parse(
                                      textFieldController.value.text));
                            }
                          },
                          title: "Decrease"),
                      const SizedBox(
                        width: 40,
                      ),
                      CustomButton(
                          onTap: () {
                            if (textFieldController.value.text.isNotEmpty) {
                              context.read<CounterCubit>().increaseNumber(
                                  newValue: int.parse(
                                      textFieldController.value.text));
                            }
                          },
                          title: "Increase"),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 25,
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      CustomButton(
                          onTap: () {
                            context.read<CounterCubit>().reset();
                            if (textFieldController.value.text.isNotEmpty) {
                              textFieldController.clear();
                            }
                          },
                          title: "Reset"),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

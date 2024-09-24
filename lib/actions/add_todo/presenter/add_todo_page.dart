import 'dart:math';

import 'package:challenge/actions/add_todo/presenter/add_todo_cubit.dart';
import 'package:challenge/actions/add_todo/presenter/add_todo_state.dart';
import 'package:challenge/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToDoPage extends StatefulWidget {
  const AddToDoPage({super.key});

  @override
  State<AddToDoPage> createState() => _AddToDoPageState();
}

class _AddToDoPageState extends State<AddToDoPage> {
  final taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(tr(LocaleKeys.add_todo))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocListener<AddToDoCubit, AddToDoState>(
            listener: (context, state) {
              if (state is AddToDoSuccess) {
                Navigator.pop(context, true);
              } else if (state is AddToDoError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Failed to add ToDo: ${state.message}'),
                  ),
                );
              }
            },
            child: BlocBuilder<AddToDoCubit, AddToDoState>(
              builder: (context, state) {
                if (state is AddToDoLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AddToDoError) {
                  return Center(child: Text(state.message));
                } else {
                  return Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: taskController,
                                decoration: const InputDecoration(
                                  labelText: 'Task',
                                ),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  final id =
                                      Random().nextInt(1000000).toString();
                                  final task = taskController.text;
                                  final createdAt =
                                      DateTime.now().toIso8601String();
                                  final updatedAt =
                                      DateTime.now().toIso8601String();
                                  const done = false;

                                  context.read<AddToDoCubit>().addToDo(
                                        id: id,
                                        name: task,
                                        createdAt: createdAt,
                                        updatedAt: updatedAt,
                                        done: done,
                                      );
                                },
                                child: const Text('Add Task'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (state is AddToDoError)
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            state.message,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

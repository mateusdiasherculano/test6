import 'package:challenge/actions/add_todo/presenter/add_todo_page.dart';
import 'package:challenge/generated/locale_keys.g.dart';
import 'package:challenge/home/presenter/home_cubit.dart';
import 'package:challenge/home/presenter/home_state.dart';
import 'package:challenge/utils/data_time_formatter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../actions/remove_todo/presenter/remove_todo_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _fetchToDos();
    super.initState();
  }

  void _fetchToDos() {
    Future.microtask(() => context.read<HomeCubit>().fetchToDosList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr(LocaleKeys.todos)),
        actions: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is ToDoLoading) {
                return IconButton(
                  onPressed: () {},
                  icon: const CircularProgressIndicator(),
                );
              } else {
                return IconButton(
                  onPressed: _fetchToDos,
                  icon: const Icon(Icons.refresh),
                );
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is ToDoLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ToDoLoaded) {
              final toDos = state.toDos;
              return ListView.builder(
                itemCount: toDos.length,
                itemBuilder: (context, index) {
                  final toDo = toDos[index];
                  return Dismissible(
                    key: Key(toDo.id),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    confirmDismiss: (direction) async {
                      return _confirmDelete(context, toDo.id);
                    },
                    child: Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: ListTile(
                          title: Text(
                            toDo.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                          subtitle: Text(
                            'Created at: ${formatDateTime(toDo.createdAt)}',
                          ),
                          trailing: Checkbox(
                            value: toDo.done,
                            onChanged: (bool? value) {
                              context.read<HomeCubit>().toggleToDoDone(toDo.id);
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (state is ToDoError) {
              return Center(
                child: Text('Failed to fetch ToDos: ${state.message}'),
              );
            } else {
              return const Center(
                child: Text('No list found'),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).push(
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => const AddToDoPage(),
            ),
          );

          if (result == true) {
            _fetchToDos();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<bool?> _confirmDelete(BuildContext context, String id) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Cor de fundo do AlertDialog
          title: const Text(
            'Confirm Deletion',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ), // Cor do texto do título
          ),
          content: const Text(
            'Do you really want to delete this item?',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ), // Cor do texto do conteúdo
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // Cor do texto do botão Cancel
              ),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.read<RemoveToDoCubit>().removeItem(id);
                Navigator.of(context).pop(true);
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // Cor do texto do botão Delete
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}

import 'package:challenge/actions/add_todo/domain/usecase/add_todo_usecase.dart';
import 'package:challenge/actions/add_todo/external/add_todo_datasource_impl.dart';
import 'package:challenge/actions/add_todo/infra/repository/add_todo_repository_impl.dart';
import 'package:challenge/actions/add_todo/presenter/add_todo_cubit.dart';
import 'package:challenge/actions/remove_todo/domain/usecase/remove_todo_usecase.dart';
import 'package:challenge/actions/remove_todo/external/datasource/remove_todo_datasource_impl.dart';
import 'package:challenge/actions/remove_todo/infra/repository/remove_todo_repository_impl.dart';
import 'package:challenge/actions/remove_todo/presenter/remove_todo_cubit.dart';
import 'package:challenge/cubit/theme/change_theme_cubit.dart';
import 'package:challenge/home/domain/usecase/home_todo_usecase.dart';
import 'package:challenge/home/external/datasource/home_todo_remote_datasource_impl.dart';
import 'package:challenge/home/infra/repository/home_todo_repository_impl.dart';
import 'package:challenge/home/presenter/home_cubit.dart';
import 'package:challenge/home/presenter/home_page.dart';
import 'package:challenge/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph_repository/graph_repository.dart';
import 'package:graphql/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  const App({super.key});

  static SharedPreferences? mainSharedPreferences;

  @override
  Widget build(BuildContext context) {
    final removeDataSource = RemoveToDoDatasourceImpl();
    final removeRepository = RemoveToDoRepositoryImpl(removeDataSource);
    final removeItem = RemoveToDoUseCase(removeRepository);

    final httpLink = HttpLink('https://staging.nearay.com/graphql');
    final client = GraphQLClient(link: httpLink, cache: GraphQLCache());
    final remoteDataSource = ToDoRemoteDataSource(client);
    final repository = HomeToDoRepositoryImpl(remoteDataSource);
    final fetchToDos = FetchToDosUseCase(repository);

    final addDataSource = AddToDoDatasourceImpl();
    final addRepository = AddToDoRepositoryImpl(addDataSource);
    final addTask = AddToDoUseCase(addRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AddToDoCubit(addTask),
        ),
        BlocProvider(
          create: (_) => RemoveToDoCubit(removeItem),
        ),
        BlocProvider(
          create: (context) => HomeCubit(fetchToDos),
        ),
        BlocProvider<ToDosBloc>(
          create: (context) => ToDosBloc(client: client)..run(),
        ),
        BlocProvider<ChangeThemeCubit>(
          create: (context) => ChangeThemeCubit(
            mainSharedPreferences: App.mainSharedPreferences,
          ),
        ),
      ],
      child: BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
        builder: (context1, ChangeThemeState themeState) {
          return MaterialApp(
            darkTheme: (themeState is ThemeAutoState)
                ? buildThemeData(myThemes[1])
                : (themeState is ThemeLightState)
                    ? buildThemeData(myThemes[0])
                    : buildThemeData(myThemes[1]),
            theme: (themeState is ThemeAutoState)
                ? buildThemeData(myThemes[0])
                : (themeState is ThemeLightState)
                    ? buildThemeData(myThemes[0])
                    : buildThemeData(myThemes[1]),
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            home: const HomePage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

import 'package:graph_repository/models/graphql/graphql_api.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter_bloc/graphql_flutter_bloc.dart';

class AddToDoBloc extends MutationBloc<AddToDo$Mutation> {
  AddToDoBloc({required super.client, WatchQueryOptions? options})
      : super(
          options: options ??
              WatchQueryOptions(
                fetchPolicy: FetchPolicy.noCache,
                document: ADD_TO_DO_MUTATION_DOCUMENT,
              ),
        );

  @override
  AddToDo$Mutation parseData(Map<String, dynamic>? data) {
    return AddToDo$Mutation.fromJson(data ?? {});
  }
}

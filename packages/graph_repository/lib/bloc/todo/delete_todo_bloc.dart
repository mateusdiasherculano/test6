import 'package:graph_repository/models/graphql/graphql_api.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter_bloc/graphql_flutter_bloc.dart';

class DeleteToDoBloc extends MutationBloc<DeleteToDo$Mutation> {
  DeleteToDoBloc({required super.client, WatchQueryOptions? options})
      : super(
          options: options ??
              WatchQueryOptions(
                fetchPolicy: FetchPolicy.noCache,
                document: DELETE_TO_DO_MUTATION_DOCUMENT,
              ),
        );

  @override
  DeleteToDo$Mutation parseData(Map<String, dynamic>? data) {
    return DeleteToDo$Mutation.fromJson(data ?? {});
  }
}

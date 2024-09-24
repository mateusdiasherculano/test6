import 'package:graph_repository/models/graphql/graphql_api.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter_bloc/graphql_flutter_bloc.dart';

class UpdateToDoBloc extends MutationBloc<UpdateToDo$Mutation> {
  UpdateToDoBloc({required super.client, WatchQueryOptions? options})
      : super(
          options: options ??
              WatchQueryOptions(
                fetchPolicy: FetchPolicy.noCache,
                document: UPDATE_TO_DO_MUTATION_DOCUMENT,
              ),
        );

  @override
  UpdateToDo$Mutation parseData(Map<String, dynamic>? data) {
    return UpdateToDo$Mutation.fromJson(data ?? {});
  }
}

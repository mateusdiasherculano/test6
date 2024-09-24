import 'package:flutter/material.dart';
import 'package:graphql/client.dart';

import 'config.dart';

String uri = Config.graphUrl;
String subscriptionUri = Config.socketUrl;

final client = getClient(token: '');

GraphQLClient getClient({String? token}) {
  Link link = HttpLink(uri);

  final authLink = AuthLink(
    getToken: () async {
      return '';
    },
  );

  link = authLink.concat(link);
  final websocketLink = WebSocketLink(
    subscriptionUri,
    config: SocketClientConfig(
      initialPayload: () async {
        return '';
      },
    ),
  );

  link = Link.split((request) => request.isSubscription, websocketLink, link);

  return GraphQLClient(
    cache: cache,
    link: link,
  );
}

String uuidFromObject(Object object) {
  if (object is Map<String, Object>) {
    final typeName = object['__typename']! as String;
    final id = object['id'].toString();
    return <String>[typeName, id].join('/');
  }
  return '';
}

final cache = GraphQLCache(store: HiveStore());

ValueNotifier<GraphQLClient> clientFor({
  required String uri,
  String? subscriptionUri,
}) {
  Link link = HttpLink(uri);
  if (subscriptionUri != null) {
    final websocketLink = WebSocketLink(
      subscriptionUri,
    );

    link = link.concat(websocketLink);
  }

  return ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: link,
    ),
  );
}

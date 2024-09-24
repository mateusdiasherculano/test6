import 'package:challenge/app/app.dart';
import 'package:challenge/bootstrap.dart';
import 'package:graph_repository/helpers/config.dart';

void main() {
  Config.graphUrl = 'https://staging.nearay.com/graphql';
  Config.socketUrl = 'wss://staging.nearay.com/graphql';

  bootstrap(App.new);
}

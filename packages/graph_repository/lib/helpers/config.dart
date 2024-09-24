class Config {
  factory Config() {
    return _config;
  }
  Config._internal();

  static final Config _config = Config._internal();
  static String token = '';
  static String graphUrl = 'https://graph.nearay.com/graphql';
  static String socketUrl = 'wss://graph.nearay.com/graphql';
}

Config config = Config();

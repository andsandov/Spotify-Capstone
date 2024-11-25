import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'DB_USER', obfuscate: true)
  static final String dbUser = _Env.dbUser;

  @EnviedField(varName: 'DB_PASSWORD', obfuscate: true)
  static final String dbPass = _Env.dbPass;

  @EnviedField(varName: 'DB_HOST', obfuscate: true)
  static final String dbHost = _Env.dbHost;

  @EnviedField(varName: 'DB_PORT', obfuscate: true)
  static final int dbPort = _Env.dbPort;

  @EnviedField(varName: 'DB_NAME', obfuscate: true)
  static final String dbName = _Env.dbName;

  @EnviedField(varName: 'CLIENT_ID', obfuscate: true)
  static final String clientID = _Env.clientID;
}
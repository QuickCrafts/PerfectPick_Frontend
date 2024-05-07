import 'package:dartdap/dartdap.dart';

Future<bool> ldapVerificator() async {
  final connection = LdapConnection(
    host: 'localhost',
    ssl: false,
    port:389,
    bindDN: 'cn=admin,dc=perfectpick,dc=co',
    password: 'admin',
    );
  await connection.open();

  return true;
}
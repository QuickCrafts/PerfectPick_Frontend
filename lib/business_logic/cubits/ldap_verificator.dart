import 'package:dartdap/dartdap.dart';

Future<bool> ldapVerificator(String userEmail, String password) async {
  final connection = LdapConnection(
    host: 'localhost',
    ssl: false,
    port:389,
    bindDN: 'cn=admin,dc=perfectpick,dc=co',
    password: 'admin',
    );
  await connection.open();

  final response = await connection.bind(DN: userEmail, password: password);

  if (response.resultCode != ResultCode.OK) {
    print('Error: $response');
    return false;
  }

  return true;
}
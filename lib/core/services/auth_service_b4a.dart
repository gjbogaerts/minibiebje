import 'package:graphql/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../exceptions/auth_exception.dart';
import '../models/user.dart';
import '../utils/service_locator.dart';
import 'auth_service_abstract.dart';
import 'db_service_abstract.dart';
import 'package:logger/logger.dart';
import '../utils/my_logger.dart';
import 'dart:math';

class AuthServiceB4a extends AuthServiceAbstract {
  DbServiceAbstract _graphQL = locator<DbServiceAbstract>();
  GraphQLClient _client;
  User _user;
  Logger _log = getLogger('AuthServiceB4A');

  User get user {
    return _user;
  }

  Future<bool> logout() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('user')) {
      throw AuthException(
          'Je moet ingelogd zijn om deze functie te gebruiken.');
    }
    final userJson = prefs.getString('user');
    final User user = User.fromJson(userJson);
    String token = user.sessionToken;
    _client = _graphQL.getClient(sessionToken: token);
    try {
      final query = r'''
        mutation LogOut ($clientMutationId: String!) {
          logOut(input: {
            clientMutationId: $clientMutationId
          }) {
            viewer {
              user {
                id
              }
            }
          }
        }
      ''';
      int randInt = Random().nextInt(100000);
      final QueryOptions options = QueryOptions(
        documentNode: gql(query),
        variables: <String, String>{'clientMutationId': randInt.toString()},
      );

      _log.d(_client);
      final QueryResult result = await _client.query(options);
      _log.d(
          'logout | data: ${result.data} | hasException: ${result.hasException} | msg: ${result.exception.toString()}');
      if (!result.hasException) {
        if (prefs.containsKey('user')) {
          await prefs.remove('user');
        }
        return true;
      } else {
        return false;
      }
    } catch (err) {
      _log.d('Exception has occurred: ${err.toString()}');
      throw AuthException(err.toString());
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      if (prefs.containsKey('user')) {
        final userJson = prefs.getString('user');
        _user = User.fromJson(userJson);
        return true;
      } else {
        return false;
      }
    } catch (err) {
      throw AuthException('Er ging iets mis bij het automatisch inloggen.');
    }
  }

  Future<bool> auth(Map<String, dynamic> authData) async {
    // print(authData);
    try {
      if (authData['register'] == true) {
        await _register(authData);
      } else {
        await _login(authData);
      }
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', _user.toJson());
      return true;
    } catch (err) {
      throw AuthException(err.toString());
    }
  }

  Future<QueryResult> _login(Map<String, dynamic> authData) async {
    _client = _graphQL.getClient();
    _log.d('_login | $authData');
    final query = r'''
mutation LogIn($username: String!, $password: String!){
  logIn(input: {
    username: $username
    password: $password
  }){
    viewer{
      user{
        id
        createdAt
        updatedAt
        username
        email
        objectId
      }
      sessionToken
    }
  }
}
    ''';
    final QueryOptions options = QueryOptions(
      documentNode: gql(query),
      variables: <String, String>{
        'username': authData['username'],
        'password': authData['password'],
      },
    );
    final QueryResult result = await _client.query(options);
    final String sessionToken = result.data['logIn']['viewer']['sessionToken'];
    final Map<String, dynamic> userMap = result.data['logIn']['viewer']['user'];
    userMap['sessionToken'] = sessionToken;
    _user = User.fromMap(userMap);
    // print(_user.toString());
    return result;
  }

  Future<QueryResult> _register(Map<String, dynamic> authData) async {
    _client = _graphQL.getClient();
    final query = r'''
    mutation SignUp($username: String!, $password: String!, $email: String!) {
  signUp(input: {
    fields: {
      username: $username
      password: $password
      email: $email
    }
  }) {
    viewer {
      user {
        id
        objectId
        createdAt
        username
        email
        
      }
    }
  }
}

''';
    final QueryOptions options = QueryOptions(
      documentNode: gql(query),
      variables: <String, String>{
        'username': authData['username'],
        'password': authData['password'],
        'email': authData['email'],
      },
    );
    final QueryResult result = await _client.query(options);
    final Map<String, dynamic> userMap =
        result.data['signUp']['viewer']['user'];

    _user = User.fromMap(userMap);
    // print(_user.toString());
    return result;
  }
}

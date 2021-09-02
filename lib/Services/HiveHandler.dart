
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class HiveHandler{
  var encryptedBox;

  loginSaver(String usrEmail,String uid) async {
    if(kIsWeb){
      return;
    }
    final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    var containsEncryptionKey = await secureStorage.containsKey(key: 'key');
    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      var messagekey = Hive.generateSecureKey();
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
      await secureStorage.write(key: 'key', value: base64UrlEncode(key));
    }
    secureStorage.read(key: 'key').then((value) async {
        var encryptionKey = base64Url.decode(value.toString());
        print('Encryption key: $encryptionKey');
        encryptedBox = await Hive.openBox('vaultBox', encryptionCipher: HiveAesCipher(encryptionKey));
        encryptedBox.put('email', usrEmail);
        encryptedBox.put('uid', uid);
        print(encryptedBox.get('email'));
        print(encryptedBox.get('uid'));
      });

  }



  test() async {
    if (kIsWeb == false) {
      var path = Directory.current.path;
      Hive.init(path);
    }
    var box = await Hive.openBox('testBox');
    box.put('name', 'David');
    print('Name: ${box.get('name')}');
  }
}
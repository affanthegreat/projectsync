class SyncUser {
  final String _username;
  final String _email;
  final String _uid;

  SyncUser(this._username, this._email, this._uid);
  String get uid => _uid;
  String get email => _email;
  String get username => _username;

}

SyncUser? supersuer;
class ResponseModel {
  final bool _isSucess;
  final String _message;
  ResponseModel(this._isSucess, this._message);
  bool get isSucess => _isSucess;
  String get message => _message;
}

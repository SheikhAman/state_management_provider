import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _obsecure = false;

  bool get obsecure => _obsecure;

  void setObsecure(bool value) {
    _obsecure = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    // sob kichu try catch e rakhlam
    try {
      Response response = await post(Uri.parse('https://reqres.in/api/login'),
          //body er vitore email r password pathano hoi
          body: {
            'email': email,
            'password': password,
          });
      if (response.statusCode == 200) {
        print('successful');
        setLoading(false);
      } else {
        setLoading(false);
        print('failed');
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
  }
}

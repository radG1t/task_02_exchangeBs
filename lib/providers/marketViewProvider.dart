import 'package:flutter/foundation.dart';
import 'package:task_02/models/CryptoModel/AllCryptoModel.dart';
import 'package:task_02/network/apiProvider.dart';
import 'package:task_02/network/responseModel.dart';

class MarketViewProvider extends ChangeNotifier {
  ApiProivder apiProivder = ApiProivder();
  late AllCryptoModel dataFuture;
  late ResponseModel state;
  var response;
  getCryptoData() async {
    state = ResponseModel.loading('is loading ..');
    try {
      response = await apiProivder.getAllCryptoData();
      if (response.statusCode == 200) {
        dataFuture = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(dataFuture);
      } else {
        state = ResponseModel.error('smth wrong plz try again..');
      }
    } catch (e) {
      state = ResponseModel.error('check your connection!');
      notifyListeners();
      print(e.toString());
    }
  }
}
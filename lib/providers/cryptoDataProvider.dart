import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_02/models/CryptoModel/AllCryptoModel.dart';
import 'package:task_02/network/apiProvider.dart';
import 'package:task_02/network/responseModel.dart';

class CryptoDataProvider extends ChangeNotifier {
  ApiProivder apiProivder = ApiProivder();
  late AllCryptoModel datafuter;
  late ResponseModel state;
  var response;
  getTopMarketCapData() async {
    state = ResponseModel.loading("is loading .. ");

    try {
      response = await apiProivder.getTopMarketCapData();

      if (response.statusCode == 200) {
        datafuter = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(datafuter);
      } else {
        state = ResponseModel.error("something wrong!");
      }

      notifyListeners();
    } catch (e000) {
      state = ResponseModel.error("check your network.");
    }
  }

  getTopGainersData() async {
    state = ResponseModel.loading("is loading .. ");

    try {
      response = await apiProivder.getTopGainerData();

      if (response.statusCode == 200) {
        datafuter = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(datafuter);
      } else {
        state = ResponseModel.error("something wrong!");
      }

      notifyListeners();
    } catch (e000) {
      state = ResponseModel.error("check your network.");
    }
  }

  getToplosersData() async {
    state = ResponseModel.loading("is loading .. ");

    try {
      response = await apiProivder.getTopLoserData();

      if (response.statusCode == 200) {
        datafuter = AllCryptoModel.fromJson(response.data);
        state = ResponseModel.completed(datafuter);
      } else {
        state = ResponseModel.error("something wrong!");
      }

      notifyListeners();
    } catch (e000) {
      state = ResponseModel.error("check your network.");
    }
  }
}

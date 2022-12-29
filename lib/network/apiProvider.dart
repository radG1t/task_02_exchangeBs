//https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=5000&sortBy=market_cap&sortType=desc&convert=USD,BTC,ETH&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap
import 'package:dio/dio.dart';

class ApiProivder {
  dynamic getTopMarketCapData() async {
    var response;
    response = await Dio().get(
        'https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=15&sortBy=market_cap&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap');
    return response;
  }

  dynamic getTopGainerData() async {
    var response;
    response = await Dio().get(
        'https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=15&sortBy=percent_change_24h&sortType=desc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap');
    return response;
  }

  dynamic getTopLoserData() async {
    var response;
    response = await Dio().get(
        'https://api.coinmarketcap.com/data-api/v3/cryptocurrency/listing?start=1&limit=15&sortBy=percent_change_24h&sortType=asc&convert=USD&cryptoType=all&tagType=all&audited=false&aux=ath,atl,high24h,low24h,num_market_pairs,cmc_rank,date_added,max_supply,circulating_supply,total_supply,volume_7d,volume_30d,self_reported_circulating_supply,self_reported_market_cap');
    return response;
  }
}

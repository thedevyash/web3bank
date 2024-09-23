import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:web3bank/models/TransactionModel.dart';
import 'package:web3bank/secrets.dart';
import 'package:web3dart/web3dart.dart';
import "package:http/http.dart" as http;
import 'package:web_socket_channel/io.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardInitialFetchEvent>(dashboardInitialFetchEvent);
  }
  List<TransactionModel> transactions = [];
  Web3Client? _web3client;
  late ContractAbi _abiCode;
  late EthereumAddress _contractAddress;
  late EthPrivateKey _creds;
//Functiuons
  late DeployedContract _deployedContract;
  late ContractFunction _deposit;
  late ContractFunction _withdraw;
  late ContractFunction _getBalance;
  late ContractFunction _getAllTransactions;
  //connecti to blockchin then get the deployed contract then get the abi then get the trnsactions
  FutureOr<void> dashboardInitialFetchEvent(
      DashboardInitialFetchEvent event, Emitter<DashboardState> emit) async {
    emit(DasboardLoadingState());
    //enter url where ganache is running
    final String rpcUrl = "http://127.0.0.1:7545";
    final String socketUrl = "ws://127.0.0.1:7545";

    try {
      //this is the web3client using this we can contact with the smart contract
      _web3client = Web3Client(rpcUrl, http.Client(), socketConnector: () {
        return IOWebSocketChannel.connect(socketUrl).cast<String>();
      });

//getABI- appliction binary interface
      String abiFile = await rootBundle
          .loadString('build/contracts/ExpenseManagerContract.json');
      var jsonDecoded = jsonDecode(abiFile);
      _abiCode = ContractAbi.fromJson(
          jsonEncode(jsonDecoded['abi']), 'ExpenseManagerContract');
      _contractAddress =
          EthereumAddress.fromHex("0xfD7d8230ddB6D6A9d5aAB8299FFfff9B4aB2Cc96");
      _creds = EthPrivateKey.fromHex(privateKey);

      //get deployed contract
      _deployedContract = DeployedContract(_abiCode, _contractAddress);
      _deposit = _deployedContract.function("deposit");
      _withdraw = _deployedContract.function("withdraw");
      _getBalance = _deployedContract.function("getBalance");
      _getAllTransactions = _deployedContract.function("getAllTransaction");

      //fetching the transactions
      final data = await _web3client!.call(
          contract: _deployedContract,
          function: _getAllTransactions,
          params: []);
      log(data.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}

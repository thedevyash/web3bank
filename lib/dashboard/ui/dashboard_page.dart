import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web3bank/Deposit/deposit.dart';
import 'package:web3bank/const/colors.dart';
import 'package:web3bank/dashboard/bloc/dashboard_bloc.dart';

import '../../Withdraw/withdraw.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardBloc dashboardBloc = DashboardBloc();

  @override
  void initState() {
    dashboardBloc.add(DashboardInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.blue,
      appBar: AppBar(
          title: Text(
            "Web3 Bank",
            style: GoogleFonts.poppins(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w500),
          ),
          backgroundColor: colors.blue),
      body: BlocConsumer<DashboardBloc, DashboardState>(
        bloc: dashboardBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case DashboardLoadingState:
              return Center(
                child: CircularProgressIndicator(),
              );
            case DashboardErrorState:
              return Center(
                child: Text("Error"),
              );

            case DashboardSuccessState:
              final successState = state as DashboardSuccessState;
              return Padding(
                padding: const EdgeInsets.only(
                    top: 12.0, bottom: 10, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        borderRadius: BorderRadius.circular(
                            10), // Optional rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 1, // How wide the shadow should be
                            blurRadius: 3, // How blurry the shadow should be
                            offset: Offset(0, 2), // Shadow position (x, y)
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 14.0, right: 14, top: 18, bottom: 18),
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/logo.png",
                                      height: 100,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            "${successState.balance.toString()} ETH",
                                            style: GoogleFonts.poppins(
                                                fontSize: 32,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    ),
                                  ]),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Color.fromARGB(
                                              255, 177, 239, 209)),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) => DepositPage(
                                                dashboardBloc: dashboardBloc,
                                              ),
                                            ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text(
                                          "+ Deposit",
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 20, 160, 25)),
                                        ),
                                      )),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Color.fromARGB(
                                              255, 252, 204, 204)),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                              builder: (context) =>
                                                  WithdrawPage(
                                                dashboardBloc: dashboardBloc,
                                              ),
                                            ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text(
                                          "- Withdraw",
                                          style: GoogleFonts.poppins(
                                              color: Color.fromARGB(
                                                  255, 203, 18, 4),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Transactions",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: successState.transactions.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Container(
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/logo.png",
                                    height: 36,
                                  ),
                                  SizedBox(
                                    width: 9,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          successState.transactions[index]
                                                      .transtype ==
                                                  1
                                              ? Icon(
                                                  Icons.add,
                                                  color: Colors.green,
                                                  size: 21,
                                                )
                                              : Icon(
                                                  Icons.remove,
                                                  size: 21,
                                                  color: Colors.red,
                                                ),
                                          Text(
                                            "${successState.transactions[index].amount.toString()} ETH",
                                            style: GoogleFonts.poppins(
                                                color: successState
                                                            .transactions[index]
                                                            .transtype ==
                                                        1
                                                    ? Colors.green
                                                    : Colors.red,
                                                fontSize: 21,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        successState.transactions[index].reason,
                                        style: GoogleFonts.poppins(
                                            color: Colors.blueGrey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        successState
                                            .transactions[index].address,
                                        style: GoogleFonts.poppins(
                                            color: Colors.blueGrey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}

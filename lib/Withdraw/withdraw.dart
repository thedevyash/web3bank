import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web3bank/dashboard/bloc/dashboard_bloc.dart';
import 'package:web3bank/models/TransactionModel.dart';

class WithdrawPage extends StatefulWidget {
  DashboardBloc dashboardBloc;
  WithdrawPage({super.key, required this.dashboardBloc});

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addressController.text = "0x82f99FF41a311490a7445D68Cf2888967265E675";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Withdraw Details",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: addressController,
              decoration: InputDecoration(hintText: "Enter address"),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: amountController,
              decoration: InputDecoration(hintText: "Enter amount"),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              controller: reasonController,
              decoration: InputDecoration(hintText: "Enter reason"),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 252, 204, 204)),
                  onPressed: () {
                    widget.dashboardBloc.add(DashboardWithdrawEvent(
                        transactionModel: TransactionModel(
                            addressController.text,
                            int.parse(amountController.text),
                            reasonController.text,
                            DateTime.now(),
                            0)));
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      "- Withdraw",
                      style: GoogleFonts.poppins(
                          color: Color.fromARGB(255, 203, 18, 4),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

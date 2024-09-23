import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Deposit Details",
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
                    backgroundColor: Color.fromARGB(255, 177, 239, 209),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      "+ Deposit",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 20, 160, 25)),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

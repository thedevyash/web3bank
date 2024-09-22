import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web3bank/const/colors.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.blue,
      appBar: AppBar(
        backgroundColor: colors.blue,
        scrolledUnderElevation: 0,
        title: Text(
          "Web3 Bank",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 12.0, bottom: 10, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius:
                    BorderRadius.circular(10), // Optional rounded corners
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
                                    "10 ETH",
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
                                  backgroundColor:
                                      Color.fromARGB(255, 177, 239, 209)),
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
                          SizedBox(
                            width: 12,
                          ),
                          TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 252, 204, 204)),
                              onPressed: () {},
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
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/logo.png",
                            height: 36,
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Text(
                            "10 ETH",
                            style: GoogleFonts.poppins(
                                fontSize: 21, fontWeight: FontWeight.w500),
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
      ),
    );
  }
}

class TransactionModel {
  final String address;
  final int amount;
  final String reason;
  final DateTime timestamp;
  final int transtype;

  TransactionModel(
      this.address, this.amount, this.reason, this.timestamp, this.transtype);
}

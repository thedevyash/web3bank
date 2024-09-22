// SPDX-License-Identifier: MIT
contract ExpenseManagerContract {
    address public owner;
    struct Transaction{
        address user;
        float amount;
        uint timestamp;
        string reason;
    }
   Transaction[] public transactions;
    constructor() {
        owner=msg.sender;
    }

event Deposit(address indexed _from,float amount)

    //memory mean just to store for sometime  payable when fun has to accept some ethereum
    function deposit(float _amount,string memory _reason) public payable{
  require(_amount>0,"Deposit amount should be more than 0");
transactions.push(Transaction(msg.sender,_amount,_reason,block.timestamp));

    }
    function withdraw() {
        
    }
    function getBalance() {
        
    }
    function getTransactionCount(type name) {
        
    }
    function getTransaction(type name) {
        
    }
    function getAllTransaction(type name) {
        
    }
    function changeOwner(type name) {
        
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ExpenseManagerContract {
    address public owner;
    struct Transaction{
        address user;
        uint amount;
        uint timestamp;
        string reason;
        uint transtype;
    }
   Transaction[] public transactions;

    constructor() {
        owner=msg.sender;
    }
  modifier onlyOwner(){
        require(msg.sender==owner,"Only owner can modify the owner of the account");
    _;
    }

mapping(address=> uint) public balances;

//msg.sender is the owner who initialissed the contract


event Deposit(address indexed _from,uint _amount,string _reason,uint timestamp);
event Withdraw(address indexed _to,uint _amount,string _reason,uint timestamp);

    //memory means just to store for sometime  payable when fun has to accept some ethereum
    function deposit(uint _amount,string memory _reason) public payable  {

  require(_amount>0,"Deposit amount should be more than 0");
transactions.push(Transaction(msg.sender,_amount,block.timestamp,_reason,1));
balances[msg.sender]+=_amount;
emit Deposit(msg.sender,_amount,_reason,block.timestamp);
    }
    function withdraw(uint _amount,string memory _reason) public{
        require(balances[msg.sender]>=_amount,"Insufficient balance");
        balances[msg.sender]-=_amount;
        transactions.push(Transaction(msg.sender,_amount,block.timestamp,_reason,0));
        payable(msg.sender).transfer(_amount);
        emit Withdraw(msg.sender,_amount,_reason,block.timestamp);

    }
    //view is used whenever a function is used to get something
    function getBalance(address _account)public view returns (uint) {
        return balances[_account];
    }
    function getTransactionCount() public view returns (uint) {
        return transactions.length;
    }
    function getTransaction(uint _index)public view returns (address,uint,string memory,uint) {
        require(_index<transactions.length,"Index out of bounds");
        Transaction memory trans=transactions[_index];
        return (trans.user,trans.amount,trans.reason,trans.timestamp);
    }
    function getAllTransaction()public view returns (address[] memory, uint[] memory,
    string [] memory,uint [] memory,uint [] memory) {
        address[] memory users=new address[](transactions.length);
         uint[] memory amounts=new uint[](transactions.length);
          string[] memory reasons=new string[](transactions.length);
           uint[] memory timestamps=new uint[](transactions.length);
           uint[] memory transtypes=new uint[](transactions.length);
           for(uint i=0;i<transactions.length;i++)
           {
            users[i]=transactions[i].user;
            amounts[i]=transactions[i].amount;
            reasons[i]=transactions[i].reason;
            timestamps[i]=transactions[i].timestamp;
            transtypes[i]=transactions[i].transtype;
           }

           return (users,amounts,reasons,timestamps,transtypes);

    }
    //only owner means only the owner of the smart contract can call the function
    function changeOwner(address _newOwner)public onlyOwner {
        owner=_newOwner;
    }  
}
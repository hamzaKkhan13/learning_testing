// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimplePaymentChannel {

    address immutable i_owner;

    mapping(address => uint) public balances;

    modifier OnlyOwner {
        require(msg.sender == i_owner, "Only owner can call this function.");
        _;
    }
  
    constructor(address recipientAddress) {
        i_owner = recipientAddress;
    }

    function deposit() public payable {
        require(msg.value > 0, "Can't deposit 0 amount.");
        balances[i_owner] += msg.value;
    }

    function listPayment(uint256 amount) public {
        
    }

    function closeChannel() public OnlyOwner {}

    function checkBalance() public view OnlyOwner returns (uint256) {
        return i_owner.balance;
    }

    function getAllPayments() public view returns (uint256[] memory) {}

    function getTotal() public view OnlyOwner returns (uint256 ){
        return i_owner.balance;
    }
}


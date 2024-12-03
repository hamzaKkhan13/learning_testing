// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Payable{

    address payable public owner;

    address public o1 = msg.sender;

    constructor() payable  {

        owner = payable(msg.sender);
    }

    function desposit() payable public{}

    function notPayable() public {}

    function withdraw() payable public{
        uint amount = address(this).balance;

        (bool success, ) = owner.call{value: amount}("");

        require(success, "Failed to send eth");
    }

    function transfer (address payable _to, uint _amount) payable public {
        (bool success, ) = owner.call{value: _amount}("");
        require(success, "Failed to send eth");
    }

}
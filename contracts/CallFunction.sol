// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Reciver{
    event Recived(address caller, uint amount, string message);
    event Log(string _message, uint _gas);

    fallback () external payable {
        emit Recived(msg.sender, msg.value, "Fallback called");
    }

    receive() external payable {
        emit Log("receive", gasleft());
    }

    function foo(string memory _message, uint _x) public payable returns (uint) {
        emit Recived(msg.sender, msg.value, _message);

        return _x + 1;
    } 
}

contract Caller {
    event Response(bool success, bytes data);

    function testCallFoo(address payable _addr) public payable {
        (bool success, bytes memory data) = addr.call{value: msg.value, gas: 5000}
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallbackExample{
    uint public result;

    event Recieved(address, uint);
    event Fallback(address, uint, string);
    
    receive() external payable { 
        result = 1;
        emit Recieved(msg.sender, msg.value);
    }

    fallback() external payable {
        result = 2;
        emit Fallback(msg.sender, msg.value, "Fallback called");
     }
}
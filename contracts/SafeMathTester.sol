// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SafeMathTester{
    uint8 public bigNumber = 255; // unchecked for < 0.7.6 , checked for ^

    function add() public {
        unchecked {bigNumber = bigNumber + 1;} // == same as "bigNumber += 1"
    }
}
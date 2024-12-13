// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Events{

    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {

        emit Log(msg.sender, "asdasd");
        emit Log(msg.sender, "qweeqw");
        emit AnotherLog();
    }
}
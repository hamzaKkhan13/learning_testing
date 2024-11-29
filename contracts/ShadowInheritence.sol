// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A{
    string public name = "String A";

    function getName() public view virtual returns (string memory){
        return name;
    }
}

contract C is A{

    constructor(){
        name = "String C";
    }
}
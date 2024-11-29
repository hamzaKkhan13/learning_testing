// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Parent Contract
contract A{

    function foo() public view virtual returns(string memory){
        return "A";
    }
}

// 1st child
contract B is A{
    function foo() public view virtual override returns (string memory){
        return "B";
    }
}

// 2nd Child
contract C is A{
    function foo() public view virtual override returns (string memory){
        return "C";
    }
}

contract D is B, C {
    function foo() public view override (B,C) returns (string memory){
        return super.foo();
    }
}

contract E is C, B {
    function foo() public view override (C,B) returns (string memory){
        return super.foo();
    }
}

//
contract F is A,B{
    function foo() public view override (A,B) returns (string memory){
        return super.foo();
    }
}
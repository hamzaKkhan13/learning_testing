// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//parent contract
contract A{

    event Log(string message);

    constructor () {
        emit Log("A Initalized");
    }

    function foo() public virtual {
        emit Log("A.foo");
    }

    function bar() public virtual {
        emit Log("A.bar");
    }
}

contract B is A{

    constructor() {
        emit Log("B Initazlied");
    }

    function foo() public virtual override {
        emit Log("B.foo");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("B.bar");
        super.bar();
    }
}

contract C is A{

    constructor() {
        emit Log("C Initazlied");
    }

    function foo() public virtual override {
        emit Log("C.foo");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar");
        super.bar();
    }
}

contract D is B,C{

    function foo() public override (B,C){
        super.foo();
    }

    function bar() public override (B,C){
        super.foo();
    }
    
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract X{

    string public name;
    
    constructor (string memory _name){
        name = _name;
    }
}

contract Y {

    string public text;

    constructor (string memory _text) {
        text = _text ;
    }
}

// contract B is X("Input is X"), Y("Input is Y"){

// }
    
contract C is X,Y{

    constructor (string memory _name, string memory _text) X(_name) Y(_text){

    }
}

contract D is X,Y{

    constructor() X("X initalized") Y("Y initalized"){

    }
}

contract E is X,Y{

    constructor() Y("Y inialized") X("X initalized"){

    }
}
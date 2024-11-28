// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModifierFunction{

    address public owner;
    uint256 public x = 10;
    bool public locked;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Not Owner");
        _;
    }

    modifier validateData(address _addr){
        require(_addr != address(0), "Not valid address");
        _;
    }

    modifier noReentrancy(){
        require(!locked, "Not locked");
        locked = true;
        _;
        locked = false;
    }

    function changeOwner(address _newOwner) public onlyOwner validateData (_newOwner){
        owner = _newOwner;
    }

    function decrement (uint i) public noReentrancy {
        x -= 1;
        if ( i > 1 ){
            decrement(i-1);
        }
    }

    // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 - 1ST OWNER
}
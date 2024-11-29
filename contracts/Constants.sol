// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Contstants{

    //70063 -- First Run Gas
    //45697 -- 2nd Run Gas

    address public constant myAddr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    function getConstant() public pure returns(address){
        return myAddr;
    }
}
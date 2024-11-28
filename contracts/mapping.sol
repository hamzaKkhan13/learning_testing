// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract mapp{

    mapping (address => uint) public myMap;

    mapping (uint => address) public map2;

    function get(address _addr) public view returns (uint){
        return myMap[_addr];
    }

    function set(address _addr, uint i) public {
        myMap[_addr] = i;
    }

    function remove(address _addr) public {
        delete myMap[_addr];
    }

    function getAddr(uint _i) public view returns (address){
        return map2[_i];
    }
}

contract nestedMapping{

    mapping(address => mapping (uint => bool)) public nestMap;

    function get(address _addr, uint _i) public view returns(bool) {
        return nestMap[_addr][_i];
    }

    function set(address _addr, uint _i, bool b) public {
        nestMap[_addr][_i] = b;
    }

    function remove(address _addr, uint _i) public{
        delete nestMap[_addr][_i];
    }

}
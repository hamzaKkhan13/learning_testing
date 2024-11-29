// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Enum{
    
    enum Status{
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Cancelled
    }

    Status myStatus;

    constructor(){
        myStatus = Status.Pending;
    }

    function getStatus() public view returns (Status){
        return myStatus;
    }

    function setStatus(Status _status) public {
        myStatus = _status;    
    }

    function setCancelled() public{
        myStatus = Status.Cancelled;
    }

    function reset() public {
        delete myStatus;
    }
}
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;

    contract Inbox {

        // contract variables
        string public message;

        // Default constructor
        constructor (string memory _message) {
            
            message = _message; 
        }


        // Setter function
        function setMessage(string memory _message) public {
            message = _message;
        }

        // getter function
        // function getMessage() public view re turns (string memory) {
        //     return message;
        // }

        // gas check function 
        function doMath(uint a, uint b) public pure {
            a+b;
            a-b;
            a/b;
            a == 0;
        }

    }
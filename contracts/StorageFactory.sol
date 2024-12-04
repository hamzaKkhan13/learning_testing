// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    
    SimpleStorage[] public simpleStorageArray;
    //SimpleStorage public simpleStorage;           -- Created to check address of the bew item

    function createSimpleStorageContract () public {

        SimpleStorage _simpleStorage = new SimpleStorage();
        simpleStorageArray.push(_simpleStorage);

    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorgeNumber) public {
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorgeNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){
        return simpleStorageArray[_simpleStorageIndex].retrieve();
    }

    
    
}
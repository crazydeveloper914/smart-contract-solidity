// SPDX-License-Identifier: MIT
//
// https://cryptomarketpool.com/simple-contract

pragma solidity ^0.8.0;

contract MyContract {
    string private name;
    uint256 private age;

    function setName(string memory _name) public {
        name = _name;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function setAge(uint256 _age) public {
        age = _age;
    }

    function getAge() public view returns (uint256) {
        return age;
    }
}

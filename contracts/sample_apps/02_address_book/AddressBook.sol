// SPDX-License-Identifier: MIT
//
// https://cryptomarketpool.com/address-book

pragma solidity ^0.8.0;

contract AddressBook {
    mapping(address => address[]) private contacts;
    mapping(address => mapping(address => string)) private aliases;

    function getContacts() public view returns (address[] memory) {
        return contacts[msg.sender];
    }

    function addContact(address contactAddress, string memory aliasName) public {
        contacts[msg.sender].push(contactAddress);
        aliases[msg.sender][contactAddress] = aliasName;
    }

    function getAlias(address contactAddress) public view returns (string memory) {
        return aliases[msg.sender][contactAddress];
    }

    function removeContact(address contactAddress) public {
        uint256 length = contacts[msg.sender].length;
        for (uint256 i = 0; i < length; i++) {
            if (contactAddress == contacts[msg.sender][i]) {
                if (contacts[msg.sender].length > 1 && i < length - 1) {
                    contacts[msg.sender][i] = contacts[msg.sender][length - 1];
                }

                contacts[msg.sender].pop();

                delete aliases[msg.sender][contactAddress];
                break;
            }
        }
    }
}

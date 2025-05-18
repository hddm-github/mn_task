// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract revertStr {
    function revertString(string memory _input) public pure returns (string memory) {
        bytes memory inputBytes = bytes(_input);
        require(inputBytes.length > 0, "Input string is empty");
        bytes memory reversedBytes = new bytes(inputBytes.length);
        for (uint i = 0; i < inputBytes.length; i++) {
            reversedBytes[inputBytes.length - i - 1] = inputBytes[i];
        }
    }
}
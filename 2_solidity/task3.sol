pragma solidity ^0.8.0;

contract RomanToInteger {
    mapping(bytes1 => uint) public romanValues;

    constructor() {
        romanValues["I"] = 1;
        romanValues["V"] = 5;
        romanValues["X"] = 10;
        romanValues["L"] = 50;
        romanValues["C"] = 100;
        romanValues["D"] = 500;
        romanValues["M"] = 1000;
    }

    function romanToInt(string memory s) public view returns (uint) {
        bytes memory bytesStr = bytes(s);
        uint result = 0;
        for (uint i = 0; i < bytesStr.length; i++) {
            if (i < bytesStr.length - 1 && romanValues[bytesStr[i]] < romanValues[bytesStr[i+1]]) {
                result -= romanValues[bytesStr[i]];
            } else {
                result += romanValues[bytesStr[i]];
            }
        }
        return result;
    }
}
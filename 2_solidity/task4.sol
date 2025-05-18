pragma solidity ^0.8.0;

/**
 * @title 整数转罗马数字
 * @dev 实现将1到3999之间的整数转换为罗马数字的功能
 */
contract IntegerToRoman {
    // 定义数值与罗马符号的映射数组（按从大到小排序，包含特殊组合）
    uint[] private values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    string[] private symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];

    /**
     * @dev 将整数转换为罗马数字
     * @param num 输入的整数值（1 <= num <= 3999）
     * @return 对应的罗马数字字符串
     */
    function intToRoman(uint num) public view returns (string memory) {
        require(num >= 1 && num <= 3999, "Number out of range"); // 输入范围校验

        string memory result = "";
        // 遍历数值数组，从最大的数值开始处理
        for (uint i = 0; i < values.length; i++) {
            // 当当前数值可以被输入数值减去时
            while (num >= values[i]) {
                // 拼接对应的罗马符号
                result = string(abi.encodePacked(result, symbols[i]));
                // 减去已处理的数值
                num -= values[i];
            }
        }
        return result;
    }
}
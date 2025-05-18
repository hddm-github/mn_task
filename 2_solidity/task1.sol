// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    // 存储候选人得票数的mapping
    mapping(string => uint) public candidatesVotes;
    // 记录所有候选人的数组（用于重置投票）
    string[] public candidates;
    // 新增：记录已投票的地址（防止重复投票）
    mapping(address => bool) public voters;
    // 新增：合约所有者（用于权限控制）
    address public owner;

    // 构造函数：初始化合约所有者
    constructor() {
        owner = msg.sender;
    }

    // 新增：权限修饰器（仅所有者可调用）
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    // 投票函数：增加防重复投票和候选人校验
    function vote(string memory _candidate) public {
        // 检查地址是否已投票
        require(!voters[msg.sender], "You have already voted");
        // 检查候选人名称不为空（防止空字符串攻击）
        require(bytes(_candidate).length > 0, "Invalid candidate");
        
        // 如果候选人不存在则添加到数组
        if (candidatesVotes[_candidate] == 0) {
            candidates.push(_candidate);
        }
        // 增加对应候选人的得票数
        candidatesVotes[_candidate]++;
        // 标记当前地址已投票
        voters[msg.sender] = true;
    }

    // 获取得票数函数（保持原有逻辑）
    function getVotes(string memory _candidate) public view returns (uint) {
        return candidatesVotes[_candidate];
    }

    // 重置投票函数：增加权限控制
    function resetVotes() public onlyOwner {
        for (uint i = 0; i < candidates.length; i++) {
            candidatesVotes[candidates[i]] = 0;
        }
    }
}
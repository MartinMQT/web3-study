// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingTest{
    // 任务 1：基于映射创建一个简单的用户余额管理系统，并实现余额的增加与查询功能。
    mapping(address => uint) userBalanceMap;
    // 任务 2：扩展系统，使其能够记录每个用户的交易历史，模拟 Java 的 Map 中键集合的概念。
    mapping(address => int[]) userBalanceMapHis;

    // 增加用户余额
    function addBalance(uint balance) public{
        userBalanceMap[msg.sender] += balance;
        this.pushBalanceHis(int(balance));
    }
    // 减余额
    function minBalance(uint balance) public{
        uint curBalance = userBalanceMap[msg.sender];
        require(curBalance >=balance,"balance is not enough");
        userBalanceMap[msg.sender] -= balance;
        this.pushBalanceHis(-int(balance));
    }
    // 查询用户余额
    function getUserBalance() public view returns(uint){
        return userBalanceMap[msg.sender];
    }

    // 查询用户历史交易
    function getUserBalanceHis() public returns(int[] memory){
        return userBalanceMapHis[msg.sender];
    }

    // 添加交易记录
    function pushBalanceHis(int balance)public  {
        int[] memory balanceHis = userBalanceMapHis[msg.sender];
        balanceHis.length +=1;
        balanceHis[balanceHis.length-1] = balance;

        try {

        }catch {
            
        }
    }

}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ApiTest{

     //获取当前块的区块号
    function getBlockNo()public view returns(uint){
        return block.number;
    }
    // 获取当前时间戳
    function getCurTime()public view returns(uint){
        return block.timestamp;
    }

    // 矿工地址
    function getCoinbase() public view returns(address){
        return block.coinbase;
    }
    //交易的 Gas 价格
    function getCurGasPrice()public view returns(uint){
        return tx.gasprice;
    }

    // 将参数编码为字节数组
    function encodeData(uint price,string calldata name)public view returns(bytes memory){
        return abi.encode(price,name, address(this));
    }
    // 解析字节数组
    function decodeData(bytes calldata data)public pure returns(uint ,string memory){
        return abi.decode(data,(uint,string));
    }

    uint public stage1UnlockTime; 
    uint public stage2UnlockTime; 
    address public owner;

    constructor(uint _stage1Lock, uint _stage2Lock) {
        owner = msg.sender;
        stage1UnlockTime = block.timestamp + _stage1Lock * 1 days;  // 第一阶段锁定天数
        stage2UnlockTime = block.timestamp + _stage2Lock * 1 days;  // 第二阶段锁定天数
    }
    function withdrawStage1() public {
        require(block.timestamp >= stage1UnlockTime, "Stage 1 funds are locked.");
        require(msg.sender == owner, "Only owner can withdraw.");
        // 提取第一阶段资金操作
    }
    function withdrawStage2() public {
        require(block.timestamp >= stage2UnlockTime, "Stage 2 funds are locked.");
        require(msg.sender == owner, "Only owner can withdraw.");
        // 提取第二阶段资金操作
    }

    // uint public lastActionTime; 
    // address public owner;

//  每天限制一次执行的合约
    // constructor() {
    //     owner = msg.sender;
    //     lastActionTime = block.timestamp - 1 days;  // 初始化为可立即执行
    // }
    // function performAction() public {
    //     require(msg.sender == owner, "Only owner can perform this action.");
    //     require(block.timestamp >= lastActionTime + 1 days, "You can only perform this action once per day.");
    //     lastActionTime = block.timestamp;  // 更新最后一次执行时间
    //     // 执行具体操作
    // }
}
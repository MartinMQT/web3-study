pragma solidity ^0.8.0;

contract ArrayTest{
    uint size = 2;
    // 创建一个storage 的address数据
    address[] addressArray = new address[](size);

    // 修改数组的指定元素
    function updateAddress(address payable addr,uint8 index)public {
        require(size > index,"Extremely long in length");
        addressArray[index] = addr;
    }
    // 向末尾增加一个元素
    function push(address addr)public {
        addressArray.push(addr);
    }
    // 弹出末尾的元素
    function pop()public{
        addressArray.pop();
    }
    // 获取指定下标的元素
    function getAddr(uint index)public view returns(address){
        require(size > index,"Extremely long in length");
        return addressArray[index];
    }
    // 求素组的和
    function sumArray(uint[] calldata arr)public pure returns(uint){
        uint sum = 0;
        for (uint i = 0; i < arr.length; i++) 
        {
            sum+=arr[i];
        }
        return sum;
    }
}
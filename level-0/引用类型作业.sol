// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract TypeTest{

    uint[] data;

    function updateDate(uint[] memory newData)public {
        // 赋值到storage，开销较大
        data = newData;
    }

    function getData()public view  returns (uint[] memory){
        return data;
    }

    function modifyStorageData(uint index,uint value)public {
        require(data.length > 0,"no data");
        // 修改storage中的值，开销较大
        data[index] = value;
    }
    function modifyMemoryData(uint[] memory memData)public pure returns(uint[] memory){
        if (memData.length > 0){
            // 修改memroy 的值，开销较小
            memData[0] = 1;
        }
        return memData;
    }
}

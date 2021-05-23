pragma solidity ^0.6.0;

import "https://raw.githubusercontent.com/smartcontractkit/chainlink/develop/evm-contracts/src/v0.6/ChainlinkClient.sol";

contract mcsOracle is ChainlinkClient {
  
    string public message;
    
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    
    constructor() public {
        setPublicChainlinkToken();
        oracle = 0x1b666ad0d20bC4F35f218120d7ed1e2df60627cC; // Oracle address
        jobId = "e7fbe2c2bde643788f4a76b7b09db8ff";  // Target Node address
        fee = 0.1 * 10 ** 18; // 0.1 LINK
    }

    function requestUserData() public returns (bytes32 requestId) 
    {
        Chainlink.Request memory request = buildChainlinkRequest(jobId, address(this), this.fulfill.selector);
        
        
        request.add("get", "https://mcsclient.herokuapp.com/"); // API to retrieve data from by performing a GET request.
       
        request.add("path", "message"); //Key value of json to get data from

        
        return sendChainlinkRequestTo(oracle, request, fee); // Send the request
    }
    
    //Receive the response from API to be added to the chainlink network
    function fulfill(bytes32 _requestId, bytes32 _message) public recordChainlinkFulfillment(_requestId)
    {
        bytes memory bytesArray = new bytes(32);
        for (uint256 i; i < 32; i++) {
            bytesArray[i] = _message[i];
            }
        message = string(bytesArray);
    }
}
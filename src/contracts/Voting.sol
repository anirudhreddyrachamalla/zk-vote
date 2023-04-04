// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.4;
import './ISemaphore.sol';

contract Voting{
    struct ElectionData{
        string title;
        string[] options; 
    }
    struct PollResult{
        mapping(string => uint256) votescount;
    }
    ISemaphore private semaphoreContract;
    mapping(uint256 => ElectionData) private allElectionData;
    constructor() {
        address semaphoreAddress = 0x220fBdB6F996827b1Cf12f0C181E8d5e6de3a36F;//this is the address on sepolia test network
        semaphoreContract = ISemaphore(semaphoreAddress);
    }

    function createPoll(uint256 groupId, string memory title, string[] memory options) public {
        semaphoreContract.createGroup(groupId, 20, msg.sender);
        ElectionData memory electionData = ElectionData(title, options);
        allElectionData[groupId] = electionData;
    }


}
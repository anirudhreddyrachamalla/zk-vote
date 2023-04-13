// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.4;
import './ISemaphore.sol';

contract Voting{
    struct ElectionData{
        address admin;
        string title;
        string[] options; 
    }
    struct PollResult{
        mapping(string => uint256) votescount;
    }

    modifier onlyOwner(address adminAddress){
        require(msg.sender == adminAddress, "You don't have entitlements to perform this action.");
        _;
    }
    ISemaphore private semaphoreContract;
    mapping(uint256 => ElectionData) private allElectionData;
    constructor() {
        address semaphoreAddress = 0x220fBdB6F996827b1Cf12f0C181E8d5e6de3a36F;//this is the address on sepolia test network
        semaphoreContract = ISemaphore(semaphoreAddress);
    }

    //adding members to a group can be done by directly making the ui-client talk with semaphore contract itself.

    function createPoll(uint256 groupId, string memory title, string[] memory options) public {
        //todo: check whether the groupId already exists
        semaphoreContract.createGroup(groupId, 20, msg.sender);
        ElectionData memory electionData = ElectionData(msg.sender, title, options);
        allElectionData[groupId] = electionData;
    }

    function castVote(uint256 groupId, uint256 signal) public {
    }

    function revealResults(uint groupId) public onlyOwner(allElectionData[groupId].admin) {
    }


}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LearningToken is ERC20 {
    address public owner;
    
    mapping(address => uint256) public milestones;

    constructor() ERC20("LearningToken", "LTKN") {
        owner = msg.sender;
        _mint(owner, 1000000 * 10 ** decimals());
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    function setMilestone(address user, uint256 milestone) external onlyOwner {
        milestones[user] = milestone;
    }

    function rewardUser(address user, uint256 milestone) external onlyOwner {
        require(milestones[user] == milestone, "Milestone not achieved");
        _mint(user, milestone * 10 ** decimals());
    }
}

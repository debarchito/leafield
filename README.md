![Leafield](./assets/leafield.png)

> Leafield is a gamified learning platform deployed on top of Edu-Chain.

### Design 

LearningToken is an ERC20 token smart contract designed for a gamified learning platform. Users can earn tokens by completing educational milestones, incentivizing progress and engagement.

### Flowchart


## Flowchart

```plaintext
+-----------------------------+
|                             |
|        Set Milestone        |
|       (Platform Owner)      |
|                             |
+-------------+---------------+
              |
              v
+-------------+---------------+
|                             |
|   User Achieves Milestone   |
|      (Learner's Action)     |
|                             |
+-------------+---------------+
              |
              v
+-------------+---------------+
|                             |
|        Reward User          |
|      (Platform Owner)       |
|                             |
+-------------+---------------+
```

### Features

- **ERC20 Standard**: Fully compliant with the ERC20 token standard.
- **Milestone Tracking**: Allows the platform owner to track and manage user learning milestones.
- **Token Rewards**: Users earn LearningTokens (LTKN) for completing milestones.

### Prerequisites

- **Solidity ^0.8.19**
- **OpenZeppelin Contracts**

### Basic Usage (e.g. reference in JS)

1. **Set Milestones**:
    ```solidity
    learningToken.setMilestone(userAddress, milestone);
    ```

2. **Reward Users**:
    ```solidity
    learningToken.rewardUser(userAddress, milestone);
    ```
    
### Contract

- **Blockchain:** Edu-Chain
- **Contract Address:** 0x79b980dEfDeC2f0bcdE1abf142202c8Dee932f57

### Contact

**Name:** Debarchito Nath
**Email:** debarchito.nath.adtu@gmail.com

### License

This project is licensed under the MIT License.

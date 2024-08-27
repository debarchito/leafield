![Leafield](./assets/leafield.png)

> Leafield is a gamified learning platform deployed on top of Edu-Chain.

### Design 

LearningToken is an ERC20 token smart contract designed for a gamified learning platform. Users can earn tokens by completing educational milestones, incentivizing progress and engagement.

### Features

- **ERC20 Standard**: Fully compliant with the ERC20 token standard.
- **Milestone Tracking**: Allows the platform owner to track and manage user learning milestones.
- **Token Rewards**: Users earn LearningTokens (LTKN) for completing milestones.

### Prerequisites

- **Solidity ^0.8.19**
- **OpenZeppelin Contracts**

### Deployment

To deploy the `LearningToken` contract, follow these steps:

1. Clone the repository:
    ```bash
    git clone <repository-url>
    ```

2. Install dependencies:
    ```bash
    npm install
    ```

3. Compile the smart contract:
    ```bash
    npx hardhat compile
    ```

4. Deploy the contract to your preferred network:
    ```bash
    npx hardhat run scripts/deploy.js --network <network-name>
    ```

### Basic Usage

1. **Set Milestones**:
    ```solidity
    learningToken.setMilestone(userAddress, milestone);
    ```

2. **Reward Users**:
    ```solidity
    learningToken.rewardUser(userAddress, milestone);
    ```

### License

This project is licensed under the MIT License.

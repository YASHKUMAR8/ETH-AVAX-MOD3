// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// This is a simple ERC20-like token contract with additional functionality
contract TokenContract {
    // Token attributes
    string public firstName = "yash";
    string public lastName = "kumar";
    uint public supply = 10;

    // Address of the contract owner
    address public contractOwner;

    // Mapping to keep track of each address's balance
    mapping (address => uint) private _balances;

    // Mapping to keep track of allowances
    mapping (address => mapping (address => uint)) private _allowances;

    // Events to track important activities
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed from, uint256 amount);
    event TokenMetadataUpdated(string newFirstName, string newLastName, uint newSupply);

    // Constructor to initialize the owner of the contract
    constructor() {
        contractOwner = msg.sender;
    }

    // Modifier to restrict function access to the owner only
    modifier onlyContractOwner() {
        require(msg.sender == contractOwner, "Access restricted to the owner.");
        _;
    }

    // Function to mint new tokens
    function mint(address recipient, uint amount) public onlyContractOwner {
        require(amount > 0, "Mint amount must be positive.");
        supply += amount;
        _balances[recipient] += amount;

        emit Mint(recipient, amount);
    }

    // Function to burn existing tokens
    function burn(address account, uint amount) public onlyContractOwner {
        require(amount > 0, "Burn amount must be positive.");
        require(_balances[account] >= amount, "Insufficient balance to burn.");

        supply -= amount;
        _balances[account] -= amount;

        emit Burn(account, amount);
    }

    // Function to transfer tokens from sender to another address
    function transfer(address recipient, uint256 amount) public {
        require(recipient != address(0), "Invalid recipient address.");
        require(amount > 0, "Transfer amount must be positive.");
        require(_balances[msg.sender] >= amount, "Insufficient balance for transfer.");

        _balances[msg.sender] -= amount;
        _balances[recipient] += amount;

        emit Transfer(msg.sender, recipient, amount);
    }

    // Function to approve another address to spend tokens on your behalf
    function approve(address spender, uint256 amount) public returns (bool) {
        require(spender != address(0), "Invalid spender address.");

        _allowances[msg.sender][spender] = amount;

        emit Approval(msg.sender, spender, amount);
        return true;
    }

    // Function to check the allowance for a spender
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }

    // Function to transfer tokens from one address to another using allowance
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        require(sender != address(0), "Invalid sender address.");
        require(recipient != address(0), "Invalid recipient address.");
        require(amount > 0, "Transfer amount must be positive.");
        require(_balances[sender] >= amount, "Insufficient balance for transfer.");
        require(_allowances[sender][msg.sender] >= amount, "Transfer amount exceeds allowance.");

        _balances[sender] -= amount;
        _balances[recipient] += amount;
        _allowances[sender][msg.sender] -= amount;

        emit Transfer(sender, recipient, amount);
        return true;
    }

    // Function to get the balance of an address
    function balanceOf(address account) public view returns (uint) {
        return _balances[account];
    }

    // Function to update token metadata (only owner)
    function updateTokenMetadata(string memory newFirstName, string memory newLastName) public onlyContractOwner {
        firstName = newFirstName;
        lastName = newLastName;

        emit TokenMetadataUpdated(newFirstName, newLastName, supply);
    }
}

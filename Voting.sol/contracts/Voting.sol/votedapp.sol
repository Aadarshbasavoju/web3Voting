//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract Voting {

    struct Option {
        string name;
        uint256 voteCount;
    }


    Option[] public options;


    mapping(address => bool) public voters;

    function addOption(string memory _name) public {
        require(bytes(_name).length > 0, "Option name cannot be empty");
        options.push(Option(_name, 0));
    }

    function vote(uint256 _optionIndex) public {
        require(_optionIndex < options.length, "Invalid option index");
        require(!voters[msg.sender], "Already voted");

        options[_optionIndex].voteCount++;
        voters[msg.sender] = true;
    }

    function getOptionCount() public view returns (uint256) {
        return options.length;
    }


    function getOption(uint256 _index) public view returns (string memory, uint256) {
        require(_index < options.length, "Invalid option index");

        Option memory option = options[_index];
        return (option.name, option.voteCount);
    }
}

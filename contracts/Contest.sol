pragma solidity 0.5.16;

contract Contest {
	struct Contestant{
		uint id;
		string name;
		uint voteCount;
	}
//mapping to fetch contestant details
	mapping(uint => Contestant) public contestants;
//mapping to save list of accounts who already casted vote.
    mapping(address => bool) public voters;
    //add a variable to keep track ofcontestant count.
	uint public contestantsCount;

    event votedEvent(
    	uint indexed_contestantId
    );

	constructor () public{
		addContestant("Tom");
		addContestant("Jerry");
	}
	function addContestant (string memory _name) private {
		contestantsCount++;
		contestants[contestantsCount] = Contestant(contestantsCount, _name, 0);
	}
	function vote (uint _contestantId) public {
		require(!voters[msg.sender]);
		require(_contestantId > 0 && _contestantId<=contestantsCount);


		contestants[_contestantId].voteCount++;
		voters[msg.sender] = true;
		emit votedEvent(_contestantId);


	}
}
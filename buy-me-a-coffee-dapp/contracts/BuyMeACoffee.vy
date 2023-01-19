# @version ^0.3.0

event NewMemo:
    deposit_address: address
    deposit_time: uint256
    name: String[64]
    message: String[100]

struct Memo:
    deposit_address: address
    deposit_time: uint256
    name: String[64]
    message: String[100]

owner: address
memos: DynArray[Memo, 100]

@external
def __init__():
    self.owner = msg.sender
    self.memos = []

@view
@external
def getMemos() -> DynArray[Memo, 100]:
    '''
    @notice Getter function for fetching all stored memos in contract
    @dev fetch array of memos
    @return Array of memos
    '''
    return self.memos

@payable
@external
def buyCoffee(_name: String[64], _message: String[100]):
    '''
    @notice Contract function to buy a coffe (Donate ETH to developer)
    @dev function to deposit ETH to contract
    @param _name Name of the person buying a coffee to dev
    @param _message Message of the person buying a coffe to dev
    '''
    # Must accept more than 0 ETH for a coffee.
    assert msg.value > 0, "Insufficient balance"
    # Adding memo to contract storage
    self.memos.append(Memo({deposit_address: msg.sender, deposit_time: block.timestamp, name: _name, message: _message}))
    # Emit a NewMemo event with details about the memo.
    log NewMemo(msg.sender, block.timestamp, _name, _message)

@external
def withdrawTips():
    '''
    @notice Contract function to withdraw funds from contract to owner's address.
    @dev withdraw funds from contract to owner's address.
    '''
    assert msg.sender == self.owner, "Not owner of Contract"
    send(msg.sender, self.balance)

#!/usr/bin/python3

import brownie


def test_buy_coffee(accounts, token):
    token.buyCoffee("user1", "thanks for the great work champ!", {'from': accounts[2], 'value': "1 ether"})
    assert token.balance() == "1 ether"


def test_buy_coffee_insufficient_funds(accounts, token):
    with brownie.reverts():
        token.buyCoffee("user1", "thanks for the great work champ!", {'from': accounts[2]})


def test_withdraw_tips(accounts, token):
    initial_account_balance = accounts[0].balance()
    token.buyCoffee("user1", "thanks for the great work champ!", {'from': accounts[2], 'value': "1 ether"})
    token.withdrawTips({'from': accounts[0]})
    assert accounts[0].balance() == (initial_account_balance + "1 ether")


def test_withdraw_tips_not_owner(accounts, token):
    token.buyCoffee("user1", "thanks for the great work champ!", {'from': accounts[2], 'value': "1 ether"})
    with brownie.reverts():
        token.withdrawTips({'from': accounts[1]})


def test_get_memos(accounts, token):
    token.buyCoffee("user1", "thanks for the great work champ!", {'from': accounts[1], 'value': "1 ether"})
    token.buyCoffee("user2", "thanks for the great work champ!", {'from': accounts[2], 'value': "1 ether"})
    token.buyCoffee("user3", "thanks for the great work champ!", {'from': accounts[3], 'value': "1 ether"})
    memos = token.getMemos()
    assert len(memos) == 3

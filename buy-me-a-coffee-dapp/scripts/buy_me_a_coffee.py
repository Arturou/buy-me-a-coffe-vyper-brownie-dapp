#!/usr/bin/python3

from brownie import BuyMeACoffee, accounts


def main():
    return BuyMeACoffee.deploy({'from': accounts[0]})

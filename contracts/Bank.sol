pragma solidity ^0.4.4;
pragma experimental ABIEncoderV2;

contract Bank {

    constructor() public payable {}
    struct BankAccount {
        string id;
        string name;
        string accountNumber;
        string bankName;
        string bvn;
        string fingerprint;
        string imageUrl;
        string phoneNumber;
        uint balance;
    }

    struct Payment {
        string id;
        string name;
        string phoneNumber;
        string shopName;
        string accountId;
        uint timestamp;
        uint amount;
    }

    mapping (string => BankAccount) private accounts;
    string[] public bankAccounts;

    function createNewBankAccount(string _id, string _name, string _accountNumber, string _bankName,
        string _bvn, string _fingerprint, string _imageUrl, string _phoneNumber, uint _balance) public {

        BankAccount storage account = accounts[_id];

        account.id = _id;
        account.name = _name;
        account.balance = _balance;
        account.accountNumber = _accountNumber;
        account.bankName = _bankName;
        account.fingerprint = _fingerprint;
        account.imageUrl = _imageUrl;
        account.phoneNumber = _phoneNumber;

        account.bvn = _bvn;

        bankAccounts.push(_id) -1;
    }

    function getAllAccountAddresses() view public returns(string[]) {
        return bankAccounts;
    }

    function getAccountDetail(string _id) view public returns (string, string, string, string, string, string, string, uint) {
        BankAccount storage account = accounts[_id];
        return (
        account.id,
        account.name,
        account.accountNumber,
        account.bankName,
        account.bvn,
        account.imageUrl,
        account.phoneNumber,
        account.balance);
    }

    mapping (string => Payment) private payments;
    string[] public allPayments;

    function createNewPayment(string _id, string _name, string _phoneNumber, string _shopName, string _accountId, uint _timestamp, uint _amount) public {
        Payment storage payment = payments[_id];
        payment.id = _id;
        payment.name = _name;
        payment.phoneNumber = _phoneNumber;
        payment.shopName = _shopName;
        payment.accountId = _accountId;
        payment.timestamp = _timestamp;
        payment.amount = _amount;

//        Remove from the balance
        allPayments.push(_id) -1;
        BankAccount storage account = accounts[_accountId];
        account.balance = account.balance - _amount;
    }

    function getAllPaymentAddresses() view public returns(string[]) {
        return allPayments;
    }

    function getPaymentDetail(string _id) view public returns (string, string, string, string, string, uint, uint) {
        Payment storage payment = payments[_id];
        return (
        payment.id,
        payment.name,
        payment.phoneNumber,
        payment.shopName,
        payment.accountId,
        payment.timestamp,
        payment.amount);
    }


}

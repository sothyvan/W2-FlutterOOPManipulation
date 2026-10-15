class BankAccount {
    // TODO
    final int accountId;
    final String owner;
    double _balance = 0;

    BankAccount(this.accountId, this.owner);

    double get balance => _balance;

    void withdraw(double amount){
      if(amount <= 0) throw ArgumentError('Amount must be greater than 0!');
      if(amount > _balance) throw Exception('Insufficient Balance for Withdrawal!');
      _balance -= amount;
    }

    void credit(double amount){
      if(amount <= 0) throw ArgumentError('Amount must be greater than 0!');
      _balance += amount;
    }
}

class Bank {
    // TODO
    final String name;
    final List<BankAccount> _accounts = [];

    Bank({required this.name});

    BankAccount createAccount(int accountId, String owner){
      if (_accounts.any((a) => a.accountId == accountId)) throw Exception('Account with ID $accountId already exists!');

      final account = BankAccount(accountId, owner);
      _accounts.add(account);
      return account;
    }
}

void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}

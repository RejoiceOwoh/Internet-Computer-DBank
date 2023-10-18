import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor DBank {
  var currentValue: Nat = 300;
  // currentValue := 100;

  let id = 23423423423; 
  Debug.print(debug_show(id));

  public func topUp(amount: Nat) {
      currentValue += amount;
      Debug.print(debug_show(currentValue));
  };

  // Allow users to withdraw an amount from the currentValue
  // Decrease the currentValue by the amount

  public func withdraw(amount: Nat) {
    let tempValue: Int = currentValue - amount;
    if (tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Hi! You don't have up to that in your account yet")
    }
  };

  public query func checkBalance(): async Nat {
    return currentValue;
  };


}
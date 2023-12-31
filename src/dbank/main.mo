import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Int "mo:base/Int";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 100;
  Debug.print(debug_show(currentValue));
  // You are Yahweh, Miracle Working God. You never lost the battle, Akogu Loji Ja

  stable var startTime = Time.now();

  Debug.print(debug_show(startTime));

  let id = 23423423423; 
  Debug.print(debug_show(id));

  public func topUp(amount: Float) {
      currentValue += amount;
      Debug.print(debug_show(currentValue));
  };

  // Allow users to withdraw an amount from the currentValue
  // Decrease the currentValue by the amount

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("Hi! You don't have up to that in your account yet")
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }

}


import { dbank } from "../../declarations/dbank"

window.addEventListener("load", async function () {
  // console.log("Finished Loading");
  const currentAmount = await dbank.checkBalance();
  this.document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
});

document.querySelector("form").addEventListener("submit", async function(event){
  event.preventDefault();
  // console.log("Submitted");

  const button = event.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);

  await dbank.topUp(inputAmount);

  const currentAmount = await dbank.checkBalance();
  this.document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;

  document.getElementById("input-amount").value = "";
  button.removeAttribut("disabled");
})
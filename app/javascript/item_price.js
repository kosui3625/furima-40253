const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const addTaxDom = document.getElementById("add-tax-price");
  const price = parseInt(priceInput.value);
  const commission = price * 0.1;
  addTaxDom.innerHTML = commission.toFixed(0);
});
priceInput.addEventListener("input", () => {
  const addTaxDom = document.getElementById("profit");
  const price = parseInt(priceInput.value);
  const commission = price * 0.9;
  addTaxDom.innerHTML = commission.toFixed(0);
});
const item_price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("add-tax-price");
    const price = parseInt(priceInput.value);
    const commission = Math.floor(price * 0.1);
    addTaxDom.innerHTML = commission.toFixed(0);
  });
  priceInput.addEventListener("input", () => {
    const addTaxDom = document.getElementById("profit");
    const price = parseInt(priceInput.value);
    const commission = Math.floor(price * 0.9);
    addTaxDom.innerHTML = commission.toFixed(0);
  });
};

window.addEventListener("turbo:load", item_price);
window.addEventListener("turbo:render", item_price);
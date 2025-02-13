const price = () => {
  const Price = document.getElementById("price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit");

  if (Price && addTaxPrice && profitDisplay) {
  const updatePrices = () => {
    const priceValue = parseFloat(Price.value) || 0;
    const fee = Math.floor(priceValue * 0.1);
    const profit = priceValue - fee; 
  
    addTaxPrice.textContent = fee; 
    profitDisplay.textContent = profit;
  };

  Price.addEventListener("input", updatePrices);
  updatePrices(); 
  }
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
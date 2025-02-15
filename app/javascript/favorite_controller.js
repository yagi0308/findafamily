import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  toggle(event) {
    event.preventDefault();
    const button = event.currentTarget;
    const url = button.href;
    const method = button.dataset.method || "POST";

    fetch(url, { 
      method: method,
      headers: { "X-Requested-With": "XMLHttpRequest" }
    }).then(response => {
      if (response.ok) {
        button.classList.toggle("active");
        button.textContent = button.classList.contains("active") ? "お気に入り済み" : "お気に入りする";
      }
    }).catch(error => {
      console.error('Error:', error);
    });
  }
}
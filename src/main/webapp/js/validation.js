// Obtenim referències als elements del formulari
const form = document.getElementById('registerForm');
const password = document.getElementById('password');
const confirmPassword = document.getElementById('confirmPassword');

/**
 * Validació de coincidència de contrasenyes en temps real.
 * Utilitzem l'esdeveniment 'input' perquè es comprovi cada vegada que l'usuari escriu.
 */
confirmPassword.addEventListener('input', () => {
  // setCustomValidity("") marca el camp com a vàlid.
  // Si hi ha un text, el marca com a invàlid i el navegador bloqueja l'enviament.
  confirmPassword.setCustomValidity(
    confirmPassword.value !== password.value ? "Les contrasenyes no coincideixen." : ""
  );
});

/**
 * Gestió d'errors provinents del servidor.
 * serverErrors és un objecte injectat des del JSP (via script tag).
 */
Object.entries(serverErrors).forEach(([field, message]) => {
  const input = document.getElementsByName(field)[0];
  if (input) {
    // Apliquem l'error del servidor al camp corresponent usant l'API de HTML5.
    input.setCustomValidity(message);
    
    // Mostrem la bafarada d'error immediatament.
    input.reportValidity();
    
    // Escoltador per "netejar" l'error tan bon punt l'usuari modifiqui el camp.
    input.addEventListener('input', () => input.setCustomValidity(''), { once: true });
  }
});

/**
 * Validació final abans d'enviar el formulari.
 * Tot i que el navegador ho fa per defecte, reportValidity() assegura 
 * un feedback visual si alguna validació JS personalitzada falla.
 */
form.addEventListener('submit', event => {
  if (!form.checkValidity()) {
    // Si el formulari no és vàlid, impedim l'enviament.
    event.preventDefault();
    form.reportValidity();
  }
});

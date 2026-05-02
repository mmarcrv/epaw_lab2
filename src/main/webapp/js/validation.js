// Obtenim referències als elements del formulari
const form = document.getElementById('registerForm');
const password = document.getElementById('password');
const confirmPassword = document.getElementById('confirmPassword');
const dateOfBirth = document.getElementById('dateOfBirth');
const email = document.getElementById('email');
const firstName = document.getElementById('firstName');
const lastName = document.getElementById('lastName');
const comarca = document.getElementById('comarca');

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
 * Validació de data de naixement.
 * Comprova que la data no sia en el futur.
 */
dateOfBirth.addEventListener('change', () => {
  if (dateOfBirth.value) {
    const birthDate = new Date(dateOfBirth.value);
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    
    if (birthDate > today) {
      dateOfBirth.setCustomValidity("La data de naixement no pot ser en el futur.");
    } else {
      dateOfBirth.setCustomValidity("");
    }
  }
});

/**
 * Validació de format de correu electrònic.
 * Afegim una validació extra a més de type="email".
 */
email.addEventListener('input', () => {
  const emailRegex = /^[A-Za-z0-9+_.-]+@(.+)$/;
  if (email.value && !emailRegex.test(email.value)) {
    email.setCustomValidity("Format de correu electrònic inválid.");
  } else {
    email.setCustomValidity("");
  }
});

/**
 * Validació de nombres (únicament lletres i espais).
 */
function validateNameField(field) {
  field.addEventListener('input', () => {
    const value = field.value;
    if (value && /[^a-zA-ZàáäâèéëêìíïîòóöôùúüûñçÀÁÄÂÈÉËÊÌÍÏÎÒÓÖÔÙÚÜÛÑÇ\s'-]/.test(value)) {
      field.setCustomValidity("El nom només pot contenir lletres, espais, apòstrofs i guions.");
    } else {
      field.setCustomValidity("");
    }
  });
}

validateNameField(firstName);
validateNameField(lastName);

/**
 * Validació de comarca.
 * Comprova que s'ha seleccionat una opció vàlida.
 */
comarca.addEventListener('change', () => {
  if (!comarca.value) {
    comarca.setCustomValidity("Si us plau, selecciona una comarca.");
  } else {
    comarca.setCustomValidity("");
  }
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

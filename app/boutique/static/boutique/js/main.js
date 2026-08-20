/**
 * Je gère ce qu'il se passe après que les données de la page ( html etc ) ont été chargés.
 */
window.onload = postLoadingHandler;

function checkFormat(data, type) {
  const passwordPattern =
    /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$*%?@!^&()]).{12,}$/;
  const emailPattern = /^[a-zA-Z0-9_.]{5,}@[a-zA-Z0-9]{2,10}\.[a-z]{2,5}$/;

  switch (type) {
    case "password":
      return new RegExp(passwordPattern).test(data);
    case "email":
      return new RegExp(emailPattern).test(data);
    default:
      return false;
  }
}

/**
 * Une fonction remplit une mission / elle a une RESPONSABILITE
 * Ici celle-ci doit gérer ce qui se passe après l'événement de chargement de la page
 * (on load)
 */
function postLoadingHandler() {
  const form = document.getElementById("login-form");
  const emailInput = document.getElementById("email");
  const passwordInput = document.getElementById("password");

  form.addEventListener("submit", (e) => submitHandler(e));

  function submitHandler(e) {
    e.preventDefault();

    if (!emailInput.value || !passwordInput.value) {
      window.alert("email must be valid | password must be valid");
    }
    const isEmailValid = checkFormat(emailInput.value, "email");
    if (!isEmailValid) {
      console.log("Email not valid");
      return;
    }

    const isPasswordValid = checkFormat(passwordInput.value, "password");
    if (!isPasswordValid) {
      console.log("Password not valid");
      return;
    }
  }
}

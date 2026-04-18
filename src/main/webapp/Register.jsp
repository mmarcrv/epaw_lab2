<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="ca">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="css/style.css">
    <title>Registre d'Usuari (Manual)</title>
</head>

<body>

    <div class="main-container">
        <div class="w3-card-4 w3-white">
            <div class="w3-container w3-teal">
                <h2>Registre (Validació Manual)</h2>
            </div>

            <form id="registerForm" action="Register" method="POST" class="w3-container w3-padding-24">

                <p>
                    <label class="w3-text-grey">Nom d'usuari</label>
                    <input class="w3-input w3-border" type="text" id="name" name="name" required minlength="5"
                        value="${user.name}" title="L'usuari ha de tenir entre 5 i 20 caràcters." />
                </p>

                <p>
                    <label class="w3-text-grey">Contrasenya</label>
                    <input class="w3-input w3-border" type="password" id="password" name="password" required
                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$" value="${user.password}"
                        title="Mínim 8 caràcters, incloent majúscules, números i un caràcter especial (@#$%^&*)." />
                </p>

                <p>
                    <label class="w3-text-grey">Repetir contrasenya</label>
                    <input class="w3-input w3-border" type="password" id="confirmPassword"
                        name="confirmPassword" required value="${user.password}"
                        title="Les contrasenyes han de coincidir" />
                </p>

                <button type="submit" class="w3-button w3-teal w3-block w3-section w3-padding">Enviar Registre</button>

            </form>
        </div>
    </div>

    <script>
        // Injectem els errors del servidor (Format Map K/V) per al JS
        const serverErrors = {
            <c:forEach var="error" items="${errors}">
                "${error.key}": "${error.value}",
            </c:forEach>
        };
    </script>
    <script src="js/validation.js"></script>

</body>

</html>
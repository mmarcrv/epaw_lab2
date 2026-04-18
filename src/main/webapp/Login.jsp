<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ca">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/style.css">
<title>Entrada d'Usuari</title>
</head>
<body>

<div class="main-container">
    <div class="w3-card-4 w3-white">
        <div class="w3-container w3-green">
            <h2>Entrada Correcta</h2>
        </div>

        <div class="w3-container w3-padding-24">
            <p class="w3-text-dark w3-large">
                L'usuari <strong>${user.name}</strong> ha estat registrat correctament.
            </p>
            <p class="w3-text-grey">Ja pots iniciar sessió amb les teves credencials.</p>
        </div>
    </div>
</div>

</body>
</html>
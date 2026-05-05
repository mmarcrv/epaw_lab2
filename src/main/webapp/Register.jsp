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
                    <label class="w3-text-grey">Nom</label>
                    <input class="w3-input w3-border" type="text" id="firstName" name="firstName" required minlength="2" maxlength="50"
                        value="${user.firstName}" title="El nom ha de tenir entre 2 i 50 caràcters." />
                </p>

                <p>
                    <label class="w3-text-grey">Cognoms</label>
                    <input class="w3-input w3-border" type="text" id="lastName" name="lastName" required minlength="2" maxlength="50"
                        value="${user.lastName}" title="Els cognoms han de tenir entre 2 i 50 caràcters." />
                </p>

                <p>
                    <label class="w3-text-grey">Data de naixement</label>
                    <input class="w3-input w3-border" type="date" id="dateOfBirth" name="dateOfBirth" required
                        value="${user.dateOfBirth}" title="Si us plau, introduïu una data válida." />
                </p>

                <p>
                    <label class="w3-text-grey">Comarca d'origen</label>
                    <select class="w3-input w3-border" id="comarca" name="comarca" required>
                        <option value="">-- Selecciona una comarca --</option>
                        <option value="Alt Camp" ${user.comarca == 'Alt Camp' ? 'selected' : ''}>Alt Camp</option>
                        <option value="Alt Empordà" ${user.comarca == 'Alt Empordà' ? 'selected' : ''}>Alt Empordà</option>
                        <option value="Alt Penedès" ${user.comarca == 'Alt Penedès' ? 'selected' : ''}>Alt Penedès</option>
                        <option value="Anoia" ${user.comarca == 'Anoia' ? 'selected' : ''}>Anoia</option>
                        <option value="Bages" ${user.comarca == 'Bages' ? 'selected' : ''}>Bages</option>
                        <option value="Baix Camp" ${user.comarca == 'Baix Camp' ? 'selected' : ''}>Baix Camp</option>
                        <option value="Baix Ebre" ${user.comarca == 'Baix Ebre' ? 'selected' : ''}>Baix Ebre</option>
                        <option value="Baix Llobregat" ${user.comarca == 'Baix Llobregat' ? 'selected' : ''}>Baix Llobregat</option>
                        <option value="Baix Penedès" ${user.comarca == 'Baix Penedès' ? 'selected' : ''}>Baix Penedès</option>
                        <option value="Barcelona" ${user.comarca == 'Barcelona' ? 'selected' : ''}>Barcelona</option>
                        <option value="Berguedà" ${user.comarca == 'Berguedà' ? 'selected' : ''}>Berguedà</option>
                        <option value="Cerdanya" ${user.comarca == 'Cerdanya' ? 'selected' : ''}>Cerdanya</option>
                        <option value="Conca de Barberà" ${user.comarca == 'Conca de Barberà' ? 'selected' : ''}>Conca de Barberà</option>
                        <option value="Garraf" ${user.comarca == 'Garraf' ? 'selected' : ''}>Garraf</option>
                        <option value="Garrigues" ${user.comarca == 'Garrigues' ? 'selected' : ''}>Garrigues</option>
                        <option value="Garrotxa" ${user.comarca == 'Garrotxa' ? 'selected' : ''}>Garrotxa</option>
                        <option value="Gironès" ${user.comarca == 'Gironès' ? 'selected' : ''}>Gironès</option>
                        <option value="Maresme" ${user.comarca == 'Maresme' ? 'selected' : ''}>Maresme</option>
                        <option value="Montsià" ${user.comarca == 'Montsià' ? 'selected' : ''}>Montsià</option>
                        <option value="Noguera" ${user.comarca == 'Noguera' ? 'selected' : ''}>Noguera</option>
                        <option value="Osona" ${user.comarca == 'Osona' ? 'selected' : ''}>Osona</option>
                        <option value="Pallars Jussà" ${user.comarca == 'Pallars Jussà' ? 'selected' : ''}>Pallars Jussà</option>
                        <option value="Pallars Sobirà" ${user.comarca == 'Pallars Sobirà' ? 'selected' : ''}>Pallars Sobirà</option>
                        <option value="Pla d'Urgell" ${user.comarca == 'Pla d\'Urgell' ? 'selected' : ''}>Pla d'Urgell</option>
                        <option value="Pla de l'Estany" ${user.comarca == 'Pla de l\'Estany' ? 'selected' : ''}>Pla de l'Estany</option>
                        <option value="Priorat" ${user.comarca == 'Priorat' ? 'selected' : ''}>Priorat</option>
                        <option value="Ribera d'Ebre" ${user.comarca == 'Ribera d\'Ebre' ? 'selected' : ''}>Ribera d'Ebre</option>
                        <option value="Ripollès" ${user.comarca == 'Ripollès' ? 'selected' : ''}>Ripollès</option>
                        <option value="Segarra" ${user.comarca == 'Segarra' ? 'selected' : ''}>Segarra</option>
                        <option value="Segrià" ${user.comarca == 'Segrià' ? 'selected' : ''}>Segrià</option>
                        <option value="Selva" ${user.comarca == 'Selva' ? 'selected' : ''}>Selva</option>
                        <option value="Solsonès" ${user.comarca == 'Solsonès' ? 'selected' : ''}>Solsonès</option>
                        <option value="Tarragonès" ${user.comarca == 'Tarragonès' ? 'selected' : ''}>Tarragonès</option>
                        <option value="Terra Alta" ${user.comarca == 'Terra Alta' ? 'selected' : ''}>Terra Alta</option>
                        <option value="Urgell" ${user.comarca == 'Urgell' ? 'selected' : ''}>Urgell</option>
                        <option value="Vallès Occidental" ${user.comarca == 'Vallès Occidental' ? 'selected' : ''}>Vallès Occidental</option>
                        <option value="Vallès Oriental" ${user.comarca == 'Vallès Oriental' ? 'selected' : ''}>Vallès Oriental</option>
                    </select>
                </p>

                <p>
                    <label class="w3-text-grey">Correu electrònic</label>
                    <input class="w3-input w3-border" type="email" id="email" name="email" required
                        value="${user.email}" title="Introduïu un correu electrònic vàlid." />
                </p>

                <p>
                    <label class="w3-text-grey">Nom d'usuari</label>
                    <input class="w3-input w3-border" type="text" id="name" name="name" required minlength="5" maxlength="20"
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
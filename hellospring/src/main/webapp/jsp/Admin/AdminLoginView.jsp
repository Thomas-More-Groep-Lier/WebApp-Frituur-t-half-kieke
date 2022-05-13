
<jsp:include page="../partials/head.jsp"/>

<body>

<div class="container-fluid">
    <div class="row d-flex justify-content-center">
        <div class="col-4 border border-2 p-3 rounded" style="position: absolute; top: 50%; margin-top: -15%">
            <div class="row d-flex justify-content-center">
                <img src="/images/u101.png" alt="logo frituur t'half kieke" class="img my-5"
                     style="width: 100px; display: block; margin-left: auto; margin-right: auto;"/>
            </div>

            <form th:action="@{/login}" method="post" id="loginForm">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" aria-describedby="usernameHelp">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="submit" class="btn btn-danger float-end" value="Log In"/>
            </form>
            <div th:if="${param.error}">
                Ongeldige gebruikersnaam en/of wachtwoord.</div>
            <div th:if="${param.logout}">
                U bent uitgelogd.</div>
        </div>
    </div>

</div>
<jsp:include page="../partials/footer.jsp"/>
</body>
</html>


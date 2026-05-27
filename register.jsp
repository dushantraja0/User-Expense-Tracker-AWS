<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
</head>
<body>

<div class="container">
    <h2>Create Account</h2>

    <p class="error">${error}</p>

    <form action="register" method="post">
        <input type="text" name="name" placeholder="Enter name" required>
        <input type="email" name="email" placeholder="Enter email" required>
        <input type="password" name="password" placeholder="Enter password" required>

        <button type="submit">Register</button>
    </form>

    <p>Already have an account?</p>
    <a href="login.jsp">Login</a>
</div>

</body>
</html>
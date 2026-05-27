<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login & Signup</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</head>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #f8fafc;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #1e293b;
    }

    .container {
        display: flex;
        background: white;
        border-radius: 24px;
        box-shadow: 0 25px 50px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        max-width: 1000px;
        width: 90%;
        min-height: 600px;
    }

    .form-section {
        flex: 1;
        padding: 60px 50px;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .image-section {
        flex: 1;
        background: #0f172a;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        text-align: center;
        position: relative;
    }

    .image-section::before {
        content: "";
        position: absolute;
        inset: 0;
        background-image:
                linear-gradient(rgba(255,255,255,0.05) 1px, transparent 1px),
                linear-gradient(90deg, rgba(255,255,255,0.05) 1px, transparent 1px);
        background-size: 50px 50px;
    }

    .image-content {
        z-index: 1;
        padding: 40px;
    }

    .image-content h2 {
        font-size: 2.5rem;
        margin-bottom: 20px;
    }

    .image-content p {
        font-size: 1.1rem;
        color: #cbd5e1;
        line-height: 1.6;
    }

    .form-title {
        font-size: 2.5rem;
        font-weight: bold;
        margin-bottom: 10px;
        color: #0f172a;
        text-align: center;
    }

    .form-subtitle {
        color: #64748b;
        text-align: center;
        margin-bottom: 35px;
    }

    .form-container {
        display: none;
    }

    .form-container.active {
        display: block;
    }

    .form-group {
        position: relative;
        margin-bottom: 22px;
    }

    .form-group i {
        position: absolute;
        left: 16px;
        top: 50%;
        transform: translateY(-50%);
        color: #94a3b8;
    }

    .form-control {
        width: 100%;
        padding: 16px 20px 16px 48px;
        border: 2px solid #e2e8f0;
        border-radius: 12px;
        font-size: 1rem;
        outline: none;
        text-align: left !important;
    }

    .form-control:focus {
        border-color: #3b82f6;
        box-shadow: 0 0 0 4px rgba(59,130,246,0.1);
    }

    .btn-primary {
        width: 100%;
        background: #3b82f6;
        color: white;
        padding: 16px;
        border: none;
        border-radius: 12px;
        font-size: 1rem;
        font-weight: bold;
        cursor: pointer;
        margin-top: 10px;
    }

    .btn-primary:hover {
        background: #2563eb;
    }

    .forgot-password {
        text-align: right;
        margin-bottom: 12px;
    }

    .forgot-password a,
    .form-switch a {
        color: #3b82f6;
        text-decoration: none;
        font-weight: bold;
    }

    .form-switch {
        text-align: center;
        margin-top: 30px;
        color: #64748b;
    }

    .social-login {
        margin-top: 30px;
    }

    .social-title {
        text-align: center;
        color: #64748b;
        margin-bottom: 18px;
    }

    .social-buttons {
        display: flex;
        gap: 12px;
    }

    .social-btn {
        flex: 1;
        padding: 14px;
        border: 2px solid #e2e8f0;
        border-radius: 12px;
        text-align: center;
        font-size: 1.2rem;
        transition: all 0.3s ease;
    }
    .social-btn:hover {
        transform: translateY(-4px) scale(1.05);
        box-shadow: 0 8px 18px rgba(0,0,0,0.1);
    }

    .social-btn i {
        transition: transform 0.3s ease;
    }

    .social-btn:hover i {
        transform: scale(1.4);
    }


    .google { color: #ea4335; }
    .facebook { color: #1877f2; }
    .twitter { color: #1da1f2; }

    .error {
        color: red;
        text-align: center;
        margin-bottom: 15px;
        font-weight: bold;
    }

    .checkbox-group {
        display: flex;
        gap: 10px;
        font-size: 0.9rem;
        color: #64748b;
        margin-bottom: 20px;
    }

    @media (max-width: 768px) {
        .container {
            flex-direction: column;
        }

        .image-section {
            min-height: 200px;
        }
    }
    .floating-shapes {
        position: absolute;
        width: 100%;
        height: 100%;
        overflow: hidden;
        pointer-events: none;
    }

    .floating-shapes::before,
    .floating-shapes::after {
        content: '';
        position: absolute;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.1);
        animation: float 6s ease-in-out infinite;
    }

    .floating-shapes::before {
        width: 120px;
        height: 120px;
        top: 20%;
        left: 10%;
        animation-delay: 0s;
    }

    .floating-shapes::after {
        width: 80px;
        height: 80px;
        bottom: 20%;
        right: 20%;
        animation-delay: 3s;
    }

    @keyframes float {
        0%, 100% {
            transform: translateY(0px);
        }
        50% {
            transform: translateY(-20px);
        }
    }
    .form-control.success {
        border-color: #10b981;
        background-color: #ecfdf5;
    }

    .form-control.error {
        border-color: #ef4444;
        background-color: #fef2f2;
        color: #1e293b;
        font-weight: 500;
    }

    .popup-message {
        position: fixed;
        top: 20px;
        right: 20px;
        background: #10b981;
        color: white;
        padding: 18px 28px;
        border-radius: 14px;
        font-size: 1.1rem;
        font-weight: 700;
        box-shadow: 0 10px 25px rgba(16, 185, 129, 0.3);
        z-index: 9999;
    }
    .loading-icon {
        display: none;
        animation: spin 1s linear infinite;
    }

    .loading-icon.show {
        display: inline-block;
    }

    @keyframes spin {
        from { transform: rotate(0deg); }
        to { transform: rotate(360deg); }
    }

</style>
<body>

<div class="container">

    <div class="form-section">

        <p class="error" id="serverError">${error}</p>

        <!-- LOGIN FORM -->
        <div class="form-container active" id="loginForm">
            <h1 class="form-title">Welcome Back</h1>
            <p class="form-subtitle">Sign in to your account to continue your journey</p>

            <form action="login" method="post">
                <div class="form-group">
                    <input type="email" name="email" class="form-control" placeholder="Email Address" required>
                    <i class="fas fa-envelope"></i>
                </div>

                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Password" required>
                    <i class="fas fa-lock"></i>
                </div>

                <div class="forgot-password">
                    <a href="#" onclick="showForgotPassword()">Forgot Password?</a>
                </div>

                <button type="submit" class="btn-primary">Sign In</button>
            </form>

            <div class="social-login">
                <div class="social-title">Or continue with</div>
                <div class="social-buttons">
                    <div class="social-btn google" onclick="socialLogin('google')">
                        <i class="fab fa-google"></i>
                    </div>

                    <div class="social-btn facebook" onclick="socialLogin('facebook')">
                        <i class="fab fa-facebook-f"></i>
                    </div>

                    <div class="social-btn twitter" onclick="socialLogin('twitter')">
                        <i class="fab fa-twitter"></i>
                    </div>
                </div>
            </div>

            <div class="form-switch">
                Don't have an account?
                <a href="#" onclick="showSignup()">Create one</a>
            </div>
        </div>

        <div class="form-container" id="forgotForm">
            <h1 class="form-title">Reset Password</h1>
            <p class="form-subtitle">
                Enter your email address and we'll send you instructions to reset your password
            </p>

            <form onsubmit="return handleForgotPassword()">
                <div class="form-group">
                    <input type="email" id="forgotEmail" class="form-control" placeholder="Email Address" required>
                    <i class="fas fa-envelope"></i>
                </div>

                <button type="submit" class="btn-primary" id="resetBtn">
                    <i class="fas fa-spinner loading-icon"></i>
                    <span id="resetBtnText">Send Reset Instructions</span>
                </button>
            </form>

            <div class="form-switch">
                Remember your password?
                <a href="#" onclick="showLogin()">Sign in</a>
            </div>
        </div>

        <!-- SIGNUP FORM -->
        <div class="form-container" id="signupForm">
            <h1 class="form-title">Create Account</h1>
            <p class="form-subtitle">Join thousands of users and start your journey today</p>

            <form action="register" method="post" onsubmit="return validateSignupForm()" novalidate>                <div class="form-group">
                    <input type="text" name="name" class="form-control" placeholder="Full Name" required>
                    <i class="fas fa-user"></i>
                </div>

                <div class="form-group">
                    <input type="email" name="email" class="form-control" placeholder="Email Address" required>
                    <i class="fas fa-envelope"></i>
                </div>

                <div class="form-group">
                    <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>
                    <i class="fas fa-lock"></i>
                </div>

                <div class="form-group">
                    <input type="password" id="confirmPassword" class="form-control" placeholder="Confirm Password" required>
                    <i class="fas fa-lock"></i>
                </div>

                <div class="checkbox-group">
                    <input type="checkbox" required>
                    <label>I agree to the Terms of Service and Privacy Policy</label>
                </div>

                <button type="submit" class="btn-primary">Create Account</button>
            </form>

            <div class="form-switch">
                Already have an account?
                <a href="#" onclick="showLogin()">Sign in</a>
            </div>
        </div>

    </div>

    <div class="image-section">

        <!-- ADD THIS LINE -->
        <div class="floating-shapes"></div>

        <div class="image-content" id="imageContent">
            <h2>Hello, Friend!</h2>
            <p>Enter your personal details and start your journey with us today</p>
        </div>

    </div>

</div>

<script>
    function showSignup() {
        document.getElementById("loginForm").classList.remove("active");
        document.getElementById("signupForm").classList.add("active");
        document.getElementById("forgotForm").classList.remove("active");
        document.getElementById("imageContent").innerHTML = `
            <h2>Welcome Back!</h2>
            <p>To keep connected with us please login with your personal information</p>
        `;
    }

    function showLogin() {
        document.getElementById("signupForm").classList.remove("active");
        document.getElementById("loginForm").classList.add("active");
        document.getElementById("forgotForm").classList.remove("active");
        document.getElementById("imageContent").innerHTML = `
            <h2>Hello, Friend!</h2>
            <p>Enter your personal details and start your journey with us today</p>
        `;
    }

    function showPopup(message) {
        const popup = document.createElement("div");
        popup.className = "popup-message";
        popup.innerText = message;
        document.body.appendChild(popup);

        setTimeout(() => {
            popup.remove();
        }, 1800);
    }

    function validateSignupForm() {
        let password = document.getElementById("password").value;
        let confirmPassword = document.getElementById("confirmPassword").value;

        if (password.length < 8) {
            alert("Password must be at least 8 characters long!");
            return false;
        }

        if (password !== confirmPassword) {
            alert("Passwords do not match!");
            return false;
        }

        showPopup("Account created successfully! Please check your email.");
        return true;
    }

    const emailInputs = document.querySelectorAll('input[type="email"]');

    emailInputs.forEach(input => {
        input.addEventListener("input", function () {
            const email = this.value;

            const valid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);

            if (valid) {
                this.classList.remove("error");
                this.classList.add("success");
            } else if (email.length > 0) {
                this.classList.remove("success");
                this.classList.add("error");
            } else {
                this.classList.remove("success");
                this.classList.remove("error");
            }
        });
    });

    const loginForm = document.querySelector('#loginForm form');

    loginForm.addEventListener("submit", function () {
        showPopup("Login successful! Redirecting...");
        const serverError = document.getElementById("serverError");
        if (serverError && serverError.innerText.trim() !== "") {
            setTimeout(() => {
                serverError.style.display = "none";
            }, 2500);
        }


    });
    function showForgotPassword() {
        document.getElementById("loginForm").classList.remove("active");
        document.getElementById("signupForm").classList.remove("active");
        document.getElementById("forgotForm").classList.add("active");

        document.getElementById("imageContent").innerHTML = `
        <h2>Don't Worry!</h2>
        <p>We'll help you reset your password and get back to your account safely</p>
    `;
    }

    function handleForgotPassword() {
        const btn = document.getElementById("resetBtn");
        const icon = btn.querySelector(".loading-icon");
        const text = document.getElementById("resetBtnText");

        icon.classList.add("show");
        text.innerText = "Sending instructions...";
        btn.disabled = true;

        setTimeout(() => {
            icon.classList.remove("show");
            text.innerText = "Send Reset Instructions";
            btn.disabled = false;

            showPopup("Password reset instructions sent to your email!");
        }, 2000);

        return false;
    }

    function socialLogin(type) {
        if (type === "google") {
            showPopup("Google login initiated! (Demo)");
        } else if (type === "facebook") {
            showPopup("Facebook login initiated! (Demo)");
        } else if (type === "twitter") {
            showPopup("Twitter login initiated! (Demo)");
        }
    }


</script>

</body>
</html>
document.getElementById('loginButton').addEventListener('click', function() {
    alert('Login button clicked. Implement your login logic here.');
});
<script>
    function showRegistrationForm() {
        document.getElementById('registrationOverlay').style.display = 'flex';
    }

    function hideRegistrationForm() {
        document.getElementById('registrationOverlay').style.display = 'none';
    }
</script>
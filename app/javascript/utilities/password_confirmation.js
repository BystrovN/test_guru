document.addEventListener('DOMContentLoaded', function () {
  const passwordField = document.querySelector('#user_password');
  const confirmPasswordField = document.querySelector('#user_password_confirmation');
  const confirmationMessage = document.querySelector('#confirmation-message');

  const updateConfirmationStyles = (message = '', borderColor = '') => {
    confirmationMessage.textContent = message;
    confirmPasswordField.style.borderColor = borderColor;
    confirmPasswordField.style.borderWidth = '5px';
  };

  const checkPasswordConfirmation = () => {
    if (passwordField.value !== confirmPasswordField.value) {
      updateConfirmationStyles('Passwords do not match', 'red');
    } else if (confirmPasswordField.value && passwordField.value === confirmPasswordField.value) {
      updateConfirmationStyles('', 'green');
    } else {
      updateConfirmationStyles();
    }
  };

  passwordField.addEventListener('input', checkPasswordConfirmation);
  confirmPasswordField.addEventListener('input', checkPasswordConfirmation);
});

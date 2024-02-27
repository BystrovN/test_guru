document.addEventListener('turbolinks:load', function () {
  const progressBar = document.getElementById('progress-bar');
  const currentQuestionNumber = parseInt(progressBar.getAttribute('value'));

  const updateProgressBar = () => {
    progressBar.value = currentQuestionNumber;
  };

  updateProgressBar();
});

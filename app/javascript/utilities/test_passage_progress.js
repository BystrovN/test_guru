document.addEventListener('DOMContentLoaded', function () {
  const progressBar = document.getElementById('progress-bar');
  const currentQuestion = parseInt(progressBar.dataset.currentQuestion);
  const totalQuestions = parseInt(progressBar.dataset.totalQuestions);

  const updateProgressBar = () => {
    const progress = (currentQuestion / totalQuestions) * 100;
    progressBar.style.width = progress + '%';
  };

  updateProgressBar();
});

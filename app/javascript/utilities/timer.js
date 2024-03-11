document.addEventListener('DOMContentLoaded', () => {
  const timerElement = document.getElementById('timer');
  let initialTime = parseInt(timerElement.dataset.initialTime);

  if (!timerElement.classList.contains('timer-started')) {
    function updateTimer() {
      const minutes = Math.floor(initialTime / 60);
      const seconds = initialTime % 60;
      timerElement.innerHTML = `${minutes}:${seconds < 10 ? "0" : ""}${seconds}`;
      if (initialTime === 0) {
        clearInterval(timerInterval);
        const form = document.querySelector('form');
        form.submit();
      } else {
        initialTime--;
      }
    }

    const timerInterval = setInterval(updateTimer, 1000);

    timerElement.classList.add('timer-started');
  }
});

// document.addEventListener("DOMContentLoaded", function(event) {
  console.log("dark_mode.js executed on DOMContentLoaded");
  var darkModeToggle = document.getElementById('dark-mode-toggle');
  var html = document.documentElement;

  // Add event listener to the dark mode button
  darkModeToggle.addEventListener('click', function() {
    document.querySelector("#dark-mode-toggle i").classList.remove("bi-moon")
    if (html.classList.contains('dark')) {
      html.classList.remove('dark');
      localStorage.setItem('darkMode', 'false');
      document.querySelector("#dark-mode-toggle i").classList.add("bi-moon")
    } else {
      html.classList.add('dark');
      localStorage.setItem('darkMode', 'true');
      document.querySelector("#dark-mode-toggle i").classList.add("bi-moon-fill")
    }
  });
// });

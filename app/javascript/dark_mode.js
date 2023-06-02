document.addEventListener("DOMContentLoaded", function(event) {
  console.log("dark_mode.js executed on DOMContentLoaded");
  const darkModeToggle = document.getElementById('dark-mode-toggle');
  const html = document.documentElement;

  // Add event listener to the dark mode button
  darkModeToggle.addEventListener('click', function() {
    if (html.classList.contains('dark')) {
      html.classList.remove('dark');
      localStorage.setItem('darkMode', 'false');
    } else {
      html.classList.add('dark');
      localStorage.setItem('darkMode', 'true');
    }
  });
});

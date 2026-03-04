const yearEl = document.getElementById('year');
if (yearEl) {
  yearEl.textContent = new Date().getFullYear();
}

// Mobile nav toggle
const toggle = document.querySelector('.nav-toggle');
const navLinks = document.getElementById('nav-links');
if (toggle && navLinks) {
  toggle.addEventListener('click', () => {
    const open = toggle.classList.toggle('open');
    navLinks.classList.toggle('open', open);
    toggle.setAttribute('aria-expanded', open);
  });
  // Close on link click
  navLinks.addEventListener('click', e => {
    if (e.target.tagName === 'A') {
      toggle.classList.remove('open');
      navLinks.classList.remove('open');
      toggle.setAttribute('aria-expanded', 'false');
    }
  });
}

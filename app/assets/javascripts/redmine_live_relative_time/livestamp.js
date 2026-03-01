// Live Relative Time - updates all elements with data-livestamp attribute
// Replaces moment.js livestamp (300KB) with vanilla JS (~40 lines)
(function() {
  'use strict';

  function relativeTime(timestamp) {
    var now = Math.floor(Date.now() / 1000);
    var diff = now - timestamp;
    var absDiff = Math.abs(diff);
    var suffix = diff >= 0 ? ' ago' : ' from now';

    if (absDiff < 60) return 'less than a minute' + suffix;
    if (absDiff < 120) return 'about 1 minute' + suffix;
    if (absDiff < 3600) return Math.floor(absDiff / 60) + ' minutes' + suffix;
    if (absDiff < 7200) return 'about 1 hour' + suffix;
    if (absDiff < 86400) return Math.floor(absDiff / 3600) + ' hours' + suffix;
    if (absDiff < 172800) return '1 day' + suffix;
    if (absDiff < 2592000) return Math.floor(absDiff / 86400) + ' days' + suffix;
    if (absDiff < 5184000) return 'about 1 month' + suffix;
    if (absDiff < 31536000) return Math.floor(absDiff / 2592000) + ' months' + suffix;
    if (absDiff < 63072000) return 'about 1 year' + suffix;
    return Math.floor(absDiff / 31536000) + ' years' + suffix;
  }

  function updateLivestamps() {
    var elements = document.querySelectorAll('[data-livestamp]');
    for (var i = 0; i < elements.length; i++) {
      var el = elements[i];
      var timestamp = parseInt(el.getAttribute('data-livestamp'), 10);
      if (!isNaN(timestamp)) {
        // Update the text content, preserving the element type (link or abbr)
        var textNodes = [];
        for (var j = 0; j < el.childNodes.length; j++) {
          if (el.childNodes[j].nodeType === Node.TEXT_NODE) {
            textNodes.push(el.childNodes[j]);
          }
        }
        var newText = relativeTime(timestamp);
        if (textNodes.length > 0) {
          textNodes[0].textContent = newText;
        } else {
          el.textContent = newText;
        }
      }
    }
  }

  // Update every 60 seconds
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', function() {
      setInterval(updateLivestamps, 60000);
    });
  } else {
    setInterval(updateLivestamps, 60000);
  }
})();

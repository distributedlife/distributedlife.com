function twitterShare(url) {
  var winTop = (screen.height / 2) - 350;
  var winLeft = (screen.width / 2) - 520;

  window.open(url, 'twitter share', 'top=' + winTop + ',left=' + winLeft + ',toolbar=0,status=0,width=' + 520 + ',height=' + 350);
}

function fbShare(url, title, descr, image) {
  var winTop = (screen.height / 2) - 350;
  var winLeft = (screen.width / 2) - 520;
  window.open('http://www.facebook.com/sharer.php?s=100&p[title]=' + title + '&p[summary]=' + descr + '&p[url]=' + url + '&p[images][0]=' + image, 'sharer', 'top=' + winTop + ',left=' + winLeft + ',toolbar=0,status=0,width=' + 520 + ',height=' + 350);
}
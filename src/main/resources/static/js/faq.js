function tutee() {
  var tutee = document.getElementById("tutee");
  var tuteetext = document.getElementById("tuteetext");
  var tutor = document.getElementById("tutor");
  var tutortext = document.getElementById("tutortext");

  tutee.style.display = "block";
  tuteetext.style.textDecoration = "underline";
  tutor.style.display = "none";
  tutortext.style.textDecoration = "none";
}

function tutor() {
  var tutee = document.getElementById("tutee");
  var tuteetext = document.getElementById("tuteetext");
  var tutor = document.getElementById("tutor");
  var tutortext = document.getElementById("tutortext");

  tutor.style.display = "block";
  tutortext.style.textDecoration = "underline";
  tutee.style.display = "none";
  tuteetext.style.textDecoration = "none";
}

document.getElementById("tutee").addEventListener("click", function () {
  tutee;
});
document.getElementById("tutor").addEventListener("click", function () {
  tutor;
});

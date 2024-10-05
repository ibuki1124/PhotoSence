// app/javascript/packs/image_preview.js

document.addEventListener('turbolinks:load', function() {
  const imageInput = document.getElementById('fileInput');
  const preview = document.getElementById('preview');
  const previewBtn = document.getElementById('previewBtn');

  if (imageInput) {
    imageInput.addEventListener('change', function(e) {
      const file = e.target.files[0];
      if (file) {
        const reader = new FileReader();
        
        reader.onload = function(e) {
          preview.src = e.target.result;
          preview.style.display = 'block';
          previewBtn.style.display = 'block';
        }
        
        reader.readAsDataURL(file);
      } else {
        preview.src = '';
        preview.style.display = 'none';
        previewBtn.style.display = 'none';
      }
    });
  }
});
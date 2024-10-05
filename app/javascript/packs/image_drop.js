document.addEventListener('DOMContentLoaded', (event) => {
  const dropArea = document.getElementById('drop-area');
  const fileInput = document.getElementById('fileInput');
  ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
    dropArea.addEventListener(eventName, preventDefaults, false);
  });
  function preventDefaults(e) {
    e.preventDefault();
    e.stopPropagation();
  }
  ['dragenter', 'dragover'].forEach(eventName => {
    dropArea.addEventListener(eventName, highlight, false);
  });
  ['dragleave', 'drop'].forEach(eventName => {
    dropArea.addEventListener(eventName, unhighlight, false);
  });
  function highlight(e) {
    dropArea.style = "background-color: #aef;";
  }
  function unhighlight(e) {
    dropArea.style = "background-color: #fff;";
  }
  dropArea.addEventListener('drop', handleDrop, false);
  function isImageFile(file) {
    return file.type.startsWith('image/');
  }
  function handleDrop(e) {
    const dt = e.dataTransfer;
    const files = dt.files;
    if (files.length > 0 && isImageFile(files[0])) {
      fileInput.files = files;
      fileInput.dispatchEvent(new Event('change', { bubbles: true }));
      // ドロップエリアの表示を更新
      dropArea.textContent = files[0].name;
      dropArea.style = "background-color: #aef;";
      dropArea.classList.add('font-weight-bold');
      // fileInputがtrueになったことを示すカスタムイベントを発火
      const fileSelectedEvent = new CustomEvent('fileSelected', { detail: { selected: true } });
      fileInput.dispatchEvent(fileSelectedEvent);
    } else {
      dropArea.classList.remove('font-weight-bold');
      dropArea.textContent = '画像ファイルのみアップロード可能です';
      setTimeout(() => {
        dropArea.textContent = 'ここに画像をﾄﾞﾗｯｸﾞ&ﾄﾞﾛｯﾌﾟ';
      }, 3000);
    }
  }
  // ファイル選択の変更を監視
  fileInput.addEventListener('change', (e) => {
    if (fileInput.files.length > 0) {
      if (isImageFile(fileInput.files[0])) {
        dropArea.textContent = fileInput.files[0].name;
        dropArea.style = "background-color: #aef;";
        dropArea.classList.add('font-weight-bold');
      } else {
        dropArea.classList.remove('font-weight-bold');
        dropArea.style = "background-color: #fff;"
        fileInput.value = ''; // 選択をクリア
        dropArea.textContent = '画像ファイルのみアップロード可能です';
        setTimeout(() => {
          dropArea.textContent = 'ここに画像をﾄﾞﾗｯｸﾞ&ﾄﾞﾛｯﾌﾟ';
        }, 3000);
      }
    } else {
      dropArea.classList.remove('font-weight-bold');
      dropArea.style = "background-color: #fff;";
      dropArea.textContent = 'ここに画像をﾄﾞﾗｯｸﾞ&ﾄﾞﾛｯﾌﾟ';
    }
  });
});

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>My WYSIWYG Editor</title>
  <style>
    #editor {
      border: 1px solid gray;
      min-height: 100px;
      padding: 5px;
    }
    .toolbar button {
      font-weight: bold;
      margin-right: 5px;
    }
  </style>
</head>
<body>
  <div class="toolbar">
    <button id="bold">Bold</button>
    <button id="italic">Italic</button>
    <button id="underline">Underline</button>
  </div>
  <div id="editor" contenteditable="true"></div>
  <script>
    var editor = document.getElementById('editor');
    
    document.getElementById('bold').addEventListener('click', function() {
      document.execCommand('bold', false, null);
    });
    
    document.getElementById('italic').addEventListener('click', function() {
      document.execCommand('italic', false, null);
    });
    
    document.getElementById('underline').addEventListener('click', function() {
      document.execCommand('underline', false, null);
    });
  </script>
</body>
</html>





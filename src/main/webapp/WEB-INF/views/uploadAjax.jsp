<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>upload Ajax</h1>

<div class='uploadDiv'>
		<input type='file' name='uploadFile' multiple>
	</div>


<button id="uploadBtn">Upload</button>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
		<script>
		 $(document).ready(function(){

			 var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			 var maxSize = 5242880; //5MB

			 function checkExtension(fileName, fileSize){
				if(fileSize >=maxSize){
					alert("���� ������ �ʰ�");
					return false;
					}	
				if(regex.test(fileName)){
					alert("�ش� ������ ������ ���ε� �� �� ����");
					return false;
					}
				return true;
				 }
				
			 $("#uploadBtn").on("click", function(e){

			 var formData = new FormData();
			
			 var inputFile = $("input[name='uploadFile']");
			
			 var files = inputFile[0].files;
			
			 console.log(files);

			 //add filedata to formdata
			 for(var i = 0; i<files.length; i++){
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					}
				 formData.append("uploadFile", files[i]);

				 }


			 $.ajax({
				url: "uploadAjaxAction",
				processData: false,
				contentType : false,
				data: formData,
				type: "POST",
				success: function(result){
					alert("Uploaded");
					}
			 }); //$.ajax

		});
});
</script>
</body>
</html>
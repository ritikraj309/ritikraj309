<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register femfit</title>
<link rel="stylesheet" href="styles.css" />
<style>
body {
	width: 100%;
	height: 100vh;
	margin: 0;
	background: background-color: #FFD5C9;
	background-image:
		url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100%25' height='100%25' viewBox='0 0 800 400'%3E%3Cdefs%3E%3CradialGradient id='a' cx='396' cy='281' r='514' gradientUnits='userSpaceOnUse'%3E%3Cstop offset='0' stop-color='%23DDCFCC'/%3E%3Cstop offset='1' stop-color='%23FFD5C9'/%3E%3C/radialGradient%3E%3ClinearGradient id='b' gradientUnits='userSpaceOnUse' x1='400' y1='148' x2='400' y2='333'%3E%3Cstop offset='0' stop-color='%23FFFFFF' stop-opacity='0'/%3E%3Cstop offset='1' stop-color='%23FFFFFF' stop-opacity='0.5'/%3E%3C/linearGradient%3E%3C/defs%3E%3Crect fill='url(%23a)' width='800' height='400'/%3E%3Cg fill-opacity='0.5'%3E%3Ccircle fill='url(%23b)' cx='267.5' cy='61' r='300'/%3E%3Ccircle fill='url(%23b)' cx='532.5' cy='61' r='300'/%3E%3Ccircle fill='url(%23b)' cx='400' cy='30' r='300'/%3E%3C/g%3E%3C/svg%3E");
	background-attachment: fixed;
	background-size: cover;;
	color: #696563;
	font-family: Verdana;
	font-size: 15px;
}

h1, h2, p {
	margin: 1em auto;
	text-align: center;
}

p[id="logo"] {
	color: #fff;
	font-size: 60px;
	margin-bottom: -80px;
}

h1 {
	color: #fff;
	font-family: Didot;
	font-size: 60px;
}

p[id="description"] {
	font-family: Didot;
	font-size: 18px;
	font-style: italic;
	margin: -40px 0 40 0;
}

h2 {
	font-family: Didot;
}

hr {
	border: none;
}

form {
	width: 60vw;
	max-width: 550px;
	min-width: 350px;
	margin: 0 auto;
	padding-bottom: 2em;
	background: #fcf5f2;
	margin-bottom: 60px;
}

fieldset {
	border: none;
	padding: 2rem 0;
	border-bottom: 3px dotted #ebd1c7;
	max-width: 400px;
	min-width: 300px;
	margin: auto;
}

fieldset:last-of-type {
	border-bottom: none;
}

label {
	display: block;
	margin: 1rem 0;
}

input, textarea, select {
	margin: 10px 0 0 0;
	width: 100%;
	min-height: 3em;
}

input, textarea {
	background-color: #fff;
	border: 1px solid #fff;
	color: #a39e9d;
}

.inline {
	width: unset;
	margin: 0 0.5em 0 0;
	vertical-align: middle;
	min-height: 1em;
}

select[id="dropdown"] {
	background-color: #fff;
	border: 1px solid #fff;
}

p[id="footer"] {
	color: #fff;
}

input[id="profile-picture"] {
	min-height: 1.1em;
	background: none;
	border: none;
}

input[type="submit"] {
	display: block;
	width: 60%;
	margin: 1em auto;
	height: 2em;
	font-size: 1.1rem;
	background-color: #e3baaf;
	border-color: #e3baaf;
	min-width: 300px;
	color: #fff;
	font-family: Didot;
}

a:link {
	color: #e3baaf;
}

a:visited {
	color: #e3baaf;
}

a:hover {
	color: #e3baaf;
}

a:active {
	color: #e3baaf;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<form id="myfrom" enctype="multipart/form-data"> 
		<fieldset>
		<spam class="ab"></spam>
			<h2>Your information</h2>
			<label for="name" id="name-label">Name 
				<input id="name" name="aaa" type="text" placeholder="Enter your name" required />
				<input  name="event" type="hidden" value="addEmployee" />
			</label> 
			<label for="email" id="email-label">Email 
				<input id="email"	name="email" type="email" placeholder="Enter your email" required />
			</label>
			<label for="new-password">Password 
				<input name="pass" type="password" placeholder="Choose a password" required />
			</label>
			<input name="img" type="file"  required />
		</fieldset>

		<input  id="submit" type="submit" value="Submit" />
	</form>
	<div style="margin-left:500px">
		<a href="viewEmployee.jsp" style="color:black">View Employee</a>
	</div>
	
	
	<script>
		$(document).ready(function(){
			
			$('#myfrom').on('submit',function(event){
				event.preventDefault();
				var formData = new FormData($(this)[0]);
			
				$.ajax({
					url:'abc',
					method:'post',
					data:formData,
					async:false,
					success: function (data) {
			           if(data==1){
			        	   $('.ab').html('Successfully Added!');
			        	   $('.ab').css('color','green');
			           }else{
			        	   $('.ab').html('Data Not Added!');
			        	   $('.ab').css('color','red');
			           }
			        },
			        cache:false,
			        contentType:false,
			        processData:false,
			        
				});
			});
		});
	
	</script>
</body>
</html>
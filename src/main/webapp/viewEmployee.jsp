<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Employee</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<h1> Employee List</h1>
		</div>
		<div class="row">
			<table class="table table-primary table-hover">
				  <thead >
				    <tr>
				      <th scope="col">#</th>
				       <th scope="col">Image</th>
				      <th scope="col">Employee Name</th>
				      <th scope="col">Employee Email</th>
				      <th scope="col">Employee Password</th>			     
				      <th scope="col">Update</th>
				      <th scope="col">Delete</th>
				    </tr>
				  </thead>
				  <tbody id="view">
			
				    
				  </tbody>
				</table>


		</div>
	</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update Employee</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        	<form action="abc" method="post">
	        	<label for="empName">Employee Name</label>
	        	<input type="text" class="form-control" name="empName" id="empName">
	        	
	        	<label for="empEmail">Employee Email</label>
	        	<input type="email" class="form-control" name="empEmail" id="empEmail">
	        	
	        	<label for="empPass">Employee Password</label>
	        	<input type="text" class="form-control" name="empPass" id="empPass">
	        	<input type="hidden"  name="event" value="updateEmployee">
	        	<input type="hidden"  name="empid" id="empId">
	        	<br>
	        	<input type="submit" class="form-control btn-primary" value="Update">
        	</form>
      </div>
      
    </div>
  </div>
</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script>
	$(document).ready(function(){
		let event="event=viewEmployee";
		$.ajax({
			url:'abc',
			method:'post',
			data:event,
			dataType:"json",
			success: function (data) {
				console.log(data);
				let s="";
				let i=1;
				
	            for(var key in data){
	            	if(data.hasOwnProperty(key)){
	            	 s+="<tr>";
	            	 s+="<th scope='row'>"+i+"</th>";
	            	 s+="<td><img src='img/EmpImg/"+data[key].empImg+"' style='height:50px;width:50px;'></td>"
	            	 s+="<td>"+data[key].empName+"</td>";	            	
	            	 s+="<td>"+data[key].empEmail+"</td>";
	            	 s+="<td>"+data[key].empPass+"</td>";
	            	 s+="<td><a class='btn btn-info empUpdate' id='"+data[key].empid+"'>update</a></td>";
	            	 s+="<td><a class='btn btn-danger empDelete'  id='"+data[key].empid+"'>Delete</a></td>"
	            	 s+="</tr>"; 
	            	 i++;
	            	}
	            }
	            $("#view").html(s);
	        },
	        
	        
		});
	});
	</script>
	<script>
	  $(document).on('click','.empDelete',function(){
			empid=$(this).attr('id');
			if(confirm('Are Sure You Want To Delete This !')){
			$.ajax({
				url:'abc',
				method:'post',
				data:{'empid':empid,'event':'deleteEmployee'},
				success: function (data) {
					if(data.trim()==1){
						window.location="viewEmployee.jsp";
					}else{
						alert('data not Deleted!');
					}
		        },
		        
		        
			});
	       }//end If
		});
	
	</script>
<script>
$(document).on('click','.empUpdate',function(){
	empid=$(this).attr('id');
	$("#exampleModal").modal("show");
	$.ajax({
		url:'abc',
		method:'post',
		data:{'empid':empid,'event':'getEmpDetailsById'},
		dataType:"json",
		success: function (data) {
			console.log(data);
			$("#empName").val(data[0].empName);
			$("#empEmail").val(data[0].empEmail);
			$("#empPass").val(data[0].empPass);
			$("#empId").val(data[0].empid);
        },
        
        
	});
   
});
</script>
</body>
</html>
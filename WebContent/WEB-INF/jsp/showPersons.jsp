<html>
<head>

<%@ include file="/WEB-INF/includes/header.jsp" %>


<script type="text/javascript">

$(document).ready(function(){
	
	
	
	 $.ajax({
	        url: "showPersonsJSON",
	        data: "",
	        type: "GET",
	         
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader("Accept", "application/json");
	            xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
	        },
	        success: function(persons) {
	        	$.each(persons, function(i, person) {
	        	   $("#listaPersonas ul").append('<li>'+person.name+'</li>');
	  	           $("#listaPersonas ul").append('<li>'+person.lastName+'</li>');
	  	           $("#listaPersonas ul").append('<li>'+person.dni+'</li>');
	        	});
	        }
	    });
	
	
	
	
	$('#formPersona').submit(function(event) {
 		event.preventDefault();
		name = $("#inputName").val();
		lastName = $("#inputLastName").val();
		dni = $("#inputDNI").val();
		
	    var json = { "name" : name, "lastName" : lastName, "dni": dni};
	    
	    $.ajax({
	        url: $("#formPersona").attr( "action"),
	        data: JSON.stringify(json),
	        type: "POST",
	         
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader("Accept", "application/json");
	            xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
	        },
	        success: function(person) {
	           $("#listaPersonas ul").append('<li>'+person.name+'</li>');
	           $("#listaPersonas ul").append('<li>'+person.lastName+'</li>');
	           $("#listaPersonas ul").append('<li>'+person.dni+'</li>');
	        }
	    });
	    
	});
	
	
		
		
});






</script>


</head>
<body class="body">

	

<%@ include file="/WEB-INF/includes/navbar.jsp" %>


	<form:form id="formPersona" method = "POST" action="savePerson">
		<div class="form-row">
			<div class="form-group col-md-6">
				<label for="inputName">Name</label> <input type="text"
					class="form-control" id="inputName" placeholder="Name"
					name="name">
			</div>
			<div class="form-group col-md-6">
				<label for="inputLastname">Last Name</label> <input type="text"
					class="form-control" id="inputLastName" placeholder="LastName"
					name="lastName">
			</div>
			<div class="form-group col-md-6">
				<label for="inputDNI">DNI</label> <input type="text"
					class="form-control" id="inputDNI" placeholder="DNI"
					name="dni">
			</div>
		</div>
		<div class="form-row">
			<input type = "submit" value = "Submit"/>
		</div>
	</form:form>

	
	<div id="listaPersonas">
		<ul>
			
		</ul>
	</div>
	
	

</body>
</html>
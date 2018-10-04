
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Alumnos</title>
<link rel="stylesheet" type="text/css" href="css/view.css" media="all">
<script type="text/javascript" src="js/view.js"></script>
<script type="text/javascript" src="js/calendar.js"></script>
<%@ include file="/WEB-INF/includes/header.jsp" %>


		<style type="text/css">
			.tg  {border-collapse:collapse;border-spacing:0;border-color:#999; margin-left: auto; margin-right: auto}
			.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#999;color:#444;background-color:#F7FDFA;}
			.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#999;color:#fff;background-color:#26ADE4;}
			.tg .tg-c3ow{border-color:inherit;text-align:center;vertical-align:top}
			.tg .tg-svo0{background-color:#D2E4FC;border-color:inherit;text-align:center;vertical-align:top}
		</style>



<script type="text/javascript">
$(document).ready(function(){
	
	
	$.ajax({
        url: "alumno",
        type: "GET",
         
        beforeSend: function(xhr) {
            xhr.setRequestHeader("Accept", "application/json");
            xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
        },
        success: function(alumnos) {
          for(i = 0;  i < alumnos.length; i++){
        	  if( (i % 2) ){
        		  document.getElementById("tablaAlumnos").insertRow().innerHTML = 
           			  '<td class="tg-svo0">'+alumnos[i].legajo+'</td>'+
           			  '<td class="tg-svo0">'+alumnos[i].nombre+'</td>'+
           			  '<td class="tg-svo0">'+alumnos[i].apellido+'</td>'+
           			  '<td class="tg-svo0">'+alumnos[i].fechaNacimiento+'</td>'+
           			  '<td class="tg-svo0"><img id="'+alumnos[i].id+'" height="22" width="22" src="images/edit.ico" onClick="update(this)" /></td>'
        	  }else{
           			document.getElementById("tablaAlumnos").insertRow().innerHTML = 
          			  '<td class="tg-c3ow">'+alumnos[i].legajo+'</td>'+
          			  '<td class="tg-c3ow">'+alumnos[i].nombre+'</td>'+
          			  '<td class="tg-c3ow">'+alumnos[i].apellido+'</td>'+
          			  '<td class="tg-c3ow">'+alumnos[i].fechaNacimiento+'</td>'+
          			  '<td class="tg-c3ow"><img id="'+alumnos[i].id+'" height="22" width="22" src="images/edit.ico" onClick="update(this)" /></td>'
        	  }
          }
        }
    });
	
	
	
	
	
	$('input').on('change', function(){
		value = $(this).val();
		if(value != ''){
			$(this).css('border-bottom', '1px solid #ddd');
			$(this).css('border-left', '1px solid #c3c3c3');
			$(this).css('border-right', '1px solid #c3c3c3');
			$(this).css('border-top', '1px solid #7c7c7c');
		}
	});
	
	
	
	$("#saveForm").on('click',function(a){
		saveOrUpdate();	
	});
	
	
		function saveOrUpdate(){
			nombre = $("#nombre").val();
			apellido = $("#apellido").val();
			nroLegajo = $("#nrolegajo").val();
			mes = $("#element_3_1").val();
			dia = $("#element_3_2").val();
			anio = $("#element_3_3").val();
			
			fechaNacimiento = anio+'-'+mes+'-'+dia
			
			if(nombre.trim() == ''){
				alert('Falta Nombre');
				$("#nombre").css('border','1px solid #f00');
				return;
			}
			
			if(apellido.trim() == ''){
				alert('Falta Apellido');
				$("#apellido").css('border','1px solid #f00');
				return;
			}
			
			if(nroLegajo.trim() == ''){
				alert('Falta Legajo');
				$("#nrolegajo").css('border','1px solid #f00');
				return;
			}
			
			if(mes.trim() == ''){
				alert('Falta Mes');
				$("#element_3_1").css('border','1px solid #f00');
				return;
			}
			
			if(dia.trim() == ''){
				alert('Falta Dia');
				$("#element_3_3").css('border','1px solid #f00');
				return;
			}
			
			if(anio == ''){
				alert('Falta Año');
				$("#nombre").css('border','1px solid #f00');
				return;
			}
			
			
			
			var json = { "nombre" : nombre, 
						 "apellido" : apellido, 
						 "legajo": nroLegajo,
						 "fechaNacimiento":fechaNacimiento
					   };
			
			
			
			//Guardar
			if($("#hidden_id").val() == ""){
				$.ajax({
			        url: "alumno",
			        data: JSON.stringify(json),
			        type: "POST",
			         
			        beforeSend: function(xhr) {
			            xhr.setRequestHeader("Accept", "application/json");
			            xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
			        },
			        success: function(person) {
			          alert("Alumno Guardado");
			        }
			    });
			//Actualizar
			}else{
				json.id = $("#hidden_id").val();
				$.ajax({
			        url: "alumno",
			        data: JSON.stringify(json),
			        type: "PUT",
			         
			        beforeSend: function(xhr) {
			            xhr.setRequestHeader("Accept", "application/json");
			            xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
			        },
			        success: function(person) {
			          	alert("Alumno Guardado");
			          	$("#hidden_id").val("");
			          	$("#nombre").val("");
						$("#apellido").val("");
						$("#nrolegajo").val("");
						$("#element_3_2").val("");
						$("#element_3_1").val("");
						$("#element_3_3").val("");
						
						$.ajax({
					        url: "alumno",
					        type: "GET",
					         
					        beforeSend: function(xhr) {
					            xhr.setRequestHeader("Accept", "application/json");
					            xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
					        },
					        success: function(alumnos) {
					        	
					          countRow = document.getElementById("tablaAlumnos").rows.length;
								
							  for(i=2; i<countRow; i++){
								 document.getElementById("tablaAlumnos").deleteRow(-1);
							  }
					        	
					          for(i = 0;  i < alumnos.length; i++){
					        	  if( (i % 2) ){
				        		  document.getElementById("tablaAlumnos").insertRow(-1).innerHTML = 
				           			  '<td class="tg-svo0">'+alumnos[i].legajo+'</td>'+
				           			  '<td class="tg-svo0">'+alumnos[i].nombre+'</td>'+
				           			  '<td class="tg-svo0">'+alumnos[i].apellido+'</td>'+
				           			  '<td class="tg-svo0">'+alumnos[i].fechaNacimiento+'</td>'+
				           			  '<td class="tg-svo0"><img id="'+alumnos[i].id+'" height="22" width="22" src="images/edit.ico" onClick="update(this)" /></td>'
					        	  }else{
				           		  document.getElementById("tablaAlumnos").insertRow(-1).innerHTML = 
				          			  '<td class="tg-c3ow">'+alumnos[i].legajo+'</td>'+
				          			  '<td class="tg-c3ow">'+alumnos[i].nombre+'</td>'+
				          			  '<td class="tg-c3ow">'+alumnos[i].apellido+'</td>'+
				          			  '<td class="tg-c3ow">'+alumnos[i].fechaNacimiento+'</td>'+
				          			  '<td class="tg-c3ow"><img id="'+alumnos[i].id+'" height="22" width="22" src="images/edit.ico" onClick="update(this)" /></td>'
					        	  }
					          }
					        }
					    });
			        }
			    });
			}
			
			
			
			
			
		}
	
	
	
		
	
	
});

function update(o){
	
	$.ajax({
        url: "alumno/"+o.id,
        type: "GET",
         
        beforeSend: function(xhr) {
            xhr.setRequestHeader("Accept", "application/json");
            xhr.setRequestHeader("Content-Type", "application/json; charset=utf-8");
        },
        success: function(alumno) {
        	dia = alumno.fechaNacimiento.split('-')[2];
        	mes = alumno.fechaNacimiento.split('-')[1];
        	anio = alumno.fechaNacimiento.split('-')[0];
        	$("#nombre").val(alumno.nombre);
			$("#apellido").val(alumno.apellido);
			$("#nrolegajo").val(alumno.legajo);
			$("#element_3_2").val(dia);
			$("#element_3_1").val(mes);
			$("#element_3_3").val(anio);
			$("#hidden_id").val(alumno.id);
        }
    });
	
	
}

</script>


</head>
<body id="main_body" >
<%@ include file="/WEB-INF/includes/navbar.jsp" %>

	
	<div id="top"/>
	<div id="form_container">
	
		<h1><a>Alumnos</a></h1>
		<form id="form_29622" class="appnitro"  method="post" action="/formbuilder/view.php">
					<div class="form_description">
			<h2>Alumnos</h2>
			<p>Creacion de alumnos</p>
		</div>						
		<ul>
			
			<li id="li_1" >
				<label class="description" for="element_1">Nombre y Apellido </label>
				<span>
					<input id="nombre" name= "nombre" class="element text" maxlength="255" size="8" value=""/>
					<label>First</label>
				</span>
				<span>
					<input id="apellido" name= "apellido" class="element text" maxlength="255" size="14" value=""/>
					<label>Last</label>
				</span> 
			</li>		<li id="li_2" >
		<label class="description" for="element_2">Numero Legajo </label>
		<div>
			<input id="nrolegajo" name="element_2" class="element text medium" type="text" maxlength="255" value=""/> 
		</div> 
		</li>		<li id="li_3" >
		<label class="description" for="element_3">Fecha Nacimiento </label>
		
		<span>
			<input id="element_3_2" name="element_3_2" class="element text" size="2" maxlength="2" value="" type="text"> /
			<label for="element_3_2">DD</label>
		</span>
		<span>
			<input id="element_3_1" name="element_3_1" class="element text" size="2" maxlength="2" value="" type="text"> /
			<label for="element_3_1">MM</label>
		</span>
		<span>
	 		<input id="element_3_3" name="element_3_3" class="element text" size="4" maxlength="4" value="" type="text">
			<label for="element_3_3">YYYY</label>
		</span>
	
		<span id="calendar_3">
			<img id="cal_img_3" class="datepicker" src="images/calendar.gif" alt="Pick a date.">	
		</span>
		<script type="text/javascript">
			Calendar.setup({
			inputField	 : "element_3_3",
			baseField    : "element_3",
			displayArea  : "calendar_3",
			button		 : "cal_img_3",
			ifFormat	 : "%B %e, %Y",
			onSelect	 : selectDate
			});
		</script>
		 
			</li>
				
			<li class="buttons">
			    <input type="hidden" id="hidden_id" value="" />
				<input id="saveForm" class="button_text" type="button" name="submit" value="Submit" />
			</li>
		</ul>
		</form>	
		
		
		
<div style="overflow: scroll; height: 162px; overflow-x: hidden;">
	<table class="tg" id="tablaAlumnos">
	  <tr>
	    <th class="tg-c3ow" colspan="5">Alumnos</th>
	  </tr>
	  
	  <tr>
	    <td class="tg-svo0">Legajo</td>
	    <td class="tg-svo0">Nombre</td>
	    <td class="tg-svo0">Apellido</td>
	    <td class="tg-svo0">Fecha Nacimiento</td>
	    <td class="tg-svo0">Acciones</td>
	  </tr>
	</table>
</div>










		
		
		<div id="footer">
			Universidad Tecnologica Nacional
		</div>
	</div>
	<div id="bottom" >
	</body>
</html>
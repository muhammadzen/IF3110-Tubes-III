<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<title>Masukkan Judul Dokumen</title>
	<link rel="stylesheet" type="text/css" href="res/css/style.css" media="all"/>
	<script language="javascript" type="text/javascript">
	function AddToCart(IdBarang,Harga,Jumlah){
		alert("AddToCart?Nama="+IdBarang+"&Jumlah="+Jumlah.value+"&Harga="+Harga);
		var xmlhttp;
		if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else{// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function(){
			if (xmlhttp.readyState==4 && xmlhttp.status==200){
				alert("Pesanan sedang diproses");
				if (xmlhttp.responseText.trim()=="Betul"){
					alert("Pesanan Diterima");}
				else{
					alert("Maaf pesanan ditolak, Jumlah Barang : "+xmlhttp.responseText);}
			}
		}
		xmlhttp.open("GET","AddToCart?Nama="+IdBarang+"&Jumlah="+Jumlah.value+"&Harga="+Harga,true);
		xmlhttp.send();
	}
	</script>
</head>
<body>


	
	<div id="container">
		
		<%@ include file="header.jsp" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		
		<c:if test="${cookie.username.value != 'admin'}">
		<%
			// New location to be redirected
			String site = new String("home.jsp");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site); 
		%>
		</c:if>
		
		<!-- Navbar Section -->

		<!-- End of Navbar -->
		
		<!-- Sort Combo Box -->

		
			
			<!-- Dagangan Baris 1 -->
			<div class="form-registrasi">
			Form Edit Barang :
			<form action="EditDagang" method="POST" enctype="multipart/form-data">
			<div class="formfield">
				<br>
				Nama Baru : <input type="text" name="newnama" required="required" value= <%= request.getParameter("id") %> />
				<br>
				Gambar Baru : <input type="file" name="fileName" required="required"/>
				<br>
				Harga Baru :  <input type="number" name="newharga" required="required"/>
				<br>
				Jumlah Baru : <input type="number" name="newjumlah" required="required"/>
				<br>
				<input type="hidden" name="oldname" value= <%= request.getParameter("id") %> />
				<input type="submit" value="Submit" />
			</div>
			</form>
			</div>

	</div>
	<!-- Javascript -->
	<script src="res/js/common.js" type="text/javascript"></script>
	<script src="scriptregister.js"></script>
	
</body>
</html>
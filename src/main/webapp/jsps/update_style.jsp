<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/add_style.css">
</head>
<body>
	
		<div class="form_div">
			<p class="test_head">Add more haircuts</p>
			<form id="add_form" class="add_style_form" action="CreateStyleServlet" method="post">
				<div class="small_form_div">
					<label class="label">Haircut name</label> <br /> <input
					name="haircutName"
						value="fire coloring" required pattern="[A-Z a-z]{1,32}"
						title="Make sure that name should space" id="style_name"
						class="name-box-1" type="text" autocomplete="name" />
				</div>

				<div class="small_form_div">
					<label for="email" class="label">Style's barber Email</label> <br />

					<input required class="name-box-1" type="email" name="haircutBarbersEmail"
						autocomplete="gghjhfy" />
				</div>
				<div class="small_form_div">
					<label class="label"> Select service</label> <br /> <select
						name="haircutType" id="type_id" class="name-box-1" required>
						<option>Haircut</option>
						<option>Hair coloring</option>
						<option>Hair straitning</option>
						<option>Facials</option>
						<option>Shaves</option>
						<option>Beard trim</option>
					</select>
				</div>

				<div class="small_form_div">
					<label class="label">Description</label> <br /> <input
					name="haircutAbout"
						value="This type coloring is going trending now. In this service we use fire to coloring your hair."
						required id="style_para" class="name-box-1" type="text"
						autocomplete="name" />
				</div>

				<div class="small_form_div">
					<label class="label">Haircut photo</label> <br /> <input required
					name="haircutURL"
						class="name-box-1" type="url" id="design_photo" />
				</div>
				<div class="three_buttons">
					<button class="submit_1">Update</button>
				</div>
			</form>
		</div>
</body>
</html>
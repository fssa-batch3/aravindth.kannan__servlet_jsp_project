<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.fssa.sharpandclean.service.StyleService"%>
    <%@ page import="com.fssa.sharpandclean.model.Style" %>
      <%@ page
	import="com.fssa.sharpandclean.service.exception.ServiceException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>style update page</title>
 <link rel="stylesheet" href="../Assets/CSS/shop_profile.css" />
</head>
<body>


	<%
    
    	int style_id = Integer.parseInt(request.getParameter("styleId"));
		StyleService styleService = new StyleService();
		Style style = null;
		
		try{
			style = styleService.getStylesById(style_id);
		}catch(ServiceException e){
			out.println("Error: " + e.getMessage());
		}
    %>

   <div class="form_div">
			<p class="test_head">Update Hairstyle </p>
			<form id="add_form" class="add_style_form" action="UpdateStyleServlet" method="post">
			<input name="style_id" type="hidden" value="<%= style.getHaircutId() %>"/>
			<input name="style_email" type="hidden" value="<%= style.getHaircutEmail() %>"/>
				<div class="small_form_div">
					<label class="label">Haircut Name</label> <br /> <input
					name="styleName" value="<%= style.getHaircutName() %>"
						 required pattern="[A-Z a-z]{1,32}"
						title="Make sure that name should space" id="style_name"
						class="name-box-1" type="text" autocomplete="name" />
				</div>

			
				<div class="small_form_div">
					<label class="label"> Select service</label> <br /> <select
						name="styleType" id="type_id" class="name-box-1" required>
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
					name="styleAbout"
						value="<%= style.getHaircutAbout() %>"
						required id="style_para" class="name-box-1" type="text"
						autocomplete="name" />
				</div>

				<div class="small_form_div">
					<label class="label">Haircut photo</label> <br /> <input required
					name="styleURL"
					value="<%= style.getHaircutUrl() %>"
						class="name-box-1" type="url" id="design_photo" />
				</div>
				<div class="three_buttons">
					<button class="submit_1">Update</button>
				</div>
			</form>
		</div>

</body>
</html>
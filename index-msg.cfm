<script>
	jQuery(function($){
		
		$(document).ready(function(){
			$("#logoutbtn").click(function(){
				
				$(".response").load("login.cfm?clear=yes");
				
			});	
		});
			
	});
</script>

<h1>Your are in!</h1>
<button type="button" class="btn btn-dark" id="logoutbtn">Log out</button>
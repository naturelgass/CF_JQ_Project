<script src="http://maps.googleapis.com/maps/api/js"></script>
<cfoutput>
<script src="#Application.urls.bullchat#/scripts/geolocation.js"></script>
</cfoutput>

<div id="pjax">
		<div id="wrapper">
			<div class="isolate">
				<div class="center ">
					<div class="main_container full_size container_16 clearfix">

						<div class="box">
							<div class="block">

								<div class="section">
									<div class="alert dismissible alert_light">
										<img width="24" height="24" src="images/icons/small/grey/locked.png">
										<strong>Welcome to BullChat.</strong> Please enter your details to login.
									</div>
								</div>

								<div class="columns clearfix no_lines">
									<div class="col_50 no_border_right">
									<div class="section">
										<div id="dvMap" style="width:340px;height:250px;"></div>
										<span class="redCol"><strong>Your address will not be exposed to users!</strong></span>
										</div>
									</div>

									<form action="?fa=validate" class="validate_form" method="post" id="loginform" enctype="multipart/form-data">

									<input type="hidden" id="longitude" name="longitude" value="">
									<input type="hidden" id="latitude" name="latitude" value="">
									<input type="hidden" id="address" name="address" value="">
									<input type="hidden" id="country" name="country" value="">
									<input type="hidden" id="region" name="region" value="">
									<input type="hidden" id="city" name="city" value="">

									<div class="col_50">
										<div class="col_100">
											<div class="section" style="padding: 2px;">
												<fieldset class="label_side">
													<label for="username_field">Nickname<span>unique identifier</span></label>
													<div class="clearfix">
														<input type="text" id="username_field" name="username" class="required">
													</div>
												</fieldset>
											</div>
										</div>
										<div class="col_100">
											<div class="section" style="padding: 2px;">
												<fieldset class="label_side">
													<label for="fileToUpload">Profile picture<span>640x480 max</span></label>
													<div class="clearfix">
														<input type="file" name="fileToUpload" id="fileToUpload">
													</div>
												</fieldset>
											</div>
										</div>
										<div class="col_100">
											<div class="section" style="padding: 2px;">
												<fieldset class="label_side">
													<label>Profile<span>short description</span></label>
													<div class="clearfix">
														<textarea class="autogrow" id="description" name="description"></textarea>
													</div>
												</fieldset>
											</div>
										</div>
										<div class="col_100">
											<div class="section">
												<p>By login with in this ChatRoom you confirm that you are <b>over 18 years old</b> and that you agree with the terms & conditions!</p>
											</div>
										</div>
									</div>
								</div>

								<div class="button_bar clearfix">
									<button class="send_right" type="submit" id="login_btn">
										<img src="images/icons/small/white/key_2.png">
										<span>Login</span>
									</button>
								</div>

								</form>

							</div>
						</div>
					</div>
<!--- 					<a href="index.php" id="login_logo"><span>Adminica</span></a>
					<button data-dialog="dialog_register" class="dialog_button send_right" style="margin-top:10px;">
						<img src="images/icons/small/white/user.png">
						<span>Not Registered ?</span>
					</button> --->
					</div>
				</div>
			</div>
			<div class="display_none">
	</div>
</div>

<script type="text/javascript">

    $("#loginform").submit(function(e) {
        e.preventDefault();
        var actionurl = e.currentTarget.action;
		var formData = new FormData($(this)[0]);

        $.ajax({
                url: actionurl,
                type: 'post',
                dataType: 'json',
                data: formData,
                async: false,
                cache: false,
		        contentType: false,
		        processData: false,
                success: function(data) {
                	if(data > 0){
                		window.location.href = "?fa=home"
                	}
                }
        });

        return false;

    });

</script>

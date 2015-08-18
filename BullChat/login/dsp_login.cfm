<div id="pjax">
		<div id="wrapper">
			<div class="isolate">
				<div class="center narrow">
					<div class="main_container full_size container_16 clearfix">
						<div class="box">
							<div class="block">
								<div class="section">
									<div class="alert dismissible alert_light">
										<img width="24" height="24" src="images/icons/small/grey/locked.png">
										<strong>Welcome to BullChat.</strong> Please enter your details to login.
									</div>
								</div>
<!--- 								<form action="login/act_login.cfm" class="validate_form" id="loginform"> --->

								<fieldset class="label_side top">
									<label for="username_field">Username</label>
									<div>
										<input type="text" id="username_field" name="username" class="required">
										Login as Guest? <input type="checkbox" id="guset_field" name="guset" checked>
									</div>
								</fieldset>

								<fieldset class="label_side bottom">
									<label for="password_field">Password</label>
									<div>
										<input type="password" id="password_field" name="password_field" class="" disabled="">
									</div>
								</fieldset>
								<div class="button_bar clearfix">
									<button class="wide" type="submit" id="login_btn">
										<img src="images/icons/small/white/key_2.png">
										<span>Login</span>
									</button>
								</div>
<!--- 								</form> --->
							</div>
						</div>
					</div>
					<a href="index.php" id="login_logo"><span>Adminica</span></a>
					<button data-dialog="dialog_register" class="dialog_button send_right" style="margin-top:10px;">
						<img src="images/icons/small/white/user.png">
						<span>Not Registered ?</span>
					</button>
				</div>
			</div>
		<div class="display_none">


	<div id="dialog_register" class="dialog_content no_dialog_titlebar wide" title="Register for Adminica">
		<div class="block">
			<div class="section">
				<h2>Registration Form</h2>
			</div>
			<div class="columns clearfix">
				<div class="col_50">
					<fieldset class="label_top top">
						<label for="text_field_inline">Username<span>Between 5 and 20 characters</span></label>
						<div>
							<input type="text">
						</div>
					</fieldset>
				</div>
				<div class="col_50">
					<fieldset class="label_top top right">
						<label for="text_field_inline">Username again…<span>so we know you're human</span></label>
						<div>
							<input type="text">
						</div>
					</fieldset>
				</div>
			</div>
			<div class="columns clearfix">
				<div class="col_50">
					<fieldset class="label_top">
						<label for="text_field_inline">Password<span>Between 5 and 20 characters</span></label>
						<div>
							<input type="text">
						</div>
					</fieldset>
				</div>
				<div class="col_50">
					<fieldset class="label_top right">
						<label for="text_field_inline">Repeat Password again…</label>
						<div>
							<input type="text">
						</div>
					</fieldset>
				</div>
			</div>

			<fieldset class="label_side bottom">
				<label>Permission</label>
				<div class="uniform inline clearfix">
					<label for="agree_1"><input type="checkbox" name="agree_1" value="yes" id="agree_1"/>I agree with the terms and conditions</label>
				</div>
			</fieldset>



			<div class="button_bar clearfix">
				<button class="dark blue no_margin_bottom link_button" data-link="index.php">
					<div class="ui-icon ui-icon-check"></div>
					<span>Register</span>
				</button>
				<button class="light send_right close_dialog">
					<div class="ui-icon ui-icon-closethick"></div>
					<span>Cancel</span>
				</button>
			</div>
		</div>
	</div>
</div>		<div class="display_none">


	<div id="dialog_register" class="dialog_content no_dialog_titlebar wide" title="Register for Adminica">
		<div class="block">
			<div class="section">
				<h2>Registration Form</h2>
			</div>
			<div class="columns clearfix">
				<div class="col_50">
					<fieldset class="label_top top">
						<label for="text_field_inline">Username<span>Between 5 and 20 characters</span></label>
						<div>
							<input type="text">
						</div>
					</fieldset>
				</div>
				<div class="col_50">
					<fieldset class="label_top top right">
						<label for="text_field_inline">Username again…<span>so we know you're human</span></label>
						<div>
							<input type="text">
						</div>
					</fieldset>
				</div>
			</div>
			<div class="columns clearfix">
				<div class="col_50">
					<fieldset class="label_top">
						<label for="text_field_inline">Password<span>Between 5 and 20 characters</span></label>
						<div>
							<input type="text">
						</div>
					</fieldset>
				</div>
				<div class="col_50">
					<fieldset class="label_top right">
						<label for="text_field_inline">Repeat Password again…</label>
						<div>
							<input type="text">
						</div>
					</fieldset>
				</div>
			</div>

			<fieldset class="label_side bottom">
				<label>Permission</label>
				<div class="uniform inline clearfix">
					<label for="agree_1"><input type="checkbox" name="agree_1" value="yes" id="agree_1"/>I agree with the terms and conditions</label>
				</div>
			</fieldset>



			<div class="button_bar clearfix">
				<button class="dark blue no_margin_bottom link_button" data-link="index.php">
					<div class="ui-icon ui-icon-check"></div>
					<span>Register</span>
				</button>
				<button class="light send_right close_dialog">
					<div class="ui-icon ui-icon-closethick"></div>
					<span>Cancel</span>
				</button>
			</div>
		</div>
	</div>
</div>		<div class="display_none">


	<div id="dialog_form" class="dialog_content" title="Dialog with Form fields">
		<div class="block">
			<div class="section">
				<div class="alert dismissible alert_black">
					<img width="24" height="24" src="images/icons/small/white/alert_2.png">
					<strong>All the form fields</strong> can be just as easily used in a dialog.
				</div>
			</div>
			<fieldset class="label_side top">
				<label>Text Field<span>Label placed beside the Input</span></label>
				<div>
					<input type="text">
				</div>
			</fieldset>

			<fieldset class="label_side">
				<label>Textarea<span>Regular Textarea</span></label>
				<div class="clearfix">
					<textarea class="autogrow"></textarea>
				</div>
			</fieldset>
			<fieldset class="label_side">
			<label>Bounce Slider<span>Slide to Unlock</span></label>
				<div style="padding-top:25px;">
					<div class="slider_unlock" title="Slide to Close"></div>
					<button class="close_dialog display_none"></button>
				</div>
			</fieldset>
			<div class="button_bar clearfix">
				<button class="dark green close_dialog">
					<div class="ui-icon ui-icon-check"></div>
					<span>Submit</span>
				</button>
				<button class="dark red close_dialog">
					<div class="ui-icon ui-icon-closethick"></div>
					<span>Cancel</span>
				</button>
			</div>
		</div>
	</div>
</div>		<div class="display_none">


	<div id="dialog_delete" class="dialog_content narrow no_dialog_titlebar" title="Delete Confirmation">
		<div class="block">
			<div class="section">
				<h1>Delete File</h1>
				<div class="dashed_line"></div>
				<p>Please confirm that you want to delete this file.</p>
			</div>
			<div class="button_bar clearfix">
				<button class="delete_confirm dark red no_margin_bottom close_dialog">
					<div class="ui-icon ui-icon-check"></div>
					<span>Delete</span>
				</button>
				<button class="light send_right close_dialog">
					<div class="ui-icon ui-icon-closethick"></div>
					<span>Cancel</span>
				</button>
			</div>
		</div>
	</div>
</div> 		<div class="display_none">


	<div id="dialog_welcome" class="dialog_content no_dialog_titlebar wide" title="Welcome to Adminica">

		<div class="block lines">
			<div class="columns clearfix">
				<div class="col_50 no_border_top">
					<div class="section">
						<h1>Adminica</h1>
						<p><strong>Adminica</strong> is a <strong>cleanly coded</strong>, <strong>beautifully styled</strong>, easily <strong>customisable</strong>, <strong>cross-browser</strong> compatible <strong>Web Application Interface</strong>.</p>

						<p><strong>Adminica</strong> is packed full of features, allowing you<strong> unlimited combinations</strong> of layouts, controls and styles to ensure you have a <strong>trully unique app</strong>. </p>

						<p><strong>Adminica</strong>  can <strong>scale itself automatically</strong> to fit whatever screen resolution the user has. The interface<strong> works perfectly all the way down to iPhone size</strong></p>
					</div>
				</div>
				<div class="col_50 no_border_top no_border_right">
					<div class="section">
						<h2>Features</h2>
					</div>
					<ul class="flat large text">
						<li><a href="styles/themes/skin_switcher.php?style=theme_light.css">Light</a> and <a href="styles/themes/skin_switcher.php?style=switcher.css">Dark</a> Theme</li>
						<li><a href="styles/themes/layout_switcher.php?style=layout_fixed.css">Fixed</a> and <a href="styles/themes/layout_switcher.php?style=switcher.css">Fluid</a> width layout</li>
						<li><a href="styles/themes/nav_switcher.php?style=switcher.css">Sidebar</a>, <a href="styles/themes/nav_switcher.php?style=nav_top.css">Full Width</a>, <a href="styles/themes/nav_switcher.php?style=nav_slideout.css">Slide Menu</a> or <a href="styles/themes/nav_switcher.php?style=nav_slideout.css">Stack Menu</a>.</li>
						<li class="theme_colour">
							<a class="black" href="styles/themes/theme_switcher.php?style=switcher.css">
								<span>Black</span></a>
							<a class="blue" href="styles/themes/theme_switcher.php?style=theme_blue.css">
								<span>Blue</span></a>
							<a class="navy" href="styles/themes/theme_switcher.php?style=theme_navy.css">
								<span>Navy</span></a>
							<a class="red" href="styles/themes/theme_switcher.php?style=theme_red.css">
								<span>Red</span></a>
							<a class="green" href="styles/themes/theme_switcher.php?style=theme_green.css">
								<span>Green</span></a>
							<a class="magenta" href="styles/themes/theme_switcher.php?style=theme_magenta.css">
								<span>Magenta</span></a>
							<a class="orange" href="styles/themes/theme_switcher.php?style=theme_brown.css">
								<span>Brown</span></a>
						</li>
					</ul>
					<fieldset class="label_side label_small no_lines" style="border-top:0;">
						<label>All Pages</label>
						<div class="clearfix">
							<div id="pagesSelect"></div>
						</div>
					</fieldset>
				</div>
			</div>
			<div class="columns clearfix no_lines">
				<div class="col_33">
					<fieldset class="no_label">
						<div class="clearfix">
							<button class="full_width light">
								<img src="images/icons/small/grey/book.png">
								<span>Documentation</span>
							</button>
						</div>
					</fieldset>
				</div>
				<div class="col_33">
					<fieldset class="no_label">
						<div class="clearfix">
							<button class="full_width light">
								<img src="images/icons/small/grey/help.png">
								<span>Support Forum</span>
							</button>
						</div>
					</fieldset>
				</div>
				<div class="col_33 no_border_right">
					<fieldset class="no_label">
						<div class="clearfix">
							<button class="full_width light link_button" data-link="http://themeforest.net/user/Tricycle">
								<img src="images/icons/small/grey/speech_bubble_2.png">
								<span>Contact</span>
							</button>
						</div>
					</fieldset>
				</div>
			</div>

			<div class="columns clearfix no_lines">
				<div class="col_33">
					<fieldset class="label_top">
						<label for="text_field_inline">Themeforest Username</label>
						<div>
							<input type="text">
						</div>
					</fieldset>
				</div>
				<div class="col_33">

					<fieldset class="label_top">
						<label for="text_field_inline">Email Address<span>required</span></label>
						<div>
							<input type="email" >
						</div>
					</fieldset>
				</div>
				<div class="col_33 no_border_right">
					<fieldset class="label_top empty_label">
						<div class="clearfix">
							<button class="full_width" ><span>Subscribe for Updates</span></button>
						</div>
					</fieldset>
				</div>
			</div>
			<div class="button_bar clearfix" type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe">
				<button class="dark blue close_dialog wide">
					<div class="ui-icon ui-icon-check"></div>
					<span>Submit</span>
				</button>
				<button class="light send_right close_dialog wide">
					<div class="ui-icon ui-icon-closethick"></div>
					<span>Close</span>
				</button>
			</div>
		</div>
	</div>
</div>		<div class="display_none">
	<div id="dialog_logout" class="dialog_content narrow" title="Logout">
		<div class="block">
			<div class="section">
				<h1>Thank you</h1>
				<div class="dashed_line"></div>
				<p>We will now log you out of Adminica in a 10 seconds...</p>
			</div>
			<div class="button_bar clearfix">
				<button class="dark blue no_margin_bottom link_button" data-link="login_slide.php">
					<div class="ui-icon ui-icon-check"></div>
					<span>Ok</span>
				</button>
				<button class="light send_right close_dialog">
					<div class="ui-icon ui-icon-closethick"></div>
					<span>Cancel</span>
				</button>
			</div>
		</div>
	</div>
</div>
		<div id="loading_overlay">
			<div class="loading_message round_bottom">
				<img src="images/interface/loading.gif" alt="loading" />
			</div>
		</div>

		<div id="template_options" class="clearfix">
	<h3><img src="images/interface/adminica.png" alt="Adminica"></h3>
	<div class="layout_size">
		<label>Layout:</label>
		<a href="styles/themes/layout_switcher.php?style=switcher.css">Fluid</a><span>|</span>
		<a href="styles/themes/layout_switcher.php?style=layout_fixed.css">Fixed</a>
	</div>
	<div class="layout_position">
		<label class="display_none">Header: </label>
		<a href="styles/themes/nav_switcher.php?style=switcher.css">Side</a><span>|</span>
		<a href="styles/themes/nav_switcher.php?style=nav_stacks.css">Stacks</a><span>|</span>
		<a href="styles/themes/nav_switcher.php?style=nav_top.css">Top</a><span>|</span>
		<a href="styles/themes/nav_switcher.php?style=nav_slideout.css">Slide</a>
	</div>
	<div class="layout_position">
		<label>Theme: </label>
		<a href="styles/themes/skin_switcher.php?style=multiple&skin_switcher.php=switcher.css&bg_switcher.php=switcher.css">Dark</a><span>|</span>
		<a href="styles/themes/skin_switcher.php?style=multiple&skin_switcher.php=skin_light.css&bg_switcher.php=switcher.css">Light</a>
	</div>
	<div class="theme_colour">
		<label class="display_none">Colour:</label>
		<a class="black" href="styles/themes/theme_switcher.php?style=switcher.css"><span>Black</span></a>
		<a class="blue" href="styles/themes/theme_switcher.php?style=theme_blue.css"><span>Blue</span></a>
		<a class="navy" href="styles/themes/theme_switcher.php?style=theme_navy.css"><span>Navy</span></a>
		<a class="red" href="styles/themes/theme_switcher.php?style=theme_red.css"><span>Red</span></a>
		<a class="green" href="styles/themes/theme_switcher.php?style=theme_green.css"><span>Green</span></a>
		<a class="magenta" href="styles/themes/theme_switcher.php?style=theme_magenta.css"><span>Magenta</span></a>
		<a class="orange" href="styles/themes/theme_switcher.php?style=theme_brown.css"><span>Brown</span></a>
	</div>
	<div class="theme_background" id="bg_dark">
		<label>BGs:</label>
		<a href="styles/themes/bg_switcher.php?style=bg_wunder.css">NEW</a><span>|</span>
		<a href="styles/themes/bg_switcher.php?style=switcher.css">Boxes</a><span>|</span>
		<a href="styles/themes/bg_switcher.php?style=bg_punched.css">Punched</a><span>|</span>
		<a href="styles/themes/bg_switcher.php?style=bg_honeycomb.css">Honeycomb</a><span>|</span>
		<a href="styles/themes/bg_switcher.php?style=bg_wood.css">Wood</a><span>|</span>
		<a href="styles/themes/bg_switcher.php?style=bg_dark_wood.css">Timber</a><span>|</span>
		<a href="styles/themes/bg_switcher.php?style=bg_noise.css">Noise</a>
	</div>
	<div class="theme_background" id="bg_light">
		<label>BGs:</label>
		<a href="styles/themes/bg_switcher.php?style=switcher.css">Silver</a><span>|</span>
		<a href="styles/themes/bg_switcher.php?style=bg_white_wood.css">Wood</a><span>|</span>
		<a href="styles/themes/bg_switcher.php?style=bg_squares.css">Squares</a><span>|</span>
		<a href="styles/themes/bg_switcher.php?style=bg_noise_zero.css">Noise</a><span>|</span>
		<a href="styles/themes/bg_switcher.php?style=bg_stripes.css">Stripes</a>
	</div>
</div>


<!-- Google Analytics Code (Remove if not needed)

		<script type="text/javascript">


		  var _gaq = _gaq || [];
		  _gaq.push(['_setAccount', 'UA-*******-*']);
		  _gaq.push(['_trackPageview']);

		  (function() {
		    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		  })();


		</script>
-->

</div>

<script type="text/javascript">

	$(document).ready(function(){
		$('#login_btn').click(function(){
			var username = $('#username_field').val();
			var guest = $('#guset_field').val();
			postData({ url:'login/act_login.cfm', callfunction:'availability',  Args: {"username": username, "guest" :guest}  });
		});
	});

	function availability(response){
		if(response != 0){
			window.location.href = "?fa=home&uID=" + response;
		}
	}

</script>

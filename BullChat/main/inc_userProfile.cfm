<cfoutput query="qryClientProfile">
<div class="col_33">
	<div class="section">
		<img id="contactImage" width="160" height="100" alt="Profile Pic" src="#Application.urls.profilePics##image#">
		<br/>
		<h2 id="contactName">#username#</h2>
		<h3 id="status">
		<cfif status EQ 0><span style="color: red;">Offline</span>
			<cfelse><span style="color: green;">Online</span></cfif>
		</h3>
		<h4 id="City">Netherlands</h4>
		<h4 id="City">Den Haag</h4>
		<h3 id="City">Radius: < 1km</h3>
	</div>
</div>

<div class="col_66">
	<div class="section send_right">
		<div class="gallery fancybox" >
			<li class="blue">
				<a rel="collection" class="no_loading" href="images/content/gallery/blue/image01.jpg">
				<img src="images/content/gallery/blue/image01_thumb.jpg" height="100" width="160"/>
				<span class="name sort_1">Live</span></a>
			</li>
		</div>
	</div>
</div>

<div class="col_100">
	<div class="section">
		#profile#
	</div>
</div>
</cfoutput>
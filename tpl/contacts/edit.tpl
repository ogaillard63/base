<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$title}</h3>
			</div>
			<div class="panel-body">
				<form role="form" name="form_param" method="post" action="{$base_dir}/contacts/save">
				<input name="id" type="hidden" value="{$contact->id}" />
			 <div class="form-group">
					<label for="firstname}">firstname</label>
					<input class="form-control" type="text" name="firstname" value="{(isset($contact->firstname))?$contact->firstname:''}" />
				</div>
			 <div class="form-group">
					<label for="lastname}">lastname</label>
					<input class="form-control" type="text" name="lastname" value="{(isset($contact->lastname))?$contact->lastname:''}" />
				</div>
			 <div class="form-group">
					<label for="email}">email</label>
					<input class="form-control" type="text" name="email" value="{(isset($contact->email))?$contact->email:''}" />
				</div>

					<div align="right">
						<!--<button type="cancel" class="btn btn-default">cancel</button>-->
						<button type="submit" class="btn btn-primary">Enregistrer</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">search</h3>
			</div>
			<div class="panel-body">
				<form  class="search_form" role="form" name="form_param" method="post" action="{$base_dir}/contacts/results">
					<div class="input-group">
						<input class="form-control" type="text" name="query" value="{if not empty($query)}{$query}{/if}" />
						<span class="input-group-btn">
							<button type="submit" class="btn btn-primary">search</button>
						</span>
					</div>
				</form>
			</div>
		</div>
		{if not empty($contacts)}
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">search_results</h3>
				<div class="actions pull-right">
					<i class="fa fa-chevron-down"></i>
					<i class="fa fa-times"></i>
				</div>
			</div>
			<div class="panel-body">
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>firstname</th>
							<th>lastname</th>
							<th>email</th>

						</tr>
					</thead>
					<tbody>
						{foreach from=$contacts item=contact}
						<tr>
							<td align="left">{$contact->firstname|replace:"{$query}":"<strong>{$query}</strong>"}</td>
							<td align="left">{$contact->lastname|replace:"{$query}":"<strong>{$query}</strong>"}</td>
							<td align="left">{$contact->email|replace:"{$query}":"<strong>{$query}</strong>"}</td>
						</tr>
						{/foreach}
					</tbody>
				</table>
			</div>
		</div>{/if}
	</div>
</div>
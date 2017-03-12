<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">{$title}</h3>
			</div>
			<div class="panel-body">
				{if not empty($contacts)}<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>firstname</th>
						<th>lastname</th>
						<th>email</th>
						<th colspan="2">actions</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$contacts item=contact}
					<tr>
						<td align="left">{$contact->firstname}</td>
						<td align="left">{$contact->lastname}</td>
						<td align="left">{$contact->email}</td>
						<td width="1%" align="center" nowrap="nowrap"><a class="btn btn-sm btn-success" href="contacts/edit/{$contact->id}" title="edit">edit</a></td>
						<td width="1%" align="center" nowrap="nowrap"><a class="btn btn-sm btn-danger" href="contacts/delete/{$contact->id}" title="delete" onclick="return confirm('do_you_really_want_to_delete_this_contact ?')">delete</a></td>
					</tr>
					{/foreach}
				</tbody>
			</table>
			{else}<h4>no_contact</h4>{/if}
			<div class="panel-footer">
				<div class="btn-group pull-right">
					<a href="contacts/search" class="btn btn-success">search</a>
					<a href="contacts/add" class="btn btn-primary">add_a_contact</a>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
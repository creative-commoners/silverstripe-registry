$Content

<div id="{$DataClass}_searchform" class="searchForm">
	$RegistryFilterForm
</div>

<a class="historyFeedLink" href="registry-feed/latest/{$DataClass}" title="View imported data history">View imported data history</a>

<div id="{$DataClass}_results" class="resultsContainer">
	<% if $RegistryEntries %>
		<table class="results" summary="Search results for $DataClass">
			<thead>
				<tr>
					<% loop $Columns %>
                        <th>
                            <% if $CanSort %>
                                <a href="$Top.QueryLink&amp;Sort={$Name}&amp;Dir={$Top.OppositeDirection}#results">$Title</a>
                            <% else %>
                                $Title
                            <% end_if %>
                        </th>
                    <% end_loop %>
				</tr>
			</thead>
			<tbody>
			<% loop $RegistryEntries %>
                <tr class="<% if $FirstLast %>$FirstLast <% end_if %>$EvenOdd">
                    <% loop $Top.Columns($ID) %>
                        <td><% if $Link %><a href="$Link">$Value</a><% else %>$Value<% end_if %></td>
                    <% end_loop %>
                </tr>
            <% end_loop %>
			</tbody>
		</table>

		<div class="resultActions">
			<a class="export" href="$Link(export)?$AllQueryVars" title="Export all results to a CSV spreadsheet file">Export results to CSV</a>
		</div>

		<% if $RegistryEntries.MoreThanOnePage %>
			<div class="pagination">
				<ul class="pageNumbers">
					<% if $RegistryEntries.NotFirstPage %>
						<li class="prev"><a href="$RegistryEntries.PrevLink" title="View the previous page">&lt;</a></li>
					<% end_if %>
					<% loop $RegistryEntries.PaginationSummary(5) %>
						<% if $CurrentBool %>
							<li class="active"><a href="$Link" title="View page number $PageNum">$PageNum</a></li>
						<% else_if $PageNum %>
							<li><a href="$Link" title="View page number $PageNum">$PageNum</a></li>
						<% else %>
							<li><span class="disabled">...</span></li>
						<% end_if %>
					<% end_loop %>
					<% if $RegistryEntries.NotLastPage %>
						<li class="next"><a href="$RegistryEntries.NextLink" title="View the next page">&gt;</a></li>
					<% end_if %>
				</ul>
			</div>
		<% end_if %>
	<% else %>
		<p class="noResults">No results to show.</p>
	<% end_if %>
</div>


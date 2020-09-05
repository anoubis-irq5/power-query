let
	Source = CAL_RollingCalendar_Staging,
	MergedQueries = Table.NestedJoin(
		Source, 
		{"Date"}, 
		CAL_WorkSheet, 
		{"Date"}, 
		"CAL_WorkSheet", 
		JoinKind.LeftOuter
	),
	ExpandedWorkSheet = Table.ExpandTableColumn(
		MergedQueries, 
		"CAL_WorkSheet", 
		{
			"Week", 
			"isWeekend", 
			"Day", 
			"Day_Year", 
			"Day_Week", 
			"Days_in_Month", 
			"Day_Short", 
			"Day_Long", 
			"Month", 
			"Month_Short", 
			"Month_Long", 
			"Year", 
			"Holidays"
		}, 
		{
			"Week", 
			"isWeekend", 
			"Day", 
			"Day_Year", 
			"Day_Week", 
			"Days_in_Month", 
			"Day_Short", 
			"Day_Long", 
			"Month", 
			"Month_Short", 
			"Month_Long", 
			"Year", 
			"Holidays"
		}
	)
in
	ExpandedWorkSheet
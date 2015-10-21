﻿update dbo.MonitoringSchedules
set ActiveInd = 0


declare @currentID int

EXEC [dbo].[uspConfigureMonitoring]
	@TaskType = 'Check Connector Deploys'
	, @Email_To = 'jeff.solomon@arcadiasolutions.com'
	, @Content_Type = 'HTML'
	, @IsExternalEmail = 0
	, @IsInternalEmail = 1
	, @ID = @currentID output

EXEC dbo.uspConfigureMonitoringSchedules 
	@MonitoringProcedure_ID = @currentId
	, @ScheduleName = 'Daily'
	, @StartTime = '16:30'

EXEC dbo.uspConfigureMonitoringSchedules 
	@MonitoringProcedure_ID = @currentId
	, @ScheduleName = 'Daily'
	, @StartTime = '9:00'

EXEC [dbo].[uspConfigureMonitoring]
	@TaskType = 'SendFileReceivedNotification'
	, @Source = 'PR-LAORIED'
	, @Environment = 'PRD'
	, @Email_From = null
	, @Email_To = 'jeff.solomon@arcadiasolutions.com'
	, @Email_CC = null
	, @Content_Type = 'HTML'
	, @IsExternalEmail = 0
	, @IsInternalEmail = 1
	, @AdditionalParameters = 'Group=GR-LAED,DoNotSend=0'
	, @ID = @currentID output
	

EXEC dbo.uspConfigureMonitoringSchedules 
	@MonitoringProcedure_ID = @currentId
	, @ScheduleName = 'Daily'
	, @StartTime = '11:00' 


USE msdb;
GO

EXEC dbo.sp_add_job
@job_name = 'FullBackupNew';
GO

DECLARE @full_name_new VARCHAR(500)
SET @full_name_new = 'C:\SQLBackups\AdventureWorks\Full\full' + SYSDATETIME() +'.bak';


EXEC sp_add_jobstep
@job_name = 'FullBackupNew',
@step_name = 'WeeklyFullBackupNew_step',
@subsystem = 'TSQL',
@command = 'BACKUP DATABASE AdventureWorks2017 TO DISK = @full_name_new WITH INIT, RETAINDAYS = { 31 |  CONVERT(nvarchar(30), GETDATE(), 110) }',
@retry_attempts = 5,
@retry_interval = 5;
GO

EXEC sp_add_schedule
@schedule_name = 'WeeklyBackupNewSchedule',
@freq_type = 8,
@freq_interval = 32,
@freq_recurrence_factor = 1,
@active_start_time = 235900;
GO

EXEC sp_attach_schedule
@job_name = 'FullBackupNew',
@schedule_name = 'WeeklyBackupNewSchedule';
GO
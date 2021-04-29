USE msdb;

GO

EXEC dbo.sp_add_job@job_name= ' MSDBBackup';

GO

DECLARE @full_name_new VARCHAR(1000);
SET @full_name_new = 'C:\SQLBackups\AdventureWorks\Full\full' + CONVERT(nvarchar(30), GETDATE(), 111) +'.bak';

EXEC sp_add_jobstep

@job_name = ‘MSDBBackupJob',

@step_name = ‘MSDB Full Backup',

@subsystem = 'TSQL',

@command = 'BACKUP DATABASE AdventureWorks2017 TO DISK = @full_name_new WITH INIT',

@retry_attempts = 5,

@retry_interval = 5 ;

GO

EXEC sp_add_schedule

@schedule_name = ‘MSDBBackup' ,

@freq_type = 4,

@freq_interval = 62,

@active_start_time = 235900 ;

GO

EXEC sp_attach_schedule

@job_name = ’MSDBBackup',

@schedule_name = ‘MSDBBackup' ;

GO
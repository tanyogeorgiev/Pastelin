
        DECLARE @variableInt        INT,
                @variableString     VARCHAR(30)


        SET     @variableInt    = 23
        SET     @variableString = '100'

        SELECT  TOP 1
                CurrentDate = GETDATE(),
                SomeText    = N'Some strings' + CHAR(13) + CHAR(10) + 'Another string....',
                UserId      = CURRENT_USER,
                UserSPID    = @@SPID,
                SomeCalcs   = 2/2 + @variableInt + CONVERT(INT,LEFT(@variableString,2)),
                SomeNulls   = ISNULL(NULL,'this is null')

        FROM    sys.all_columns AS c
                LEFT OUTER JOIN sys.all_objects AS o
                ON c.[object_id] = o.[object_id]

        WHERE   @variableInt IS NOT NULL
        /* ORDER BY something */
        ORDER BY c.name;

        -- And another comment line 

        EXEC sys.sp_help;
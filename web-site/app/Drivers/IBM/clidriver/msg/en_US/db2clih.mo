  H	         T      �   T      �  T      <  T      =  T      �  T      �  T   d   �  T   e     T   f   �  T   g   �	  T   h   �
  T   i   �  T   j   �  T   k   J  T   l   O  T   m     T   n   6  T   o   L  T   p   �  T   q   �  T   r   �  T   s   o  T   t   ?  T   u   �  T   v   �  T   w   W  T   x     T   y   
  T   z     T   {   �  T   |   Y  T   }   y  T   ~   4  T         T   �   �   T   �   �!  T   �   �&  T   �   Y'  T   �   �'  T   �   �(  T   �    )  T   �   *  T   �   �*  T   �   $+  T   �   �+  T   �   C,  T   �   �,  T   �   q-  T   �   .  T   �   �.  T   �   4/  T   �   �/  T   �   E0  T   �   �0  T   �   ^1  T   �   �1  T   �   �2  T   �   23  T   �   4  T   �   �4  T   �   V5  T   �   �6  T   �   37  T   �   �7  T   �   U8  T   �   �8  T   �   9  T   �   :  T   �   �:  T   �   �;  T   �   <  T   �   =  T   �   _>  T   �   �?  T   �   �A  T   �   �B  T   �   �C  T   �   �D  T   �   �E  T   �   iF  T   �   �F  T   �   �G  T   �   �H  T   �   �I  T   �   aJ  T   �   `K  T   �   �L  T   �   hM  T   �   �N  T   �   pO  T   �   �P  T   �   AR  T   �   8V  T   �   KX  T   �   MY  T   �   [  T   �   s\  T   �   �]  T   �   �^  T   �   �_  T   �   !e  T   �   �g  T   �   �k  T   �    p  T   �   �r  T   �   �s  T   �   �v  T   �   ;{  T   �   i�  T   �   w�  T   �   �  T   �   ��  T   �   D�  T   �   K�  T   �   �  T   �   ݩ  T   �   ɮ  T   �   ��  T   �   �  T   �   λ  T   �   W�  T   �   ��  T   �   �  T   �   ��  T   �   ��  T   �   �  T   �   ��  T   �   ��  T   �   ��  T   �   f�  T   �   ��  T   �   h�  T   �   E�  T   �   @�  T   �   s�  T   �   ��  T   �   �  T   �   R T   �    T   �   S T   �   
 T   �   � T   �   � T   �   � T   �   l T   �   �  T   X  �' T   Y  j( T   Z  Z) T   [  /* T   \  ;+ T   ]  q, T   ^  . T   _  =/ T   `  ;0 T   a  	1 T   b  �1 T   c  �2 T   d  �3 T   e  �4 T   f  �5 T   g  �6 T   h  b7 T   i  8 T   j  �8 T   k  y9 T   l  �: T   o  y; T   p  v< T   q  _= T   r  �> T   s  �? T   t  d@ T   u  �A T   v  LB T   w  4C T   x  �C T   y  �D T   z  �E T   {  �F T   |  NG T   }  �H T   ~  I T     �I T   �  .J T   �  �J T   �  rK T   �  L T   �  �L T   �  AM T   �  �N T   �  NQ T   �  S T   �  XT T   �  �U T   �  -V T   �  W T   
CLI0001W  Disconnect error.

Explanation: 

An error occurred during the disconnect. However, the disconnect
succeeded.

User response: 

Validate that the communication between the client and the server are
still active.

 
CLI0002W  Data truncated.

Explanation: 

An output buffer specified is not large enough to contain the data.

User response: 

Increase the size of the output buffer.

 
CLI0003W  Privilege not revoked.

Explanation: 

The statement was a REVOKE statement and the user did not have the
specified privilege.

User response: 

No action needed.

 
CLI0004W  Invalid connection string attribute.

Explanation: 

An invalid or unsupported connection string attribute was specified in
the connection string but the driver was able to connect to the data
source anyway.

User response: 

No action needed.

 
CLI0005W  Option value changed.

Explanation: 

The driver did not support the specified option value and substituted a
similar value.

User response: 

No action needed.

 
CLI0006W  SQLCancel treated like a close.

Explanation: 

The SQLCancel call was treated like a SQLFreeStmt call with the
SQL_CLOSE option.

User response: 

No action needed.

 
CLI0008I  Capture mode terminated.

Explanation: 

If the message is received at connect time when running in either
capture or match modes, SQL statements are not captured into or matched
from the capture file. This can be due to incorrectly configured
mandatory db2cli.ini keywords. If the message is received at disconnect
time, this is considered normal processing.

User response: 

Ensure that the mandatory static capture or static match db2cli.ini
keywords (StaticMode, StaticPackage, StaticCapFile) are properly
configured as specified in the documentation.

 
CLI0100E  Wrong number of parameters.

Explanation: 

The number of parameters specified in SQLSetParam or SQLBindParameter
was less than number of parameters in the SQL statement.

User response: 

Respecify the SQL statement or provide more input parameters through
SQLSetParam or SQLBindParameter.

 
CLI0101E  The statement did not return a result set.

Explanation: 

The previous statement does not result in a result set.

User response: 

Respecify the SQL statement.

 
CLI0102E  Invalid conversion.

Explanation: 

The conversion between the application data type and SQL data type is
not supported by the driver.

User response: 

Respecify a data conversion which is supported by the driver.

 
CLI0103E  Too many columns.

Explanation: 

The number of columns specified in SQLBindCol is greater than the number
of columns in the current result set.

User response: 

Respecify the SQL statement or reset the bound column information in
SQLBindCol.

 
CLI0104E  Unable to connect to data source.

Explanation: 

The driver was unable to establish a connection with the data source.

User response: 

Ensure the server is started and that the communications between the
client and server are correct.

 
CLI0105E  Connection in use.

Explanation: 

The specified connection handle is already being used and the connection
is still opened.

User response: 

Allocate a new connection using SQLAllocConnect and retry the connection
or terminate the existing connection.

 
CLI0106E  Connection is closed.

Explanation: 

The connection specified by the connection handle is no longer active.

User response: 

Establish a new connection.

 
CLI0107E  Connection failure during transaction.

Explanation: 

The connection failed during the execution of the function and it cannot
be determined whether the COMMIT or ROLLBACK occurred before the
failure.

User response: 

Establish a new connection.

 
CLI0108E  Communication link failure.

Explanation: 

The connection between the driver and the data source failed during
execution of this function.

User response: 

Establish a new connection.

 
CLI0109E  String data right truncation.

Explanation: 

The data specified through SQLSetParam or SQLBindParameter is larger
than the maximum size allowed for the corresponding use of a parameter
marker.

User response: 

Respecify the parameter using SQLSetParam or SQLBindParameter.

 
CLI0110E  Invalid output or indicator buffer specified.

Explanation: 

The returned data was NULL but the output or indicator buffer specified
was a NULL buffer.

User response: 

Respecify the output or indicator buffer supplying a non-NULL buffer and
retry the operation.

 
CLI0111E  Numeric value out of range.

Explanation: 

Returning the numeric data would have caused the whole part of the
number to be truncated.

SQLPutData was called more than once for a parameter and the input data
was not of type character or binary.

User response: 

Respecify the output bindings either through SQLBindCol or SQLGetData to
avoid creating a numeric data truncation.

Do not call SQLPutData for a parameter if the application data type
specified for that parameter through SQLSetParam or SQLBindParameter is
not SQL_C_CHAR or SQL_C_BINARY.

 
CLI0112E  Error in assignment.

Explanation: 

The data sent for a parameter or column was incompatible with the data
type of the associated table column.

User response: 

Respecify the output binding through SQLBindCol or SQLGetData or the
input binding through SQLSetParam or SQLBindParameter.

 
CLI0113E  Invalid date/time format.

Explanation: 

The data sent for a date/time field was invalid. An invalid datetime
format was detected; that is, an invalid string representation or value
was specified.

User response: 

Respecify the date data.

 
CLI0114E  Datetime field overflow.

Explanation: 

The data sent for a date, time, or timestamp parameter, or column, was
invalid.

User response: 

Respecify the date, time, or timestamp data.

 
CLI0115E  Invalid cursor state.

Explanation: 

The statement is not positioned on a row.

User response: 

Position the statement on a row by calling SQLFetch or SQLExtendedFetch
and retry the operation.

 
CLI0116E  Invalid transaction state.

Explanation: 

There was a transaction in progress when SQLDisconnect was called.

User response: 

Call SQLTransact before calling SQLDisconnect.

 
CLI0117E  Invalid cursor name.

Explanation: 

An invalid or duplicate cursor name was specified in SQLSetCursorName.

User response: 

Respecify a valid cursor name through SQLSetCursorName.

 
CLI0118E  Invalid SQL syntax.

Explanation: 

An invalid or incorrect SQL statement was specified.

User response: 

Respecify a valid SQL statement.

 
CLI0119E  Unexpected system failure.

Explanation: 

An unexpected system failure occurred while processing the function.

User response: 

Restart the application and try again.

 
CLI0120E  Memory allocation failure.

Explanation: 

The driver was unable to allocate memory required to support execution
or completion of the function.

User response: 

Verify that your system has enough memory to complete the desired
operation.

 
CLI0121E  Invalid column number.

Explanation: 

The value specified in iCol is less than zero, greater than the number
of columns in the result set, or greater than the maximum number of
columns allowed in a result set.

User response: 

Respecify a valid value for iCol.

 
CLI0122E  Program type out of range.

Explanation: 

The value specified for fCType is not valid.

User response: 

Respecify a valid value for fCType.

 
CLI0123E  SQL data type out of range.

Explanation: 

The value specified for fSQLType is not valid.

User response: 

Respecify a valid value for fSQLType.

 
CLI0124E  Invalid argument value.

Explanation: 

The value specified for an argument was invalid. Possible reasons may be
a null pointer, invalid length, invalid option, etc.

User response: 

Re-examine the argument passed in to the function and determine which
argument is invalid.

 
CLI0125E  Function sequence error.

Explanation: 

This function was called in an invalid sequence.

User response: 

Correct the sequence in your application and retry the operation.

 
CLI0126E  Operation invalid at this time.

Explanation: 

The operation the system is trying to perform is invalid at this time.

User response: 

Correct the sequence of operation and retry the operation.

 
CLI0127E  Invalid transaction code.

Explanation: 

The transaction option specified in SQLTransact was not SQL_COMMIT or
SQL_ROLLBACK.

User response: 

Specify either SQL_COMMIT or SQL_ROLLBACK and retry the operation.

 
CLI0128E  Unexpected memory handling error.

Explanation: 

Memory handling error.

User response: 

An unexpected error occurred in the driver while handling some internal
memory buffer. Restart your application.

 
CLI0129E  An attempt to allocate a handle failed because there are no
      more handles to allocate.

Explanation: 

A CLI handle is a variable that refers to a data object allocated and
managed by DB2 CLI. There are four types of handles in CLI:

*  Environment handle

*  Connection handle

*  Statement handle

*  Descriptor handle

This message is returned when all handles that can be allocated have
been allocated, and an attempt is made to allocate a handle using one of
the following functions:

*  SQLAllocEnv

*  SQLAllocConnect

*  SQLAllocStmt

*  SQLAllocHandle

*  SQLExecute

*  SQLExecDirect

User response: 

Free handles that are no longer being used in the application by calling
SQLFreeEnv, SQLFreeConnect, or SQLFreeStmt, or SQLFreeHandle.

To reduce the incidence of this error take one or both of the following
actions:

*  Modify the application to release handles more frequently.

*  Increase the number of statement handles that can be allocated by
   increasing the CLIPkg CLI/ODBC configuration parameter using the BIND
   command.


   Related information:
   Handles in CLI
   SQLFreeHandle function (CLI) - Free handle resources
   BIND command
   CLIPkg CLI/ODBC configuration keyword

 
CLI0130E  No cursor name available.

Explanation: 

There was no open cursor on the statement and no cursor had been set
with SQLSetCursorName.

User response: 

Specify a cursor name through SQLSetCursorName.

 
CLI0131E  Invalid string or buffer length.

Explanation: 

The length of the buffer specified is invalid.

User response: 

Specify a valid buffer length.

 
CLI0132E  Descriptor type out of range.

Explanation: 

The description type specified is not valid.

User response: 

Specify a valid descriptor type.

 
CLI0133E  Option type out of range.

Explanation: 

The option type specified is not valid.

User response: 

Specify a valid option type.

 
CLI0134E  Invalid parameter number.

Explanation: 

The number specified for the parameter number is less than zero or
greater than the maximum parameter supported by the data source.

User response: 

Specify a valid parameter number.

 
CLI0135E  Invalid scale value.

Explanation: 

The scale value specified is invalid.

User response: 

Specify a valid scale value.

 
CLI0136E  Function type out of range.

Explanation: 

The function type is invalid.

User response: 

Specify a valid function type value.

 
CLI0137E  Information type out of range.

Explanation: 

The information type is invalid.

User response: 

Specify a valid information type value.

 
CLI0138E  Column type out of range.

Explanation: 

The column type is invalid.

User response: 

Specify a valid column type value.

 
CLI0139E  Scope type out of range.

Explanation: 

The scope type is invalid.

User response: 

Specify a valid scope type value.

 
CLI0140E  Uniqueness option type out of range.

Explanation: 

The uniqueness option type is invalid.

User response: 

Specify a valid uniqueness option type value.

 
CLI0141E  Accuracy option type out of range.

Explanation: 

The accuracy option type is invalid.

User response: 

Specify a valid accuracy option type value.

 
CLI0142E  Direction option out of range.

Explanation: 

The direction option is invalid.

User response: 

Specify a valid direction option value.

 
CLI0143E  Invalid precision value.

Explanation: 

The precision value is invalid.

User response: 

Specify a valid precision value.

 
CLI0144E  Invalid parameter type.

Explanation: 

The parameter type is invalid.

User response: 

Specify a valid parameter type value.

 
CLI0145E  Fetch type out of range.

Explanation: 

The fetch type is invalid.

User response: 

Specify a valid fetch type value.

 
CLI0146E  Row value out of range.

Explanation: 

The row value is invalid.

User response: 

Specify a valid row value.

 
CLI0147E  Concurrency option out of range.

Explanation: 

The concurrency option is invalid.

User response: 

Specify a valid concurrency option value.

 
CLI0148E  Invalid cursor position.

Explanation: 

The cursor position is invalid.

User response: 

Specify a valid cursor position value.

 
CLI0149E  Invalid driver completion.

Explanation: 

The driver completion is invalid.

User response: 

Specify a valid driver completion value.

 
CLI0150E  Driver not capable.

Explanation: 

The operation is valid but not supported by either the driver or the
data source.

User response: 

Specify a valid operation.

 
CLI0151E  No data pending.

Explanation: 

SQLParamData or SQLPutData was called but there is no data at execute
pending on this statement.

User response: 

Respecify the parameters through SQLSetParam or SQLBindParameter.

 
CLI0152E  Not a string value.

Explanation: 

The function expected a string argument to be supplied.

User response: 

Respecify the argument to the function.

 
CLI0153E  Invalid file name length.

Explanation: 

The length specified for the file name is invalid.

User response: 

Specify a valid file name length.

 
CLI0154E  Invalid connection state.

Explanation: 

An attempt to change the connection type was made but the connection or
another connection (in the case of Distributed Unit of Work) is already
opened.

User response: 

Do not attempt to change the connection type once the connection is
opened.

 
CLI0155E  File name length is too long.

Explanation: 

The length supplied for the file name is greater than supported.

User response: 

Specify a valid file name length.

 
CLI0156E  Error closing a file.

Explanation: 

An unexpected condition occurred while closing a file.

User response: 

Retry the operation.

 
CLI0157E  Error opening a file.

Explanation: 

An unexpected condition occurred while opening a file.

User response: 

Retry the operation.

 
CLI0158E  Error writing to a file.

Explanation: 

An unexpected condition occurred while writing to a file.

User response: 

Retry the operation.

 
CLI0159E  Error deleting a file.

Explanation: 

An unexpected condition occurred while deleting a file.

User response: 

Retry the operation.

 
CLI0164E  Nullable type out of range.

Explanation: 

An invalid nullable value was specified.

User response: 

Respecify the nullable value.

 
CLI0165E  Error in row.

Explanation: 

An error occurred while fetching one or more rows. (Function returns
SQL_SUCCESS_WITH_INFO.)

User response: 

Retry the operation.

 
CLI0166E  PARMLIST syntax error.

Explanation: 

The PARMLIST value in the stored procedures catalog table contains a
syntax error.

User response: 

Respecify the row for this stored procedure.

 
CLI0167E  Operation was cancelled.

Explanation: 

SQLCancel was called on the statement.

User response: 

Resubmit the operation.

 
CLI0171E  The database was unable to connect. Reason: "<reason-text>".

Explanation: 

The database connection failed. The 'Reason:' will explain why the
database was unable to connect.

User response: 

Fix the problem, and try the connect again.

 
CLI0172E  The database was unable to connect. Would you like to continue
      with the configuration? Reason: "<reason-text>".

Explanation: 

The database connection failed. The 'Reason:' will explain why the
database was unable to connect.

User response: 

Fix the problem, and try the connect again or continue with the
configuration.

 
CLI0175E  No ODBC Driver Manager has been found. Cannot open
      ODBCINST.INI file.

Explanation: 

Neither one of the Visigenic or the Intersolv ODBC Driver Managers have
been installed. An ODBC Driver Manager must be present before the DB2
ODBC Driver can be registered into the associated ODBCINST.INI file.

User response: 

Install an ODBC Driver Manager, and try running this command again.

 
CLI0176E  Unable to write to the ODBCINST.INI file.

Explanation: 

An error has occurred while writing to an ODBCINST.INI file to be used
with an ODBC Driver Manager. This may be due to invalid format of the
original ODBCINST.INI file.

User response: 

Rename the existing ODBCINST.INI file to something else and try running
this command again. If this error persists, contact your technical
support.

 
CLI0177E  Cannot determine where the IBM Data Server Client is
      installed.

Explanation: 

An error has occurred while trying to locate where the IBM Data Server
Client is installed.

User response: 

Check that the IBM Data Server Client has been correctly installed.

 
CLI0178I  The DB2 ODBC Driver has been successfully registered.

Explanation: 

The DB2 ODBC Driver has been registered with the installed ODBC Driver
Manager(s).

User response: 

The user can now use the appropriate ODBC Administrator tool from the
ODBC Driver Manager vendor to configure the ODBC data sources.

 
CLI0179E  Unable to display dialog box.

Explanation: 

The DB2 ODBC Driver cannot open a dialog box with the window handle
provided by the application.

User response: 

The application must pass a valid window handle.

 
CLI0180E  Invalid bookmark value.

Explanation: 

The argument fFetchOrientation was SQL_FETCH_BOOKMARK and the bookmark
pointed to by te value SQL_ATTR_FETCH_BOOKMARK_PTR statement attribute
was not valid.

User response: 

Re-specify a valid bookmark value.

 
CLI0181E  Invalid descriptor index.

Explanation: 

The value specified for the column number argument is invalid.

User response: 

Re-specify a valid column number.

 
CLI0182W  Fractional truncation.

Explanation: 

The data for one of the columns was truncated.

User response: 

None needed.

 
CLI0183E  Associated statement is not prepared.

Explanation: 

The descriptor handle was associated with an IRD, and the associated
statement handle was not in a prepared state.

User response: 

Prepare the statement associated with the descriptor.

 
CLI0184E  Cannot modify an implementation row descriptor.

Explanation: 

The descriptor handle was associated with an IRD, and IRD record fields
cannot be updated.

User response: 

Specify a valid descriptor and field.

 
CLI0185E  Invalid use of an automatically allocated descriptor handle.

Explanation: 

Only explicit descriptors allocated using the SQLAllocHandle function
can be used in this manner.

User response: 

Use an explicitly allocated descriptor.

 
CLI0186E  Server declined cancel request.

Explanation: 

Communication errors caused the server to decline the cancel request.

User response: 

None needed.

 
CLI0187E  Non-character and non-binary data sent in pieces.

Explanation: 

SQLPutData was called more than once for a column that was not a
character or binary column.

User response: 

Only call SQLPutData once for non-character and non-binary data.

 
CLI0188E  Attempt to concatenate a null value.

Explanation: 

A previous call to SQLPutData for this parameter specified an input
buffer length of SQL_NULL_DATA

User response: 

Call SQLPutData with a valid input buffer length or ensure SQLPutData is
called the correct number of times.

 
CLI0189E  Inconsistent descriptor information.

Explanation: 

The associated descriptor failed a consistency check.

User response: 

Ensure that descriptor fields are valid, and all interdependent fields
are set correctly.

 
CLI0190E  Descriptor invalid on indirect reference.

Explanation: 

The descriptor handle was invalid, or the TYPE, OCTECT_LENGTH, DATA_PTR,
INDICATOR_PTR, or OCTECT_LENGTH_PTR field of the ARD contained an
invalid value.

User response: 

Ensure the indirect descriptor handle is valid and that the deferred
fields are set correctly.

 
CLI0191E  Invalid attribute value.

Explanation: 

The value given was not correct for the specified attribute.

User response: 

Use a correct value for the specified attribute.

 
CLI0192E  Invalid database alias specified.

Explanation: 

You have specified an invalid or non-existent database alias name
through the -d parameter of the DB2CAP command.

User response: 

Specify the name of an existing database alias. To find out which
databases are currently catalogued, use the LIST DATABASE DIRECTORY
command.

 
CLI0193E  Capture file "<capture-file-name>" not found or in use.

Explanation: 

DB2CAP is unable to open the file <capture-file-name> that you
specified as a BIND parameter value. Either the file does not exist or
some other process is using it exclusively.

User response: 

Specify the name of an existing capture file or wait until the file is
released by the other process.

 
CLI0194E  Command syntax error. The correct syntax is: db2cap [-h | -?]
      bind capture-file -d db-alias [-u userid [-p password]] [-tn tenantName]

Explanation: 

The parameters of the DB2CAP command, as well as the command name
itself, must be typed exactly as shown in the syntax diagram provided.
They are case-sensitive on UNIX platforms and case-insensitive on Intel
platforms. There must be at least one space between the parameter and
its value. For example: -u userid is correct, but -uuserid is incorrect.

In the syntax diagram, square brackets ([ ]) denote optional parameters.
If you specify the userid but omit the password, you will be prompted to
enter the password, in which case it won't be visible when you type it.

If you specify the -h or -? parameter, the command will display the
syntax help and no other parameter will be processed.

If -tn option is not specified, it is SYSTEM tenant by default.

User response: 

Make sure the syntax of the command is as described in the diagram.

 
CLI0195E  Invalid capture file: does not contain any valid statement
      groups.

Explanation: 

A valid capture file must contain at least one valid statement group.

User response: 

Re-capture the application using the same capture file and make sure
that at least one SQL statement was captured, or edit the capture file
and add statement groups manually. When adding a statement group
manually, make sure you specify all the required keywords for the type
of SQL statement you are adding. Then submit your request again.

 
CLI0196E  Switch user operation invalid at this time.

Explanation: 

The application cannot switch the user within a unit of work.

User response: 

Correct the sequence of operation. The application must switch the user
before beginning a unit of work.

 
CLI0197E  A trusted context is not enabled on this connection. Invalid
      attribute value.

Explanation: 

The attribute SQL_ATTR_TRUSTED_CONTEXT_USERID or
SQL_ATTR_TRUSTED_CONTEXT_PASSWORD cannot be set to reuse a trusted
connection before an initial trusted connection has been established.

User response: 

Ensure that the SQL_ATTR_USE_TRUSTED_CONTEXT has been set to enable the
trusted context and that a trusted connection has been established.

 
CLI0198E  Missing trusted context userid.

Explanation: 

The attribute, SQL_ATTR_TRUSTED_CONTEXT_PASSWORD was set without
providing the required attribute, SQL_ATTR_TRUSTED_CONTEXT_USERID.

User response: 

Ensure that when setting the attribute,
SQL_ATTR_TRUSTED_CONTEXT_PASSWORD that the
SQL_ATTR_TRUSTED_CONTEXT_USERID attribute is also set.

 
CLI0199E  Invalid connection string attribute.

Explanation: 

An invalid or unsupported connection string attribute was specified in
the connection string. The driver was unable to establish a connection
with the data source.

User response: 

Specify a valid connection string attribute and retry.

 
CLI0200E  Invalid DSN value.

Explanation: 

The value attempting to be used for the DSN in the connection string or
connection API is invalid.

The driver did not attempt a connection with the data source.

User response: 

Specify a valid DSN and retry.

 
CLI0201E  Invalid database value.

Explanation: 

The database name or database alias in the connection string or
connection API is invalid.

The driver did not attempt a connection with the data source.

User response: 

Specify a valid database name and retry.

 
CLI0202E  Error opening the CLI Client Optimization feature capture
      file.

Explanation: 

CLI Client Optimization feature is unable to open the file specified in
the pureQueryXML CLI parameter value. Either the file does not have the
correct permissions or some other process is using it exclusively.

The CLI Client Optimization feature is enabled when either "captureMode"
or "executionMode" CLI keywords are specified.

The pureQueryXML CLI keyword specifies the capture file location using
either an absolute path or a relative path to the directory location
where the CLI application is running.

During the capture phase of the Client Optimization feature, the capture
file can either exist or not exist in the location specified. If the
file exists, the Client Optimization feature will require read and write
permission to the capture file. If the files does not exist, the Client
Optimization feature will require write permission to the directory to
create the file.

During the match phase of the Client Optimization feature, the capture
file must exist and the Client Optimization feature will require read
permission to the specified file.

CLI will return an error if any of these permissions are not available.

User response: 

Specify the name of a capture file with appropriate permissions for the
pureQueryXML CLI keyword or disable the Client Optimization feature.

 
CLI0203E  Client Optimization feature is not supported when static
      profiling is enabled in the DB2 CLI driver.

Explanation: 

The DB2 CLI driver static profiling function cannot be used with the
Client Optimization feature. CLI does not allow enabling both Client
Optimization and the static profiling function simultaneously for a
given database connection.

User response: 

Use the Client Optimization feature or the DB2 CLI driver static
profiling function. Client Optimization can be disabled by removing the
captureMode and executionMode CLI keywords. DB2 CLI driver static
profiling can be disabled by removing the StaticMode CLI keyword.

 
CLI0204E  Dynamic execution of SQL statement is not allowed.

Explanation: 

The Client Optimization feature failed to find a matching SQL statement
in the pureQueryXml capture file when executionMode CLI keyword is set
to STATIC and the allowDynamicSQL CLI keyword value is FALSE. Dynamic
execution is not allowed with this configuration.

If a CLI application is expected to run any SQL statement dynamically,
specifying a value of TRUE for allowDynamicSQL will enable an SQL
statement to run dynamically if no matching statement found in the
pureQueryXml capture file.

Alternatively, an incremental capture phase may be used to refresh the
pureQueryXml capture file to include any missing SQL statement. This
capture phase must be followed by a Configure phase and a StaticBinder
phase of the Client Optimization feature before the application can be
run with an executionMode value of STATIC.

User response: 

Specify a value of TRUE for allowDynamicSQL keyword or refresh the
pureQueryXml capture file to include the SQL statement.

 
CLI0205E  Cannot find library db2clixml4c.

Explanation: 

db2clixml4c cannot be found in the library path.

The library path is defined by the environment variable for the
following operating systems:

AIX (Java 1.1)

         LD_LIBRARY_PATH

AIX (Java 1.2 or later)

         LIBPATH

HP-UX

         SHLIB_PATH

Linux

         LD_LIBRARY_PATH

Silicon Graphics IRIX

         LD_LIBRARY_PATH

Solaris Operating Environment

         LD_LIBRARY_PATH

Windows operating systems

         PATH

The db2clixml4c library is dynamically loaded if a CLI application has
requested to use the Client Optimization feature. CLI attempts to locate
this library from the library path. The DB2 CLI drivers include this
library in the default library path when installed. If the db2clixml4c
library cannot be located, the Client Optimization feature may be
disabled by removing the captureMode and executionMode CLI keywords.

User response: 

Ensure your application environment is configured correctly to use DB2.
On UNIX platforms, ensure that the sqllib/db2profile script has been run
to set your environment variables.

 
CLI0206E  Unable to read an element of the pureQueryXml capture file.

Explanation: 

The Client Optimization feature reads the pureQueryXml capture file. If
one or more entries in this file are corrupted or invalid, the Client
Optimization feature cannot proceed.

Any manual changes made to pureQueryXml capture file, may cause this
error. If the file is not modified and it was completely generated by
the CLI driver or the Configure tool, please contact IBM technical
support for further help.

User response: 

Ensure that the pureQueryXml capture file is correct or recapture the
pureQueryXml capture file.

 
CLI0207E  Invalid file extension for pureQueryXml capture file.

Explanation: 

The pureQueryXml capture file must have a file extension of "xml" or
"pdqxml".

User response: 

Specify a file with a supported file extension for the pureQueryXml CLI
keyword.

 
CLI0208E  The codepage could not be set for this connection because the
      connection is part of an XA environment.

Explanation: 

Setting the codepage at the connection level is not supported in an XA
environment.

This message is returned when an application attempts to set the
connection attribute SQL_ATTR_CLIENT_CODEPAGE after a call to xa_open
has been made.

The codepage was not changed.

User response: 

Respond to this message in one of the following ways: To open the
connection without changing the codepage, reopen the connection without
specifying the SQL_ATTR_CLIENT_CODEPAGE connection attribute. To change
the codepage, use the DB2CODEPAGE environment variable.


   Related information:
   Connection attributes (CLI) list
   X/Open distributed transaction processing model

 
CLI0209E  The application failed to execute the query because the
      capturedOnly keyword is set to TRUE but client optimization found
      no matching statements in the pureQueryXML capture file.

Explanation: 

You can improve SQL and XQuery performance by collecting SQL and XQuery
statements into pureQueryXML capture files.

To run only the matching statements in the pureQueryXML files, you can
set the capturedOnly keyword to TRUE. SQL statements that are not in the
pureQueryXML file will not be executed when the capturedOnly keyword to
TRUE.

This message is returned when the capturedOnly keyword is set to TRUE,
but there are no matching statements in the pureQueryXML file.

User response: 

To use client optimization with a pureQueryXML file, perform the
following steps:
1. Capture SQL and XQuery statements into a pureQueryXML file by
   performing the following steps:
   1. Begin capturing mode by setting the captureMode property to ON.

   2. Run all logical paths that contain the SQL or XQuery statements
      that you want to capture.

   3. End capturing mode by setting the captureMode property to OFF.

2. Re-run the application.

 
CLI0210E  The statement could not be executed because the code page of
      the parameter markers or result set columns does not match the
      code page that is currently specified in the
      SQL_ATTR_OVERRIDE_CHARACTER_CODEPAGE connection attribute.

Explanation: 

In general, when the code page of a client application differs from the
code page of the database server to which the application is connected,
character conversion happens automatically when data is inserted or
retrieved.

You can override this automatic behavior for parameterized insert and
update operations and for fetching query results using the connection
attribute SQL_ATTR_OVERRIDE_CHARACTER_CODEPAGE. When the code page of a
statement's parameter markers or result set columns matches the value of
SQL_ATTR_OVERRIDE_CHARACTER_CODEPAGE, no character conversion happens
when that statement is executed.

This message is returned when an attempt is made to execute a statement
for which the describe information for parameter markers or result set
columns does not match the code page to which the connection attribute
SQL_ATTR_OVERRIDE_CHARACTER_CODEPAGE is set.

User response: 

To insert or retrieve the data without character conversion, perform the
following steps:
1. Determine the code page indicated by the describe information for the
   parameter markers or result set columns of the current statement.

2. Free any statement handles associated with the current connection.

3. Set the connection attribute SQL_ATTR_OVERRIDE_CHARACTER_CODEPAGE to
   the same code page as the code page indicated by the describe
   information for the parameter markers or result set columns of the
   current statement.

4. Reallocate the current statement handle.

5. Execute the statement again.


   Related information:
   Connection attributes (CLI) list

 
CLI0211E  Configuring the specified property failed because the
      specified value is incompatible with existing property settings.

Explanation: 

You can improve the performance of your database application using
pureQuery client optimization. For example, you can use pureQuery client
optimization to substitute an SQL statement that executes very quickly
for an SQL statement that executes slowly without rewriting your
application.

The behavior of the pureQuery client optimization feature is controlled
by a collection of properties. For example, to enable the substitution
of SQL statements, you can set the enableDynamicSQLReplacement property
to TRUE. This message is returned when an attempt is made to set one of
these properties to a value that is not compatible with other, existing
property values.

This message is returned when an attempt is made to configure pureQuery
client optimization in one of the following incompatible combinations:

*  An attempt was made to enable both dynamic SQL replacement and
   capture mode.

   Dynamic SQL replacement is not supported when pureQuery is in capture
   mode. Specifically, enableDynamicSQLReplacement cannot be set to TRUE
   when captureMode is set to ON, and captureMode cannot be set to ON
   when enableDynamicSQLReplacement is set to TRUE.

*  An attempt was made to enable both static execution mode and capture
   mode.

   Static execution mode is not supported when pureQuery is in capture
   mode. Specifically, executionMode cannot be set to STATIC when
   captureMode is set to ON, and captureMode cannot be set to ON when
   executionMode is set to STATIC.

User response: 

Respond to this message in one of the following ways:

*  If you do not need to use the pureQuery client optimization feature,
   disable the feature by setting the following configuration:

   captureMode=OFF [or keep it unset]
   executionMode=DYNAMIC [or keep it unset]

*  To use the pureQuery client optimization feature, use the appropriate
   compatible combination of pureQuery client optimization feature
   properties:
   1. Enable either dynamic SQL replacement or capture mode, but not
      both:

      *  Enable dynamic SQL replacement with the following property
	 settings:

         enableDynamicSQLReplacement=TRUE
         captureMode=OFF [or keep it unset]

      *  Enable capture mode with the following property settings:

         captureMode=ON
         enableDynamicSQLReplacement=FALSE
         [or keep enableDynamicSQLReplacement unset]

   2. Enable capture mode or use static execution mode, but not both:

      *  Enable capture mode with the following property settings:

         captureMode=ON
         executionMode=DYNAMIC [or keep it unset]

      *  Use static execution mode with the following property settings:

         captureMode=OFF [or keep it unset]
         executionMode=STATIC


   Related information:
   Combinations of settings that are not valid for capturing SQL
   statements
   Steps to enable pureQuery client optimization
   pureQuery client optimization overview

 
CLI0212W  A seamless failover occurred during a connect or an execute
      request.

Explanation: 

A connection was lost or could not be established but a successful
reconnection was made during a connect or execute request.

When a connection failure is detected, the CLI driver attempts to
reconnect to another member or a member of another group to ensure the
error free operation of an application.

The request was completed successfully.

User response: 

No action is required.


   Related information:
   Non-Java client support for high availability on IBM data servers
   Connection attributes (CLI) list

 
CLI0213E  Retrieving the pureQueryXML file from the repository failed.

Explanation: 

pureQuery runtime uses the runtime group ID and the connection
information to determine the repository from where to retrieve the
pureQueryXML file.

The reasons why the pureQueryXML file that you indicated by using the
pureQueryXmlRepository or propertiesGroupId property cannot be retrieved
from the repository can be:

*  The repository indicated by the pureQueryXmlRepository property is
   not valid or is not accessible.

*  The runtime group id specified by the propertiesGroupId property is
   not a valid runtime group id or is not activated.

User response: 

Perform all the actions that apply to your case:

*  Ensure that you have access to the repository specified in the
   pureQueryXmlRepository property.

*  Ensure that the runtime group id specified in the propertiesGroupId
   property is activated.

*  If necessary, adjust the values of the pureQueryXmlRepository or
   propertiesGroupId property so that the pureQueryXML file can be
   accessed from the repository.


   Related information:
   Properties that control the location of pureQuery configuration
   information and captured SQL

 
CLI0214E  The propertiesGroupId property was not specified in the
      configuration file.

Explanation: 

The propertiesGroupId property was not set to the runtime group ID
defined in the repository for the pureQueryXML file.

pureQuery Runtime uses the runtime group ID and the connection
information to deterine the repository from where to retrieve the
pureQueryXML file. If the propertiesGroupId is not specified, the
pureQueryXML file cannot be retrieved from the repository.

User response: 

Set the propertiesGroupId property to the runtime group id defined in
the repository where the pureQueryXML file is stored.


   Related information:
   propertiesGroupId property

 
CLI0215E  The connection failed because pureQuery client optimization
      attempted to access the pureQueryXML capture file, but a valid
      file name was not specified with the pureQueryXML property.

Explanation: 

You can improve the performance of your database application using
pureQuery client optimization. For example, you can capture information
about SQL statements, as the statements run, into a pureQueryXML capture
file. That capture file (also known as the pureQueryXML file) can later
be used to execute the same SQL statements with improved performance.
The name of the pureQueryXML capture file is specified by using the
pureQueryXML property.

Client optimization can be configured and controlled by using a
collection of pureQuery-related properties, including the following
examples:

*  enableDynamicSQLReplacement - Setting enableDynamicSQLReplacement to
   "TRUE" causes alternative SQL statements that are in the pureQueryXML
   file to be executed.

*  executionMode - Setting executionMode to "STATIC" causes matching SQL
   statements that are in the pureQueryXML file to be executed
   statically.

This message is returned when an attempt is made to use pureQuery client
optimization functionality that requires the pureQueryXML file but the
name of the pureQueryXML file has not been specified.

User response: 

Specify the name of the pureQueryXML file with the pureQueryXML
property, and then run the application again.


   Related information:
   IBM InfoSphere Optim pureQuery Runtime documentation

 
CLI0217E  The pureQuery client optimization feature was unable to use
      the specified pureQueryXML capture file because the version of the
      capture file is not supported by CLI.

Explanation: 

You can improve SQL and XQuery performance by collecting information
about SQL and XQuery statements into pureQueryXML capture files. The
version of the pureQueryXML capture file is determined by the method
used to generate the capture file. Here are examples of ways to generate
a pureQueryXML capture file:

*  Using the db2cap command

*  Using the pureQuery utility called GeneratePureQueryXml

DB2 for Linux, UNIX, and Windows Call Level Interface (CLI) does not
support pureQueryXML capture files that are generated by the
GeneratePureQueryXml utlity.

This message is returned when a DB2 CLI application attempts to use
pureQuery client optimization with a pureQueryXML capture file that was
generated by the GeneratePureQueryXml utlity.

User response: 

Regenerate a pureQueryXML capture file using a method other than the
GeneratePureQueryXml utlity.


   Related information:
   Limitations when using pureQuery client optimization with CLI
   applications
   db2cap - CLI/ODBC static package binding tool command

 
CLI0219E  Certificate-based authentication failed because the DB2 client
      or data server driver was configured to use certificate-based
      authentication, but a password was also specified with the
      connection.

Explanation: 

You can use SSL client authentication, based on just a user ID, with
database servers using certificate-based authentication.
Certificate-based authentication allows you to use SSL client
authentication without the need to store and maintain database passwords
on the database client.

You can use certificate-based authentication by specifying configuration
parameters such as SSLClientKeystash or SSLClientKeystoreDBPassword in
your CLI configuration file, db2cli.ini, or in your data server driver
configuration file, db2dsdriver.cfg.

When certificate-based authentication is configured to supply
authentication information, a password cannot be specified in other ways
(such in the db2dsdriver.cfg configuration file, in the db2cli.ini
configuration file, or in the connection string.) This message is
returned when certificate-based authentication is configured to supply
authentication information, and a password is also specified in another
way.

User response: 

To authenticate using certificate-based authentication, perform the
following steps:
1. Specify either SSLClientKeystash or SSLClientKeystoreDBPassword in
   the CLI configuration file or the data server driver configuration
   file.

2. Verify that no password is specified in the db2dsdriver.cfg
   configuration file, in the db2cli.ini configuration file, or in the
   connection string.


   Related information:
   Configuring Secure Sockets Layer (SSL) support in a DB2 instance
   Secure Sockets Layer (SSL)

 
CLI0220E  Certificate-based authentication failed because two mutually
      exclusive configuration parameters were both specified.

Explanation: 

You can use certificate-based authentication by specifying either the
SSLClientKeystash configuration parameter or the
SSLClientKeystoreDBPassword configuration parameter in your CLI
configuration file, db2cli.ini, or in your data server driver
configuration file, db2dsdriver.cfg or in the connection string.

The configuration parameters SSLClientKeystash and
SSLClientKeystoreDBPassword are mutually exclusive. This message is
returned when the SSLClientKeystash configuration parameter and the
SSLClientKeystoreDBPassword configuration parameter are both specified
in either the CLI configuration file or the data server driver
configuration file.

User response: 

To authenticate using certificate-based authentication, specify either
the SSLClientKeystash configuration parameter or the
SSLClientKeystoreDBPassword configuration parameter in the CLI
configuration file, db2cli.ini, or in your data server driver
configuration file, db2dsdriver.cfg or in the connection string.


   Related information:
   Configuring Secure Sockets Layer (SSL) support in a DB2 instance
   Secure Sockets Layer (SSL)

 
CLI0222E  Authentication failed because the SSLClientLabel parameter was
      specified but the DB2 client or data server driver was not
      configured to use certificate-based authentication.

Explanation: 

You can use certificate-based authentication by setting the
authentication keyword to "CERTIFICATE" in your connection string, in
your CLI configuration file, db2cli.ini, or in your data server driver
configuration file, db2dsdriver.cfg.

When certificate-based authentication is not configured to supply
authentication information, the SSLClientLabel parameter should not be
specified. This message is returned when certificate-based
authentication is not configured to supply authentication information,
but the SSLClientLabel parameter is set in the connection string or in
the db2cli.ini configuration file or db2dsdriver.cfg configuration file.

User response: 

To authenticate using certificate-based authentication, perform the
following steps:
1. Set the authentication parameter to CERTIFICATE.

2. Specify SSLClientLabel in the CLI configuration file or in the data
   server driver configuration file.

To use an authentication method other than certificate-based
authentication, remove the SSLClientLabel parameter from the connection
string, db2cli.ini configuration file, and the db2dsdriver.cfg
configuration file.


   Related information:
   Configuring Secure Sockets Layer (SSL) support in a DB2 instance
   Secure Sockets Layer (SSL)

 
CLI0223E  The SQLReloadConfig function call was not processed because
      another execution of the SQLReloadConfig function or the
      SQLSetConnectAttr function with SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY
      attribute is already in progress.

Explanation: 

You can reload a configuration property from the IBM data server driver
configuration file by calling the SQLReloadConfig function.

Only one instance of the SQLReloadConfig function process can run at one
time. This message is returned when an attempt is made to execute the
SQLReloadConfig function or call the SQLSetConnectAttr function with
SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY attribute while another instance of
the SQLReloadConfig function is running.

User response: 

Wait for the instance of the SQLReloadConfig function or the
SQLSetConnectAttr function with SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY
attribute that is already running to stop, and then call the
SQLReloadConfig function again.


   Related information:
   SQLReloadConfig function (CLI) - Reload a configuration property from
   the client configuration file
   Connection attributes (CLI) list

 
CLI0224E  The SQLReloadConfig function call failed because an invalid
      value was specified for the ConfigProperty argument.

Explanation: 

You can reload configuration properties from a specified section of the
IBM data server driver configuration file by calling the SQLReloadConfig
function. You can identify which section to reload by specifying the
ConfigProperty argument.

This message is returned when a value other than DSD_ACR_AFFINITY is
specified for the ConfigProperty argument.

User response: 

Call the SQLReloadConfig function again, specifying valid values for all
arguments.


   Related information:
   SQLReloadConfig function (CLI) - Reload a configuration property from
   the client configuration file

 
CLI0225E  The SQLReloadConfig function call failed because the
      SQLReloadConfig function cannot access the IBM data server driver
      configuration file.

Explanation: 

You can reload a configuration property from the IBM data server driver
configuration file by calling the SQLReloadConfig function.

The SQLReloadConfig function attempts to locate the IBM data server
driver configuration file in several places:

*  The directory specified in the DB2DSDRIVER_CFG_PATH registry variable

*  The default IBM data server driver configuration file location for
   the driver type and platform

This message is returned when either the SQLReloadConfig function is
unable to locate the IBM data server driver configuration file, or when
the SQLReloadConfig function is unable to read the IBM data server
driver configuration file.

User response: 

Perform the following troubleshooting steps:
1. If the DB2DSDRIVER_CFG_PATH registry variable is set, verify that the
   IBM data server driver configuration file is located in the directory
   specified in the DB2DSDRIVER_CFG_PATH registry variable.

2. If the DB2DSDRIVER_CFG_PATH registry variable is not set, verify that
   the IBM data server driver configuration file is located in the
   default location for the driver type and platform.

3. Verify that the user id that was used to execute the application has
   read access for the IBM data server driver configuration file.


   Related information:
   SQLReloadConfig function (CLI) - Reload a configuration property from
   the client configuration file
   IBM data server driver configuration file
   IBM data server driver configuration file location

 
CLI0226E  The SQLReloadConfig function failed because sections in the
      IBM data server driver configuration file other than the section
      that was specified in the ConfigProperty argument have been
      updated.

Explanation: 

You can reload configuration properties from a specified section of the
IBM data server driver configuration file by calling the SQLReloadConfig
function. You can identify which section to reload by specifying the
ConfigProperty argument.

This message is returned when the SQLReloadConfig function detects that
sections other than the section that was specified with the
ConfigProperty argument have been updated.

User response: 

1. Return the properties in the IBM data server driver configuration
   file to values that match the currently active configuration.

2. Update only those sections in the IBM data server driver
   configuration file that are supported with the SQLReloadConfig
   function.

3. Execute the SQLReloadConfig function again, specifying the updated
   sections in ConfigProperty argument.


   Related information:
   SQLReloadConfig function (CLI) - Reload a configuration property from
   the client configuration file

 
CLI0227E  The SQLReloadConfig function failed because the CLI subsystem
      is not initialized.

Explanation: 

You can reload a configuration property from the IBM data server driver
configuration file by calling the SQLReloadConfig function.

An environment handle must be allocated before the SQLReloadConfig
function can be called.

This message is returned when the SQLReloadConfig function is called
before an environment handle has been allocated.

User response: 

Allocate an environment handle by calling the SQLAllocHandle function
before calling the SQLReloadConfig function


   Related information:
   SQLReloadConfig function (CLI) - Reload a configuration property from
   the client configuration file
   SQLAllocHandle function (CLI) - Allocate handle

 
CLI0228E  The SQLReloadConfig function failed because the IBM data
      server driver configuration file is missing one or more of the
      required sections. Database: "<database-name>". Host name:
      "<host-name>". Port number: "<port-number>".

Explanation: 

You can reload a configuration property from the IBM data server driver
configuration client configuration file by calling the SQLReloadConfig
function.

The SQLReloadConfig function requires a subset of sections to be
configured in the IBM data server driver configuration file. The list of
required sections includes the following sections: <client>,
<affinitylist>, and <alternateserverlist>.

This message is returned when an attempt is made to call the
SQLReloadConfig function when the required sections in the IBM data
server driver configuration file are not configured.

User response: 

Configure all of the sections in the IBM data server driver
configuration file that are required by the SQLReloadConfig function,
and then call SQLReloadConfig again.


   Related information:
   SQLReloadConfig function (CLI) - Reload a configuration property from
   the client configuration file
   IBM data server driver configuration file

 
CLI0229E  The SQLReloadConfig function failed because the IBM driver or
      client cannot establish a connection to any of the servers that
      are specified in the <alternateserverlist> section of the
      IBM data server driver configuration file. Database name:
      "<database-name>". Host name: "<host-name>". Port number:
      "<port-number>".

Explanation: 

You can reload a configuration property from the IBM data server driver
configuration file by calling the SQLReloadConfig function.

The SQLReloadConfig function requires that the IBM client or driver can
connect to the servers that are listed in the
<alternateserverlist> section of the IBM data server driver
configuration file.

This message is returned when an attempt is made to call the
SQLReloadConfig function when the IBM client or driver cannot connect to
any of the servers that are listed in the <alternateserverlist>
section of the IBM data server driver configuration file.

User response: 

1. For any server to which the IBM client or driver cannot connect,
   resolve the problems that are preventing the IBM client or driver
   from connecting.

2. Update the <alternateserverlist> section of the IBM data server
   driver configuration file to specify only server to which the IBM
   client or driver can connect.

3. Call SQLReloadConfig again.


   Related information:
   SQLReloadConfig function (CLI) - Reload a configuration property from
   the client configuration file
   IBM data server driver configuration file

 
CLI0230E  The SQLReloadConfig function failed because the
      SQLReloadConfig function failed to find an appropriate port number
      for a service name. Database name: "<database-name>". Host name:
      "<host-name>". Port number: "<port-number>". Service name:
      "<service-name>".

Explanation: 

You can reload a configuration property from the IBM data server driver
configuration file by calling the SQLReloadConfig function.

The SQLReloadConfig function attempts to look up the port number for
specified service names.

This message is returned when the SQLReloadConfig function cannot look
up the port number for a specified service name.

User response: 

Specify only service names that are available for lookup.


   Related information:
   SQLReloadConfig function (CLI) - Reload a configuration property from
   the client configuration file

 
CLI0231W  The SQLReloadConfig function succeeded. However, the IBM
      client or driver could not access one or more of the servers that
      are specified in the <alternateserverlist> section of the
      IBM data server driver configuration file. Database name:
      "<database-name>". Host name: "<host-name>". Port number:
      "<port-number>". List of unreachable servers, by host name and
      port number: "<host-name-and-port-number-pairs>".

Explanation: 

You can reload a configuration property from the IBM data server driver
configuration file by calling the SQLReloadConfig function.

The SQLReloadConfig function requires that the IBM client or driver can
connect to every server listed in the <alternateserverlist>
section of the IBM data server driver configuration file.

This message is returned when the SQLReloadConfig function successfully
reloads configuration information, but the IBM client or driver cannot
connect to one or more of the servers that are listed in the
<alternateserverlist> section of the IBM data server driver
configuration file.

User response: 

Optional:
1. Determine to which servers the IBM client or driver is unable to
   connect.

2. For any server to which the IBM client or driver cannot connect,
   resolve the problems that are preventing the IBM client or driver
   from connecting.

3. Update the <alternateserverlist> section of the IBM data server
   driver configuration file to specify only server to which the IBM
   client or driver can connect.

4. Call SQLReloadConfig again.


   Related information:
   SQLReloadConfig function (CLI) - Reload a configuration property from
   the client configuration file
   IBM data server driver configuration file

 
CLI0232E  Attempt to set new primary member for the client affinities
      configuration has failed as client affinities feature has not been
      enabled.

Explanation: 

The client affinities element entries are not found in the IBM data
server driver configuration file. The client affinities feature must be
configured in the IBM data server driver configuration file before you
can override the primary member with the SQLSetConnectAttr() API and the
SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY attribute.

User response: 

Create the required client affinities element entries in the IBM data
server driver configuration file and rerun the application.


   Related information:
   Configuring client affinities in non-Java clients for connection to
   DB2 for Linux, UNIX, and Windows
   Client affinities for clients that connect to DB2 for Linux, UNIX,
   and Windows
   SQLReloadConfig function (CLI) - Reload a configuration property from
   the client configuration file

 
CLI0233E  The CLI driver is unable to establish a connection to the new
      primary member.

Explanation: 

The new primary member that is set with the SQLSetConnectAttr() API and
the SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY attribute is not reachable.

User response: 

Specify another member in the <clientaffinitydefined> subsection
of the IBM data server driver configuration file and call the
SQLSetConnectAttr() API with the SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY
attribute.


   Related information:
   Configuring client affinities in non-Java clients for connection to
   DB2 for Linux, UNIX, and Windows
   Client affinities for clients that connect to DB2 for Linux, UNIX,
   and Windows
   SQLReloadConfig function (CLI) - Reload a configuration property from
   the client configuration file

 
CLI0234E  New unknown primary member cannot be specified for the client
      affinities configuration.

Explanation: 

The new primary member that is specified through the SQLSetConenctAttr
API with the SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY attribute was not
present in the <alternateserverlist> subsection of the IBM data
server driver configuration file.

User response: 

Specify existing member in the <alternateserverlist> subsection of
the IBM data server driver configuration file and call the
SQLSetConnectAttr API with the SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY
attribute or the SQLReloadConfig API.


   Related information:
   Configuring client affinities in non-Java clients for connection to
   DB2 for Linux, UNIX, and Windows
   Client affinities for clients that connect to DB2 for Linux, UNIX,
   and Windows
   SQLReloadConfig function (CLI) - Reload a configuration property from
   the client configuration file

 
CLI0235E  A concurrent attempt to set new primary member for the client
      affinities configuration failed.

Explanation: 

An application might have attempted to set new primary member by calling
the SQLSetConnectAttr API with the SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY
attribute in different threads. Also, an application might have
attempted to set new primary member by calling SQLSetConnectAttr API
with the SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY attribute at the same time
as calling the SQLReloadConfig API.

User response: 

Ensure that only one attempt to set the new primary member is made at
any one time. The new primary member can be set by calling the
SQLSetConnectAttr API with the SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY
attribute or calling the SQLReloadConfig API after modifying the IBM
data server driver configuration file.


   Related information:
   Configuring client affinities in non-Java clients for connection to
   DB2 for Linux, UNIX, and Windows
   Client affinities for clients that connect to DB2 for Linux, UNIX,
   and Windows
   SQLReloadConfig function (CLI) - Reload a configuration property from
   the client configuration file

 
CLI0236W  The NULL value that was specified for the
      SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY connection attribute is
      ignored.

Explanation: 

You can use the client affinities feature to specify an ordered list of
members to which the automatic client reroute feature will redirect
application connections. You can configure the client affinities feature
in the IBM data server driver configuration file.

The first member in the list of client affinities is called the primary
member. You can temporarily override the primary member that is
specified in the IBM data server driver configuration file by calling
the SQLSetConnectAttr API with the SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY
connection attribute.

To return to using the primary member that is specified in the IBM data
server driver configuration file, you must specify a value of NULL for
the SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY connection attribute.

This message is returned when a value of NULL is specified for the
SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY connection attribute, but the primary
member has not been overridden and the automatic client reroute feature
is already using the primary member that is specified in the IBM data
server driver configuration file.

User response: 

No action is needed.


   Related information:
   SQLSetConnectAttr function (CLI) - Set connection attributes
   Connection attributes (CLI) list

 
CLI0237W  The specified primary member is already set.

Explanation: 

You can use the client affinities feature to specify an ordered list of
members to which the automatic client reroute feature will redirect
application connections. You can configure the client affinities feature
in the IBM data server driver configuration file.

The first member in the list of client affinities is called the primary
member. You can temporarily override the primary member that is
specified in the IBM data server driver configuration file by calling
the SQLSetConnectAttr API with the SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY
attribute.

The new primary member that is specified in the SQLSetConnectAttr API
call with the SQL_ATTR_OVERRIDE_PRIMARY_AFFINITY attribute is same as
the current primary member in the client affinities list.

User response: 

No action is needed.


   Related information:
   SQLSetConnectAttr function (CLI) - Set connection attributes
   Connection attributes (CLI) list

 
CLI0238W  Unretrieved OUT parameter data from the stored procedure call
      was lost.

Explanation: 

The application called the SQLFetch API before all OUT parameter data
was retrieved with the SQLGetData API.

User response: 

If complete OUT parameter data is required, call the stored procedure
again and complete the retrieval of OUT parameter with the SQLGetData
API before fetching the result-set.


   Related information:
   Connection attributes (CLI) list
   Statement attributes (CLI) list

 
CLI0239E  The batch CALL statement cannot be processed without the
      absolute parameter length value.

Explanation: 

You specified the SQL_DATA_AT_EXEC value for the length of the parameter
in the SQLBindParameter API call. The SQL_DATA_AT_EXEC value is not
supported by the batch CALL statement.

User response: 

Specify an absolute value for length of the parameter in the
SQLBindParameter API call.


   Related information:
   SQLBindParameter function (CLI) - Bind a parameter marker to a buffer
   or LOB locator
   Statement attributes (CLI) list

 
CLI0240E  The batch CALL statement failed because the
      SQL_ATTR_ALLOW_INTERLEAVED_GETDATA attribute is specified.

Explanation: 

The SQL_ATTR_ALLOW_INTERLEAVED_GETDATA attribute is not supported by the
batch CALL statement.

User response: 

Disable the SQL_ATTR_ALLOW_INTERLEAVED_GETDATA attribute.


   Related information:
   SQLSetConnectAttr function (CLI) - Set connection attributes
   SQLSetStmtAttr function (CLI) - Set options related to a statement
   AllowInterleavedGetData IBM data server driver configuration keyword
   AllowInterleavedGetData CLI/ODBC configuration keyword

 
CLI0241E  The batch CALL statement failed because the
      SQL_ATTR_INTERLEAVED_PUTDATA or
      SQL_ATTR_INTERLEAVED_STREAM_PUTDATA statement attribute is
      specified.

Explanation: 

The SQL_ATTR_INTERLEAVED_PUTDATA and SQL_ATTR_INTERLEAVED_STREAM_PUTDATA
attributes are not supported by batch CALL statements. The
SQL_ATTR_INTERLEAVED_PUTDATA and SQL_ATTR_INTERLEAVED_STREAM_PUTDATA
attributes are enabled through the SQLSetStmtAttr API.

User response: 

Disable the SQL_ATTR_INTERLEAVED_PUTDATA or
SQL_ATTR_INTERLEAVED_STREAM_PUTDATA attribute.


   Related information:
   Statement attributes (CLI) list
   SQLSetConnectAttr function (CLI) - Set connection attributes
   Calling stored procedures from CLI applications

 
CLI0242E  The batch CALL statement failed because the array input chain
      feature was specified.

Explanation: 

The array input chain feature is not supported by the batch CALL
statement. The array input chain feature is enabled through the
following methods:

*  Enabling the ArrayInputChain keyword in the db2cli.ini file or the
   IBM data server driver configuration file.

*  Setting the SQL_ATTR_CHAINING_BEGIN or the SQL_ATTR_CHAINING_END
   attribute in the SQLSetStmtAttr API.

User response: 

Disable the array input chain feature.


   Related information:
   Statement attributes (CLI) list
   SQLSetStmtAttr function (CLI) - Set options related to a statement

 
CLI0243E  The batch CALL statement failed because the stored procedure
      contains the array data type argument.

Explanation: 

The stored procedure with array data type arguments is not supported by
the batch CALL statement.

User response: 

Call the stored procedure without the use of the batch CALL statement.


   Related information:
   Statement attributes (CLI) list
   Calling stored procedures from CLI applications

 
CLI0244E  Attempt to retrieve the latest connected member name has
      failed as client affinities feature has not been enabled.

Explanation: 

The client affinities element entries are not found in the IBM data
server driver configuration file. The client affinities feature must be
configured and the <alternateserverlist> subsection must be present
in the IBM data server driver configuration file before you obtain the
member name with the SQLGetConnectAttr API and the
SQL_ATTR_GET_LATEST_MEMBER_NAME attribute.

User response: 

Create the required client affinities element entries in the IBM data
server driver configuration file and rerun the application.


   Related information:
   Connection attributes (CLI) list
   Example of enabling client affinities for non-Java clients for DB2
   for Linux, UNIX, and Windows connections

 
CLI0245E  Attempt to set the SQL_ATTR_DATE_SEP attribute has failed
      because required SQL_ATTR_DATE_FMT attribute has not been set.

Explanation: 

The SQL_ATTR_DATE_FMT attribute must be set with the SQLSetConnect API
or the SQLSetEnvAttr API before the SQL_ATTR_DATE_SEP attribute can be
set.

User response: 

Set the SQL_ATTR_DATE_FMT attribute with the SQLSetConnect API or the
SQLSetEnvAttr API before you set the SQL_ATTR_DATE_SEP attribute.


   Related information:
   Environment attributes (CLI) list
   Connection attributes (CLI) list

 
CLI0246E  Attempt to set the SQL_ATTR_TIME_SEP attribute has failed
      because required SQL_ATTR_TIME_FMT attribute has not been set.

Explanation: 

The SQL_ATTR_TIME_FMT attribute must be set with the SQLSetConnect API
or the SQLSetEnvAttr API before the SQL_ATTR_TIME_SEP attribute can be
set.

User response: 

Set the SQL_ATTR_TIME_FMT attribute with the SQLSetConnect API or the
SQLSetEnvAttr API before you set the SQL_ATTR_TIME_SEP attribute.


   Related information:
   Connection attributes (CLI) list
   Environment attributes (CLI) list

 
CLI0247I  The array statement execution request is completed. A new
      array statement is used for further chaining of data.

Explanation: 

CLI array input chaining can reduce the number of network flows to the
server, which can improve performance. After the chain is finished, all
of the chained SQLExecute() function requests at the client are sent to
the server.

The CLI driver converts the chaining of data in a MERGE statement to
array input. The arrays that are used for buffering the MERGE statements
are of a set size. If a statement requires more resources than one array
can handle, the CLI driver executes the array that is currently buffered
and uses one or more arrays to execute the remaining data in the MERGE
statement.

This message is returned when the size limit of an array, which is used
to process MERGE statement, is reached or when the total data size
reaches 20 MB.

The SQLExecute() function was called successfully.

User response: 

No action is needed.


   Related information:
   Connection attributes (CLI) list
   Statement attributes (CLI) list

 
CLI0248W  The DB2 trace buffer size was not set to the value specified
      with the db2trcStartupSize keyword or the
      SQL_ATTR_DB2TRC_STARTUP_SIZE environment attribute because the
      trace buffer has already been allocated.

Explanation: 

You can configure the size of the DB2 trace buffer by specifying a size
with the db2trcStartupSize keyword in the IBM data server driver
configuration file (db2dsdriver.cfg)or the SQL_ATTR_DB2TRC_STARTUP_SIZE
environment attribute. When both the db2trcStartupSize keyword and the
SQL_ATTR_DB2TRC_STARTUP_SIZE environment attribute are set, the
db2trcStartupSize keyword takes precedence.

You can configure the size of the DB2 trace buffer only before an
environment handle is allocated by the process that uses the database
product libraries. While database product libraries are loaded in the
operating system, the DB2 trace buffer size cannot be changed by
modifying the db2trcStartupSize keyword or by setting the
SQL_ATTR_DB2TRC_STARTUP_SIZE environment attribute.

You can use the db2trc info command to determine the size of the DB2
trace buffer.

User response: 

To increase the trace buffer, perform the following steps:
1. If applicable, stop the database manager by issuing the db2stop
   command.

2. Stop the db2trc process by issuing the db2trc command with the "off"
   option.

3. Start the DB2 trace process by issuing the db2trc command, specifying
   the new DB2 trace buffer size with the -l parameter.

4. If applicable, start the database manager by issuing the db2start
   command.

5. Clear the db2trace buffer by issuing the db2trc command with the
   "clear" option.


   Related information:
   Obtaining a DB2 trace using db2trc
   db2trc - Trace command
   db2stop - Stop DB2 command
   db2start - Start DB2 command

 
CLI0249E  Attempt to load the IBM Global Security Toolkit (GSKit) key
      management library failed.

Explanation: 

The CLI driver loads the GSKit key management library during allocation
of the first environment handle. This error can be returned under one of
the following conditions:

*  The GSKit library is not installed on the client system.

*  The CLI driver cannot find the GSKit key management library.

*  The CLI driver cannot find one or more of the dependent library files
   that are required by the GSKit key management library.

User response: 

Ensure that the GSKit key management library files are present under the
<install_path>/lib/icc directory. If you have installed a separate
GSKit package, ensure that the following environment variables are set
to the GSKit installation directory.

*  PATH

*  LIBPATH (for AIX)

*  LD_LIBRARY_PATH (for Linux and UNIX operating system other than AIX)


   Related information:
   Configuring Secure Sockets Layer (SSL) support in non-Java DB2
   clients
   Introduction to Global Security Kit installation
   IBM Global Security Kit global installation instructions overview

 
CLI0250E  Attempt to create the keystore database failed.

Explanation: 

The CLI driver creates the keystore database during allocation of the
first environment handle. This error is returned when the IBM Global
Security Toolkit (GSKit) API called by the CLI driver returns an error.

The error can be returned under one of the following conditions:

*  One of the dependent GSKit library is missing.

*  The CLI driver process does not have authority to create the keystore
   database.

*  The disk is full.

User response: 


*  Ensure that the GSKit key management library files are present under
   the <install_path>/lib/icc directory. If the GSKit library
   files are missing, reinstall the database product or install the
   GSKit software package.

*  Ensure that the user ID under which the CLI application is running
   has sufficient authority to read and write to the keystore database
   directory.

*  Check the db2diag.log file for error codes from the GSKit API. See
   the IBM Global Security Toolkit documentation for the error details.


   Related information:
   GSKit return codes
   Introduction to Global Security Kit installation

 
CLI0251E  Attempt to store the SSL certificate failed.

Explanation: 

The CLI driver stores the SSL certificate, which is passed as a value
from the location that is defined by the SSLCertificate keyword, in the
keystore database when an SSL connection is attempted. This error is
returned when the IBM Global Security Toolkit (GSKit) API called by the
CLI driver returns an error.

The error can be returned under one of the following conditions:

*  The certification authority (CA) certificate that is specified in the
   SSLCertificate keyword does not exist.

*  The CLI driver is unable to access the SSL certificate.

*  The CLI driver is unable to open the keystore database.

*  The format of the SSL certificate is incorrect. The SSL certificate
   consists of ASCII text that is enclosed between the BEGIN CERTIFICATE
   and END CERTIFICATE text.

*  The keystore database or its tables are corrupted.

*  The GSKit API encountered a memory allocation error. The db2diag.log
   file can contain additional information regarding the error that is
   returned by the GSKit API.

User response: 


*  Ensure that a fully qualified path is specified for the
   SSLCertificate keyword.

*  Ensure that the keystore database exists and the user ID under which
   the CLI application is running has read and write permission to the
   keystore database directory.

*  Ensure that the SSL certificate consists of ASCII text that is
   enclosed between the BEGIN CERTIFICATE and END CERTIFICATE text.

*  Restart the application to resolve corrupted keystore database or
   keystore tables.


   Related information:
   Introduction to Global Security Kit installation
   GSKit return codes

 
CLI0600E   Invalid connection handle or connection is closed.

Explanation: 

Connection had been closed prior to the operation.

User response: 

Ensure connection close is not called prior to the operation.

 
CLI0601E   Invalid statement handle or statement is closed.

Explanation: 

Statement had been closed prior to the operation.

User response: 

Ensure statement close and statement connection close are not called
prior to the operation.

 
CLI0602E   Memory allocation error on server.

Explanation: 

Cannot allocate memory on server.

User response: 

Ask your database administrator to check the DB2 JDBC log file for
details. Rerun your program.

 
CLI0603E   CallableStatement get*** method was called without
      registerOutParameter.

Explanation: 

Get*** method was called on a parameter that was not registered using
registerOutParameter.

User response: 

Add registerOutParameter call for the parameter.

 
CLI0604E   CallableStatement get*** method was called without calling
      execute.

Explanation: 

The CallableStatement get*** method was called prior to calling
CallableStatement execute.

User response: 

Make sure that CallableStatement execute is called prior to any
CallableStatement get*** method.

 
CLI0605E   CallableStatement get*** method did not match the type used
      in registerOutParameter.

Explanation: 

The CallableStatement get*** method was not the one that corresponds to
the type used in registerOutParameter for this parameter.

User response: 

Change to the get*** method that matches to the type used in
registerOutParameter for this parameter. (Refer to JDBC specification)

 
CLI0606E   The returned value from a column is incompatible with the
      data type corresponding to the get*** method.

Explanation: 

The value in a CHAR/VARCHAR/LONGVARCHAR column is not a valid numeric
value.

User response: 

Use the appropriate get methods other than the ones that return numeric
values.

 
CLI0607E  Invalid datetime format.

Explanation: 

The value in CHAR, VARCHAR, LONGVARCHAR, GRAPHIC, or VARGRAPHIC column
is invalid date/time/ timestamp value.

User response: 

Use appropriate get*** method other than getDate/getTime/ getTimestamp.

 
CLI0608E   Invalid conversion.

Explanation: 

The get*** method is invalid on this column type.

User response: 

Use the valid get*** method (see JDBC specification) to retrieve data
from this column.

 
CLI0609E   Numeric value out of range.

Explanation: 

The value of this column is too large/small for a short or int value,
conversion will cause data loss.

User response: 

Use the get method that can accommodate the value.

 
CLI0610E   Invalid column number.

Explanation: 

The column number is less than 1 or greater than the total number of
columns in the ResultSet.

User response: 

Make sure the column number is no less than 1 and no greater than the
total number of columns.

 
CLI0611E   Invalid column name.

Explanation: 

The given column name cannot be found in the ResultSet.

User response: 

Ensure the column name is correct.

 
CLI0612E   Invalid parameter number.

Explanation: 

The given parameter number is less than 1 or greater than the total
number of parameters.

User response: 

Ensure the parameter number is no less than 1 and no greater than the
total number of parameters.

 
CLI0613E   Program type out of range.

Explanation: 

The object given in the PreparedStatement/CallableStatement setObject is
not a valid object type.

User response: 

Make sure the object to be set is one of the object types allowed in
setObject (see JDBC specification).

 
CLI0614E   Error sending to the socket, server is not responding.

Explanation: 

Error happened while sending data to server, server may be down.

User response: 

Ensure the server is up, and rerun your program.

 
CLI0615E   Error receiving from socket, server is not responding.

Explanation: 

Error happened while receiving from server, server may be down.

User response: 

Ensure JDBC server is up, and rerun your program.

 
CLI0616E   Error opening socket.

Explanation: 

Cannot open the socket to server, server may be down.

User response: 

Ensure JDBC server is up, and rerun your program.

 
CLI0617E   Error closing socket.

Explanation: 

Cannot close the socket to server. Server may be down.

User response: 

Ensure JDBC server is up, and rerun your program.

 
CLI0618E   Userid and/or password invalid.

Explanation: 

The given userid/password is not valid.

User response: 

Make sure the userid/password is correct, and rerun your program.

 
CLI0619E   Invalid UTF8 data format.

Explanation: 

When getUnicodeStream is called on columns that are not DBCS columns,
the decoding from UTF8 format is done, but the data cannot be decoded
properly.

User response: 

Use getString, getBytes, getAsciiStream, or getBinaryStream instead.

 
CLI0620E   IOException, error reading from input stream.

Explanation: 

Error happened when reading data to be put from input stream.

User response: 

Make sure the file exists, and file length is correctly given.

 
CLI0623E  Code page conversion tables do not exist.

Explanation: 

Cannot find the codepage conversion tables.

User response: 

Ensure the conversion tables (from the local codepage to Unicode and
from Unicode to the local codepage) are installed.

 
CLI0624E  Code page conversion tables are not loaded.

Explanation: 

Cannot load the codepage conversion tables.

User response: 

Ensure your JDBC application has access to the code page tables and the
tables are not corrupted.

 
CLI0625E  You specified JDBC 1.22 behavior; cannot use JDBC 2.0
      functions.

Explanation: 

The function you are trying to call is a new function defined in JDBC
2.0, but you specified you want JDBC 1.22 behavior.

User response: 

Do not set the JDBCVERSION keyword to "122" if you want to use JDBC 2.0
functions. It should remain unset or be set to "200".

 
CLI0626E  "<function-name>" is not supported in this version of DB2 JDBC
      2.0 driver.

Explanation: 

This feature is not supported by this version of the DB2 JDBC 2.0
driver.

User response: 

Do not use this feature.

 
CLI0627E  The result set is not scrollable.

Explanation: 

The result set is not scrollable.

User response: 

Ensure you set the statement/result set attribute to SCROLLABLE.

 
CLI0628E  No. "<parameter-number>" parameter marker in parameter set no.
      "<set-number>" is not set.

Explanation: 

The set<data-type> method has not been called for this input
parameter.

User response: 

Call the set<data-type> method to specify the data type of and
input value for this input parameter.

 
CLI0629E  "<function-name>" is not supported for this column.

Explanation: 

This operation cannot be called for this column.

User response: 

Change to other method.

 
CLI0630E  Unknown result set type/concurrency "<number>".

Explanation: 

An invalid value for result set type or concurrency has been specified.

User response: 

Change the value to the proper value given in the specification.

 
CLI0631E  No random access for mixed char/clob column.

Explanation: 

Random access is not supported for this mixed char column.

User response: 

Retrieve the data sequentially.

 
CLI0632E  Invalid fetch size; it must be between 0 and maxRows,
      inclusively.

Explanation: 

The fetch size specified must be greater than or equal to 0, and less
than or equal to maxRows.

User response: 

Modifiy the value.

 
CLI0633E  Cannot call relative() when there is no current row.

Explanation: 

The relative method was called when the cursor is not at a valid row.

User response: 

First move the cursor to a valid row (using absolute, next, etc), then
call relative.

 
CLI0634E  Error allocating CLI environment handle.

Explanation: 

SQLAllocEnv failed during initialization.

User response: 

Ensure the DB2INSTANCE environment variable is set properly.

 
CLI0635E  "<function-name>" is not supported in an applet.

Explanation: 

<function-name> is not supported in an applet.

User response: 

Avoid using <function-name> in an applet.

 
CLI0636E  Property "<property-name>" is not specified for the Context
      object.

Explanation: 

Property "<property-name>" is not specified for the Context
object in your Java application.

User response: 

Ensure that the property "<property-name>" is specified for
the Context object in your Java application.

 
CLI0637E  "<object>" cannot be found.

Explanation: 

<object> does not exist.

User response: 

Ensure that the <object> exists.

 
CLI0638E  "<object>" already exists.

Explanation: 

<object> cannot be created as it already exists.

User response: 

Ensure that the operation is correct.

 
CLI0639E  Empty string.

Explanation: 

An empty string is not allowed.

User response: 

Correct the string specified.

 
CLI0640E  "<object>" cannot be listed.

Explanation: 

<object> cannot be listed.

User response: 

Ensure that the <object> can be listed.

 
CLI0641E  There is a SELECT statement in the batch.

Explanation: 

A SELECT statement is not allowed in the batch.

User response: 

Remove the SELECT statement from the batch.

 
CLI0642E  Invalid fetch direction.

Explanation: 

The fetch direction specified is not supported.

User response: 

Correct the fetch direction.

 
CLI0643E  There is no statement in the batch.

Explanation: 

The batch does not have any statement.

User response: 

Add a statement to the batch.

 
CLI0644E  Invalid row value to the absolute() call.

Explanation: 

The row value specified to absolute() is invalid.

User response: 

Correct the row value.

 
CLI0645E  Error registering driver "<class-name>". Message: "<message>".
      SQLSTATE: "<sqlstate>". SQLCODE: "<sqlcode>".

Explanation: 

The DriverManager is unable to register the DB2 JDBC driver.

User response: 

Correct the problem as indicated by the returned message, SQLSTATE and
SQLCODE, and run your program again.

 
CLI0646E  Cannot find library "<library-name>".

Explanation: 

"<library-name>" cannot be found in the library path. The
library path is defined by the environment variable for the following
operating systems:

AIX (Java 1.1)

         LD_LIBRARY_PATH

AIX (Java 1.2 or later)

         LIBPATH

HP-UX

         SHLIB_PATH

Linux

         LD_LIBRARY_PATH

Silicon Graphics IRIX

         LD_LIBRARY_PATH

Solaris Operating Environment

         LD_LIBRARY_PATH

Windows operating systems

         PATH

User response: 

Ensure your application environment is configured correctly to use DB2.
On UNIX platforms, ensure that the sqllib/db2profile script has been run
to set your environment variables.

 
CLI0647E  Error allocating DB2 environment handle. Return code =
      "<return-code>".

Explanation: 

The DB2 CLI environment could not be established.

User response: 

Ensure your application environment is configured correctly to use DB2.
On UNIX platforms, ensure that the sqllib/db2profile script has been run
to set your environment variables. To interpret the return code, refer
to the CLI Guide and Reference section on SQLAllocHandle().

 
CLI0648N  The ResultSet is closed.

Explanation: 

The ResultSet was closed prior to the operation.

User response: 

Ensure ResultSet.close() was not called prior to the operation. If you
are processing multiple ResultSets using getMoreResults(), please ensure
you call getResultSet() prior to accessing the new ResultSet.

 
CLI0649N  executeQuery is only allowed for statements that return a
      ResultSet.

Explanation: 

executeQuery is only allowed for statements that return a ResultSet.
Such SQL statements include SELECT, VALUES, WITH, and CALL statements.

User response: 

Use executeUpdate() or execute().

 
CLI0650N  A query is not allowed in an executeUpdate().

Explanation: 

You cannot issue a query with executeUpdate().

User response: 

Use executeQuery() or execute().

 
CLI0651N  The stream contains more or less data than is specified.

Explanation: 

The number of bytes or characters in the stream is not equal to the
given length.

User response: 

Specify the correct length.

 
CLI0652W  The execution of the query will not be atomic because the
      database server does not support atomic operations for non-insert
      queries.

Explanation: 

You can use the SQL_ATTR_PARAMOPT_ATOMIC statement attribute to specify
whether the processing of multiple parameter markers should be done
altogether as one operation (atomic) or as multiple operations
(non-atomic.) For example, specifying a value of SQL_ATOMIC_YES causes
the underlying processing of the query to be performed as an atomic
operation.

This message is returned when the following conditions are all true for
a given query:

*  The SQL_ATTR_PARAMOPT_ATOMIC attribute is set to SQL_ATOMIC_YES for
   the query.

*  The query is not an insert operation.

*  The query is executed against a DB2 for z/OS database server, which
   does not support atomic processing of non-insert queries.

User response: 

You do not need to respond to this warning. There is no method for
forcing a non-insert query to be executed atomically against a DB2 for
z/OS database server.

 
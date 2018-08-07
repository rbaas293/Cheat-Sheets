## Batch CheatSheet


#### Getting information about your batch file or another file called in the script:

* You can only extract path and filename from (1) a parameter of the BAT itself `%1`, or (2) the parameter of a `CALL %1` or (3) a local `FOR` variable `%%a`.
* in HELP CALL or HELP FOR you may find more detailed information:

```batch
%~1 - expands %1 removing any surrounding quotes (")
%~f1 - expands %1 to a fully qualified path name
%~d1 - expands %1 to a drive letter only
%~p1 - expands %1 to a path only
%~n1 - expands %1 to a file name only
%~x1 - expands %1 to a file extension only
%~s1 - expanded path contains short names only
%~a1 - expands %1 to file attributes
%~t1 - expands %1 to date/time of file
%~z1 - expands %1 to size of file 
```

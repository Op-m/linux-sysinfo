#### How to run command:
```  
sysinfo.sh -c cmd_list -o output.html
```
> -c cmd_list is the template to use (see template setup below) [required]

> -o output.html is the html output file (default: sysinfo.html) [optional] 

> run with -h option to display help menu [optional]

#### Setup command template:

##### Source bash functions 
```
source /$(pwd)/functions
```
##### Create a heading

```bash
heading_start "Example Heading"
```

##### Create a sub heading with command output
Start with sub heading

```bash
sub_start "Example sub heading"
```
Now add the command to show
```bash
run_command "route -n"
```
> Surround commands with double quotes.

##### Complete and finish headings
Close sub heading
```bash
sub_end
```
Close heading
```bash
heading_end
```

End result would like something like this:
```bash
source /$(pwd)/functions

heading_start "Example Heading"

  sub_start "Example sub heading"

    run_command "route -n"

  sub_end

heading_end
```
> NB: indention is not required, just makes it look nicer

HTML output:
![Example Screenshot](http://i.imgur.com/3gB42Ts.png)

You can also create nested sub headings 
```bash
source /$(pwd)/functions

heading_start "Example Heading"

  sub_start "Example sub heading"

    sub_start "Nested sub heading 1"

    run_command "route -n"

    sub_end
    
    sub_start "Nested sub heading 2"

    run_command "ifconfig -a"

    sub_end

  sub_end

heading_end
```
![Example Screenshot](http://i.imgur.com/PchzWeb.png)

#### This script also supports more complicated commands (see below)

###### Advanced example 1:
```bash
sub_start "Advanced Example 1"
  run_command "[ -f /etc/hosts ] && echo 'File Exist' && grep 'local' /etc/hosts | wc -l"
sub_end
```
###### Advanced example 2:
```bash
sub_start "Advanced example 2"
  ifconfig | grep 'eth\|lo' | cut -c1-4 >interfaces.tmp
  while read line
  do
    run_command "ethtool $line"
  done <interfaces.tmp
  rm -f interfaces.tmp
sub_end
```
###### Loop example:
```bash
sub_start "Loop Example"
  for i in {1..5}
  do
    run_command echo "$i"
  done
sub_end
```

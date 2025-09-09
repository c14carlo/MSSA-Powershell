# MSSA-Powershell/Bash
Showing what I learn from the basics to more advanced 

PowerShell & Bash Basics

** PowerShell (Windows, cross-platform with PowerShell Core)

** Bash (Linux, macOS, Windows via WSL)

What is a Shell?

** A shell is a command interpreter that lets you interact with your operating system by typing commands instead of clicking around with a mouse.

** Bash (Bourne Again Shell): The default on most Linux/macOS systems. Great for scripting, automation, and system administration.

** PowerShell: Microsoft’s task automation framework. More object-oriented and powerful for Windows and cross-platform administration.

Getting Started
Running the Shells

PowerShell:

** Windows: Built in (powershell or pwsh for PowerShell Core).

** Linux/macOS: Install via PowerShell GitHub


Bash:

** Linux/macOS: Already installed (bash).

** Windows: Install via WSL (Windows Subsystem for Linux) or Git Bash.



******** Common Powershell Commands ********


** Navigation & File Management **

Get-Location → Shows the current working directory (similar to pwd in Bash).

Set-Location <path> → Changes the current directory (alias: cd).

Get-ChildItem → Lists files and directories (alias: ls, dir).

New-Item -ItemType File/Directory → Creates a new file or folder.

Remove-Item <path> → Deletes files or directories (alias: rm, del).

Copy-Item <source> <destination> → Copies files or directories (alias: cp).

Move-Item <source> <destination> → Moves or renames items (alias: mv).


** Reading & Writing Content **

Get-Content <file> → Displays the contents of a file (alias: cat, gc).

Set-Content <file> "text" → Writes/replaces text in a file.

Add-Content <file> "text" → Appends text to an existing file.

Out-File <file> → Sends command output into a file.


** System Information **

Get-Command → Lists all available commands.

Get-Help <command> → Displays help info and usage examples.

Get-Process → Shows all running processes.

Stop-Process -Name <name> → Stops a running process by name or ID.

Get-Service → Lists system services and their status.

Start-Service <name> → Starts a stopped service.

Stop-Service <name> → Stops a running service.


** Variables & Objects **

$variable = value → Creates a variable.

Write-Output "text" → Prints output to the console (alias: echo).

Get-Member → Displays properties/methods of an object (great for exploring).

Select-Object <property> → Picks specific object properties.

Sort-Object <property> → Sorts results by property.

Measure-Object → Performs calculations (count, sum, avg, etc.).


** Filtering & Pipelines **

Where-Object { condition } → Filters objects in the pipeline.

Get-Process | Where-Object { $_.CPU -gt 50 }

ForEach-Object { action } → Runs an action for each object.

Get-Service | ForEach-Object { $_.Name }

 
 ** Permissions & Users **

Get-ExecutionPolicy → Shows script execution policy.

Set-ExecutionPolicy RemoteSigned → Changes execution policy.

Get-LocalUser → Lists local user accounts.

New-LocalUser → Creates a new local user.

 
 ** Networking **

Test-Connection <host> → Pings a host (like ping).

Invoke-WebRequest <url> → Fetches data from a URL (alias: wget, curl).

Resolve-DnsName <domain> → Performs DNS lookup (like nslookup).

Get-NetIPAddress → Shows local IP configuration.


** Scripting Essentials **

if (condition) { } else { } → Conditional logic.

for ($i=1; $i -le 5; $i++) { } → Looping.

try { } catch { } → Error handling.

function My-Function { } → Defines a function.



****** Common Bash Commands ******

 
 ** Navigation & File Management **

pwd → Prints the current working directory.

ls → Lists files and directories (use ls -l for details, ls -a for hidden files).

cd <path> → Changes the current directory.

mkdir <folder> → Creates a new directory.

rmdir <folder> → Removes an empty directory.

rm <file> → Removes files (use rm -r <folder> for directories).

cp <source> <dest> → Copies files or directories.

mv <source> <dest> → Moves or renames files/directories.

touch <file> → Creates an empty file or updates file timestamp.


** Viewing & Editing Files **

cat <file> → Displays the contents of a file.

less <file> → Views file contents page by page.

head <file> → Shows the first 10 lines of a file.

tail <file> → Shows the last 10 lines of a file (use tail -f <file> to follow logs in real-time).

nano <file> → Opens file in Nano editor.

vim <file> → Opens file in Vim editor.



** System Information **

whoami → Shows the current logged-in user.

uname -a → Prints system info (kernel, architecture, etc.).

top → Displays running processes in real-time.

ps aux → Lists all running processes.

kill <PID> → Kills a process by process ID.

df -h → Shows disk usage (human-readable).

free -h → Shows memory usage.

uptime → Displays system uptime and load average.



** Variables & Output **

VAR=value → Creates a variable.

echo $VAR → Prints the variable value.

echo "text" → Prints text to the terminal.

> → Redirects output to a file (overwrite).

>> → Redirects output to a file (append).

< → Reads input from a file.

| → Pipes output of one command into another.



** Searching & Filtering **

grep "text" <file> → Searches for text in a file.

find <path> -name "file.txt" → Finds files by name.

locate <file> → Quickly searches for files in the database.

wc <file> → Counts lines, words, and characters in a file.

sort <file> → Sorts lines in a file.

uniq → Removes duplicate lines from input.



** Permissions & Ownership **

chmod 755 <file> → Changes file permissions.

chown user:group <file> → Changes file owner and group.

sudo <command> → Runs a command as the superuser.

who → Lists logged-in users.



** Networking **

ping <host> → Tests connectivity to a host.

curl <url> → Fetches data from a URL.

wget <url> → Downloads a file from a URL.

ifconfig → Displays network interfaces (older systems).

ip addr → Shows network interface details (modern).

netstat -tulnp → Shows active network connections.

ssh user@host → Connects to a remote host via SSH.

scp file user@host:/path → Securely copies files to a remote host.



** Scripting Essentials **

if [ condition ]; then ... fi → Conditional statement.

for i in {1..5}; do ... done → Loop through a range.

while [ condition ]; do ... done → While loop.

function name { ... } → Defines a function.

$? → Returns the exit status of the last command.












$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()
$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)

$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator

if ($myWindowsPrincipal.IsInRole($adminRole))
   {
   # We are running "as Administrator" - so change the title and background color to indicate this
   $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"
   $Host.UI.RawUI.BackgroundColor = "DarkBlue"
   clear-host
   }
else
   {

   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";

   $newProcess.Arguments = $myInvocation.MyCommand.Definition;

   $newProcess.Verb = "runas";

   [System.Diagnostics.Process]::Start($newProcess);

   exit
   }

$computername = (Get-WmiObject -Class win32_operatingsystem).csname

$key = (Get-WMIObject -query "select * from SoftwareLicensingService").Oa3xoriginalProductKey
slmgr /ipk "$key"
slmgr /ato
exit
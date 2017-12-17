param
(
	$EmailFrom = "",
	$EmailTo = "",
	$EmailSubject = "Email subject",
	$emailbody = "Email Body",
	$SMTPServer = "smtp.gmail.com",
	$SMTPAuthUsername = "",
	$SMTPAuthPassword = ""
)
## Required for Gmail: https://www.google.com/settings/security/lesssecureapps

## $emailattachment = "C:\Temp\test1.txt"

$mailmessage = New-Object system.net.mail.mailmessage
$mailmessage.from = ($Emailfrom)
$mailmessage.To.add($Emailto)
$mailmessage.Subject = $EmailSubject
$mailmessage.Body = $emailbody

#$attachment = New-Object System.Net.Mail.Attachment($emailattachment, 'text/plain')
#$mailmessage.Attachments.Add($attachment)

#$mailmessage.IsBodyHTML = $true

$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer,"587")
$SMTPClient.EnableSsl=$true;
$SMTPCred=New-Object System.Net.NetworkCredential("$SMTPAuthUsername", "$SMTPAuthPassword");
$SMTPClient.Credentials = $SMTPCred;
$SMTPClient.Send($mailmessage);

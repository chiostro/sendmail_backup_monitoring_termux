# Termux Shell Scripts for Automation

This project contains a collection of **bash shell scripts** for automating various tasks on your Android device via **Termux**. The scripts provide functionalities for:

- Sending emails with attachments from the command line.
- Performing automated backups of specific folders.
- Monitoring smartphone resources, such as **memory**, **storage**, and **CPU** usage.

## Features

### 1. **Send Emails with Attachments**
- Automates email sending with attachments using **msmtp** **mutt**.
- Supports multiple email providers.
- Easy to integrate into any automation process.

### 2.  **Backup Folders**
- Create a backup of any specified folder by passing it as a parameter to the script.
- Automatically compresses the folder into a `.tar.gz` file.
- Supports custom folder paths and destinations is where un run the scripts.

### 3.  **Monitor Smartphone Resources**
- **Memory Usage**: Provides details on used, free, and cached memory.
- **Storage Status**: Shows free and used space for internal storage (and SD card in the next release).
- **CPU Usage**: Displays CPU load, temperature (if available), and basic system stats.

## Setup and Installation

1. **Install Termux**: If you don't have **Termux** installed on your Android device, you can download it from the **Google Play Store** or **F-Droid**.
   
2. **Install Dependencies**: You will need a few packages to run these scripts. Install them with the following commands:

   ```bash
   pkg update
   pkg install msmtp mutt git
Clone the Repository:

git clone https://github.com/chiostro/sendmail_backup_monitoring_termux.git
cd sendmail_backup_monitoring_termux
 
Make Scripts Executable: Set the appropriate permissions to execute the scripts:

chmod +x *.sh
How to Send an Email with msmtp
Before using the email functionality, you'll need to configure msmtp with your email provider’s settings. For Gmail, you'll need to generate an App Password if you have 2FA enabled.

Gmail 2FA Setup and App Password Generation
If you haven’t already enabled 2FA (Two-Factor Authentication) on your Gmail account, follow these steps:

Go to your Google Account settings: https://myaccount.google.com/

In the left sidebar, click Security.

Scroll to the "Signing in to Google" section.

Select 2-Step Verification, then follow the on-screen instructions to set it up.

Once 2FA is enabled, you can generate an App Password:

Go back to your Google Account security settings.

Under "App passwords" (just below 2-Step Verification), click Generate.

Choose Mail and Other (Custom name), and name it something like Termux.

Google will generate a 16-character password. This is the App Password you’ll use for msmtp.

Configure msmtp with Gmail
Create or edit the msmtp configuration file in your Termux home directory (~/.msmtprc):
My setup.sh will help you, parameters are 2 : your email account (create new one to test) and your special password  generated for 2FA by gmail

sh setup.sh your-email@gmail.com xxxx xxxx xxxx xxxx
cat ~/.msmtprc
#nano ~/.msmtprc
Add the following configuration, if you do not read after cat command:

account default
host smtp.gmail.com
port 587
from your-email@gmail.com
user your-email@gmail.com
password 'your-app-password'
tls on
tls_starttls on
auth on
logfile ~/.msmtp.log
Replace your-email@gmail.com with your Gmail address.

Replace 'your-app-password' with the 16-character App Password you generated.

Save the file and set the appropriate permissions:

chmod 600 ~/.msmtprc
Sending Emails with msmtp
Now that msmtp is set up, you can send emails with attachments from the command line. For example:

echo -e "Subject: Test Email\n\nHello from Termux!" | msmtp recipient-email@example.com
To send an email with an attachment:


You can use the provided script test_email_attached.sh to send emails automatically with attachments.:


How to Use the Backup Script
The backup script allows you to back up any folder by specifying the folder path as an argument. The backup will be compressed into a .tar.gz file.

Example:
./backup.sh /storage/emulated/0/Download
This command will create a backup of the Download folder and store it as YYMMDD_HHMM_backup.tar.gz in the current directory.

Monitor Your Smartphone’s Resources
The  scripts provide real-time monitoring of the following:

CPU Usage: Displays the current CPU load and temperature (if available).

Memory Usage: Shows details about free and used memory.

Storage Usage: Displays available and used space on internal storage and SD card.

Example:
./chk_cpu.sh
Contributions
Feel free to fork the repository and submit your contributions or suggestions. If you find any issues or bugs, please open an issue.

License
This project is licensed under the MIT License.


### Key Highlights:

- **Two-Factor Authentication Setup for Gmail**: Instructions on how to enable 2FA and create an app-specific password.
- **msmtp Configuration**: How to configure msmtp with Gmail for sending emails with attachments.
- **Backup Script**: How to use the backup script to back up specific folders.
- **System Monitoring Scripts**: Descriptions of how to monitor CPU, memory, and storage with your scripts.

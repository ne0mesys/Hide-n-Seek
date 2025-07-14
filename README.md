# 🧩 Hide-n-seek.sh by ne0mesys
***This script has been created by ne0mesys and serves as an automation tool, to which pentesters are able to use to hide information, data or just a simple text, as well as extracting it from images. I hope you like it ;)***

## Welcome

This software is an automation tool that pentesters are able to use to encode and encrypt data withing images, in order to send privilage information safer. This tool is developed in a way that allows pentesters to not just encrypt and embed data to images, but to extract and decrypt as well that information with a passphrase. This passphrase is set in the embedding process and it is needed to extract all available information. 

Please! Be careful at the time to attach data to images, as it only needs a simple passphrase, which in case it is not strong, it could be brute-forced and decrypted. 

Be aware that you will need an image to use as communication medium. 

This tool is developed strictly for educational and ethical purposes. I DO NOT take any responsibility for the misuse of this toool. 

By ne0mesys

## Requirements 

### For Linux

***Steghide*** is required in order to perform the whole embedding part. In case you don't have it installed, you can find the instructions below for Linux users:

```
sudo apt update
sudo apt install steghide
```

**Without this software the script won't work!**

### For Arch Linux

***Steghide*** is required in order to perform the whole embedding part. In case you don't have it installed, you can find the instructions below for Arch Linux users:

```
sudo pacman -S steghide
```

**Without this software the script won't work!**

### For Windows


***Steghide*** is required in order to perform the whole embedding part. In case you don't have it installed, you can find the instructions below for Windows users: 

**OpenStego** is a GUI (Graphical User Interface) for Windows users, as **Steghide** is not available in Windows. Please follow the following steps in order to download it: 

* Open this link [OpenStego GUI(Releases)](https://github.com/syvaidya/openstego/releases)
* Download the **openstego-(latest_version).zip** file.
* Decompress the **openstego-(latest_version).zip** file.
* Run the **openstego-(latest_version).exe** file.
* Enjoy it ;)

## Installation 

### For Linux

Here's a short documentation about how to install the script for Linux users:

```
sudo apt install git
sudo git clone https://github.com/ne0mesys/hide-n-seek
cd hide-n-seek
```

### For Arch Linux

Here's a short documentation about how to install the script for Arch Linux users:

```
sudo pacman -S git
sudo git clone https://github.com/ne0mesys/hide-n-seek
cd hide-n-seek
```

## Execution

Once we are in the same folder of the software, we can proceed to enable its execution. We can do this with the following command:

```
sudo chmod +x Hide-n-seek.sh
```

The software includes the Shebang line, ```#!/bin/bash``` which allows the user to execute it directly. We can do this using the command ```./Hide-n-seek.sh```.

However, it would be necessary to have the script **always** in the same directory we are in. Therefore, I highly suggest to move a copy with execution permits to the **$PATH** so we use it as a command: ```hidden```

In order to do this perform the next commands in the terminal:

```
sudo chmod +x Hide-n-seek.sh
sudo mv Hide-n-seek.sh /usr/local/bin/hidden
```

**Now you are able to use the script as a command in the terminal!**

**Try it with the command** ```hidden```

## About

This tool has been created in order to encrypt and embed it to images. Instead of typing all the commands in the terminal, I have decided to shorten the process with this script. 

This script rather than just allowing to have the whole embedding process automated, allows as well to have it in a colorful output that enhances the whole process.

The use of parameters that can be indicated by the user, allows to perform the embedding step faster and better structured. This scrip tuses the following tool in order to perform this action: ***steghide***. It uses as well several customized functions created for this script, such as ***extractText*** & ***sendText***.

The **parameters** of this script are the following ones:

* -s) Sends hidden text within an Image.
* -e) Extracts hidden text from an Image.
* -h) Shows the help panel

## Author:

* Ne0mesys

Feel free to open an Issue...
```
E-Mail at: ne0mesys.acc@gmail.com
```

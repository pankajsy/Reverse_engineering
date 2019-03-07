# android-reverse-engineering
Application Security (CS-GY 9163)
Introduction
Reverse Engineering requires highlighting of technical aspects in the system or application. This
requires thorough analysis of its architecture, working and functioning to get to know more about
its behaviour under worst and best case scenarios. Applications are compiled to work in byte
code mode. Reverse engineering needs to decompile that byte code and extract the source code
of the application. It's a way to understand the engineering and functioning behind any software
and build a new software on top of it to reverse its functioning.
In this assessment, reverse engineering for an Android application will end up in extracting the
source Java code from a binary file which is in the form of APK. Obfuscation is a constructive
hurdle in the process of reverse engineering. It cannot disable reverse engineering process but
makes things look complex and increases the time to crack the apk.
Reverse engineering deploys three core processes.
● Parsing and semantic analysis of code
● Extracting information from the code
● Dividing the product into components

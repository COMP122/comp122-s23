# Introduction to COMP122
#### Version: Spring 2023

This repository provides you with material associated with COMP122.  During the semester, the professor will be adding additional information to this repository. As such, you will need to regularly perform a `git pull`operation to obtain the most up-to-date information.

In addition to this repository, you will also need to clone a number of other repositories. These other repositories are primarily associated with deliverables to various assignments, projects, and exams.  All of the material for COMP122 is organized within a predefined file directory ($HOME/classes/COMP122).  (A directory is akin to a folder.)

This README.md file provides you with an overview of this structure, key information, and a set of tasks to perform to get ready for this semester.  

---
## Canonical Root: $HOME/classes/comp122
  * Top-level documents
    - introduction.md: A copy of the README.md document
    - syllabus.md: The course syllabus
    - assignments.md: Living document enumerating class assignments

    
  * General Subdirectories:
    - administrative: various files associated with the administrative process of this class
    - bin: various programs associated with COMP122

    - deliverables: directory for the placement of all deliverables)
      - 11-\<name\>-\<account\> (Section #1, Deliverable #1)
      - 24-\<name\>-\<account\> (Section #2, Deliverable #4)
      - ...
      - 40-\<name\>-\<account\> (Section #4, Deliverable #0)

    - reference: reference documents


  * Section Subdirectories
    - models-comp-comm/
      - lecture_ordering.md: inform regarding slide presentations
      - Lecture Notes (notes_mm_dd.md)
      - Addendum Notes per class <br>
        (addendum_mm_dd_XX.md where XX= MM, MA, TM, TA)
      - Copies of Slides within the "documents/" subdirectory

    - format-encodings/
      - with the same substructure as "models_comp_comm"

    - digital-logic/
      - with the same substructure as "models_comp_comm"

    - assembly-programming/
      - with the same substructure as "models_comp_comm"

---
## Key Information:
  * Canonical Class Directory: $HOME/classes/comp122
  * Git Organization and Repositories
    - COMP122 Home: https://github.com/COMP122
    - COMP122 class material: https://github.com/COMP122/comp122-s23.git
  * Software Requirements
    - Sublime Text (editor): https://www.sublimetext.com
    - One Markdown: from the AppStore or other Markdown Viewer
       - https://apps.microsoft.com/store/detail/markdown-view/9PJ021LR0M3G
       - https://apps.apple.com/us/app/one-markdown/id1507139439
    - Slack (for class communication): https://slack.com 
    - Git: preinstall or https://gitforwindows.org
    - Java JDK: https://www.oracle.com/java/technologies/downloads/
 

---
## Assignment #01 (To be completed ASAP)
  First, take steps to upgrade your computer to the lastest version of your OS (operating system).  Without a current version, you may run
  into a number of compatability issues, which can lead to you not being successful in completing the following tasks. 
 
  1. Establish Accounts:
     - https://slack.com: 
       - Your account should be associated with your @my.csun.edu address.
     - https://github.com: 
       - Your account name should be clearly identify yourself in a professional manner.
       - All deliverables are submitted via GitHub Classrooms.

  1. Install Software on your personal computer:
     - Sublime Text Editor: https://www.sublimetext.com
       (MacOS: Note you must move the ublime Text application from the Downloads folder to the Applications folder.)
     - A Markdown View: (for example)
       - https://apps.microsoft.com/store/detail/markdown-view/9PJ021LR0M3G
       - https://apps.apple.com/us/app/one-markdown/id1507139439
     - Slack: https://slack.com  <br />   
       * Consider installing the mobile application as well
     - Git for Windows: https://gitforwindows.org
     - Java JDK: https://www.oracle.com/java/technologies/downloads/


  1. Join the Slack COMP122 work space:
     - Accept the invitation <br/> via https://join.slack.com/t/comp122-csun/signup using your @my.csun.edu address.
     - Add the '#fitzgerald-s23' channel, this is where all class discussions are held.
     - Respond to the 'Hello Class!' post via the 'reply to thread' option (do NOT "Also send to #fitzgerald-s23").


  1. Setup your local Comp122 environment: <br/>
     Launch a gitbash (Windows), or Launch a terminal (All other OSes), then execute the commands associated with each of the following steps.

     1. If you are a MacOS users, ensure you are using the bash shell: 
        ```
        echo $SHELL
        ```
        If the output is not `/bin/bash`, then

        - change your shell to bash
          ```
          chsh -s /bin/bash
          ```
        - close the current terminal window
        - launch a new terminal window

     1. Create the canonical folder for the class: \~/classes/comp122 
        ```
         cd
         mkdir -p classes/comp122
         ```
     1. Setup your git global configuration: <br />
        (update the following command to reflect your name and email address)
        ```
        git config --global user.name "John Doe"
        git config --global user.email johndoe@my.csun.edu
        ```

     1. Clone a copy of this repository:
        ```
        cd classes
        git clone https://github.com/COMP122/comp122-s23.git comp122
        ```
     1. Update the appropriate startup file to source COMP122's `.profile.comp122.`   For example:
        ```
        cd
        touch .profile
        mv .profile .profile.orig
        echo 'source ~/classes/comp122/.profile.comp122'  >> .profile
        source .profile
        ```

     1. For System Security reasons, you may need to register the MARS IDE with the Operating System.
        - Open up File Explorer (Windows) or Finder (Mac)
        - Navigate to the COMP122 bin directory:  ~/classes/comp122/bin/
        - First Double-click the Mars4_5.jar icon, notice if your receive the message: <br>
            "Mars4_5.jar” cannot be opened because it is from an unidentified developer.
        - If you receive this message, you must Control-click the Mars4_5.jar icon, then choose Open from the shortcut menu<br>
        Thereafter, you can Double-click the Mars4_5.jar icon to open the application.



  1. Test your local environment.  First open a new terminal and execute the following commands:
     ```
     cd $COMP122_HOME
     cd mips
     mars add4.s
     mips_subroutine add4 2 4 6 8
     ```
     
     Ensure your terminal has the following output:
     ```
     dwarf:~ steve$ cd $COMP122_HOME
     dwarf:comp122 steve$ cd mips
     dwarf:mips steve$ mars add4.s
     MARS 4.5  Copyright 2003-2014 Pete Sanderson and Kenneth Vollmar
     
     10
     dwarf:mips steve$ mips_subroutine add4 2 4 6 8
             20; 0x00 00 00 14; 0b0000 0000 0000 0000 0000 0000 0001 0100;
     
     dwarf:mips steve$ 
     ```
     Note that the substring `dwarf: steve$ ` is my prompt. Your prompt will differ.

If you have any problems completing these tasks, post a message in the #fitzgerald-s23 channel.

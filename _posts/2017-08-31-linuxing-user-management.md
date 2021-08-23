---
date: 2017-08-31
permalink: /linux/user-management

categories : [Linux]
tags : [user, command-line, multiuser-environments]
title : "A concise guide to Linux - User Management"
defaults:
  - scope:
      path: ""
      type: posts
    values:
      layout: single
      author_profile: true
      read_time: true
      comments: true
      share: true
      related: true
---

Linux is a multi-user operating system. This essentially separates the users environment from the administrative environment. This kind of paradigm has many advantages.

- Multiple users can work on a same resource without having to replicate the data.
- Secure from malicious software, as they will be run in the user mode and cannot access any system related information.
- We can have variations of configurations for different users on a single system.

Since, the title says a practical guide, I will dig right into commands rather than boring you with theory that is available in a zillion "learning Unix" tutorials online. If you are looking for a more comprehensive approach, you can refer [here](http://swift.siphos.be/linux_sea/usermanagement.html#idm3548298394608).

Lets go from a constructive learning point of view. How do you (a smart person) build an User Management system that enables its users to have both shared resources and isolated resources? What are its utilities? What are the constraints you will face and how will you overcome them?

### Adding an User
Obviously, I need to be able to add an user to the system. For this I provide an `useradd` command.

`sudo useradd rajiv`

Now what? Is the user created? How do you know?

>In most \*nix systems the directory `/etc` stores all the configuration files corresponding to the system.

We have a file named `passwd` in the `/etc` directory which stores all the required information about an user, one user per line.

This is how an entry in the `/etc/passwd` looks like for the user `rajiv`.

`rajiv:x:500:500::/home/rajiv:/bin/bash`

Each user entry (line) contains 7 sections separated by colons.

- Username
- Password (Well, not exactly password, but later!)
- UID (user Id)
- Primary Group ID
- Description
- Home directory
- Default Shell

But there are so many properties here, but you have given only the username. Who takes care of the remaining? You can customize the above parameters listed above using special flags into which we will go in a bit. The parameters whose flags went unspecified will take their default values.
Here is the list of the available flags. They speak for themselves. They are fun in that way.

```
Usage: useradd [options] LOGIN
       useradd -D
       useradd -D [options]

Options:
  -b, --base-dir BASE_DIR       base directory for the home directory of the
                                new account
  -c, --comment COMMENT         GECOS field of the new account
  -d, --home-dir HOME_DIR       home directory of the new account
  -D, --defaults                print or change default useradd configuration
  -e, --expiredate EXPIRE_DATE  expiration date of the new account
  -f, --inactive INACTIVE       password inactivity period of the new account
  -g, --gid GROUP               name or ID of the primary group of the new
                                account
  -G, --groups GROUPS           list of supplementary groups of the new
                                account
  -h, --help                    display this help message and exit
  -k, --skel SKEL_DIR           use this alternative skeleton directory
  -K, --key KEY=VALUE           override /etc/login.defs defaults
  -l, --no-log-init             do not add the user to the lastlog and
                                faillog databases
  -m, --create-home             create the user's home directory
  -M, --no-create-home          do not create the user's home directory
  -N, --no-user-group           do not create a group with the same name as
                                the user
  -o, --non-unique              allow to create users with duplicate
                                (non-unique) UID
  -p, --password PASSWORD       encrypted password of the new account
  -r, --system                  create a system account
  -R, --root CHROOT_DIR         directory to chroot into
  -s, --shell SHELL             login shell of the new account
  -u, --uid UID                 user ID of the new account
  -U, --user-group              create a group with the same name as the user
  -Z, --selinux-user SEUSER     use a specific SEUSER for the SELinux user mapping

```

You can get this by simply typing `useradd` into your Shell.

Now let us create an user using some of these options.

`sudo useradd -d /home/teja -u 777 teja`

Here is the entry that will be added to the `/etc/passwd` file.

`teja:x:777:777::/home/teja:/bin/bash`

What happens when you try to access files of user `rajiv` from `teja`. Lets create two files `rajiv.txt` in `/home/rajiv` and `teja.txt` in `/home/teja`.  Now if you try to access `rajiv.txt` as `teja` you will get a *permission denied*  exception. Thus it essentially isolates data of one user from the other and therefore your data is secure. However it is not completely secure yet. Any user with SuperUser privileges can still access your files. To avoid this kind of situations, we have an option to set password for accessing our files. This can be set during the user creation time itself.

`useradd -d /home/rajiv -u 369 -p PASSWORD rajiv`

Now if someone tries to access your files as a superuser they will  be prompted for the password and thus your files are as safe as you keep your password.

Until now we have seen one of the advantages of Linux user management i.e., ability to manage several users on a single system with complete isolation as if they are on two different systems. Another advantage is that it enables users to work together with shared resources and essentially cuts down data replication. It achieves this using the concept of groups.

### Creating a group

A group can be best defined by the resource it holds rather than the users it contain. Because an user can be a part of multiple groups. Group is an abstract concept unlike an User as it doesn't exist physically. It is just defined by the resources to which several users have access to. An user can switch to one of his registered groups and create some files. Those files can be accessed by the other members of same group.

#### Adding an Group

 Similar to `useradd` command, there is a `groupadd` command which helps us in creating a group. And all the information about all the groups is listed in the `/etc/group` file.

 `sudo groupadd north`

Also, there are two kinds of groups - Primary group and secondary groups. Primary  group is assigned during `useradd` and secondary groups can be added as we go using `usermod`.

##### Assigning a primary group while creating an user
This creates a new user and while it does, assigns its primary group as *north* instead of *arya*.
`sudo useradd -g north arya`


##### Changing the Primary group

Since, we already have an user named *dany* belonging to its primary group *dany*, the following command changes its primary group from *dany* to *north*.
`sudo usermod -g north dany`

All the files generated by *dany* after this point will be accessible by users in the group *north*.

### Deleting an User

This deletes the user but keeps all his files in the system drive.
`sudo userdel rajiv`

This deletes the user along with all his files.
 `sudo userdel -r rajiv`

### Deleting a Group
Deleting a group is similar except that you can't delete a primary group of an existing user. To delete a group you should first make sure that it is not the Primary group of any of the existing users.
`sudo groupdel <group-name`

### Changing the Password of an User

You can do so only with root privileges. This could be done using the `passwd` command.
```
[rajiv@rajiv ~]$ sudo passwd rajiv
Changing password for user rajiv.
New password:
BAD PASSWORD: it is too short
BAD PASSWORD: is too simple
Retype new password:
passwd: all authentication tokens updated successfully.
```

### Just some more FYI

- Present day Linux systems store their passwords as hashes in a special file called `/etc/shadow` and will be readable only by a super user. It also contains information about when it was last modified, how long for/since its expiry etc..,
- You can learn about any user using either `id <username` or `finger <username`.
- The **primary  group** will be used by default when an user creates a file.
- You can check all the secondary groups of an user by using `groups <username`
- `sg y 'touch newFile'` is used to switch group for a single command. This creates a new file named `newFile` and assigns it to group `y`.  

- `newgrp <group-name` can also be used to change the primary group of an user.


---------------------------------------------------------------------------


Here's an xkcd for surviving my war and peace.

<img src="/public/img/push.png">



-*Rajiv*

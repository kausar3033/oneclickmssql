## MSSQL IN LINUX

#### Step 1: Update Ubuntu System:
    sudo apt-get update
   #sudo apt-get -y upgrade
    
###  If you have kernel updates done, ensure a reboot is done for the system to boot into a new kernel.
  ##  reboot
    
### Step 2: Import the public repository GPG keys:
    sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    
### Step 3: Add Microsoft SQL Server 2019 Ubuntu repository:

#### Add Microsoft SQL Server 2019/2022 APT repository to your Ubuntu 20.04/18.04/16.04 system.

### Ubuntu 20.04:
    #sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2022.list)"

### Ubuntu 20.04:
    sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list)"		
			
### Ubuntu 18.04	
    #sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2019.list)"	
    #sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/18.04/mssql-server-2017.list)"
    
   ### mssql-server-2017 for opmanager
			
### Ubuntu 16.04:
    #sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2019.list)"	
  
### Step 4: Install MS SQL Server 2019 on Ubuntu 20.04/18.04/16.04 LTS    

#### Now run the following commands to install SQL Server
    sudo apt-get update
    sudo apt-get install -y mssql-server
    
### Please run the following command to complete the setup of Microsoft SQL Server
    sudo /opt/mssql/bin/mssql-conf setup
   #Enter your edition(1-8): 2
 
   #Do you accept the license terms? [Yes/No]:Yes

   #Enter the SQL Server system administrator password:

   #Confirm the SQL Server system administrator password:
 
 ### The MS SQL service should be started.
    #systemctl status mssql-server.service 
    
    
### End 

## Additional configuration need base 
    
### Step 6: Install MS SQL tools and unixODBC plugin

#### install SQL Tools with exact version  which mssql APT repository  you have installed 

#### Now install Install MS SQL tools and unixODBC plugin:
    
    
#### Ubuntu 20.04:
       #### curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
	
	 #### curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
	
	  ####sudo apt update 
	
	 #### sudo ACCEPT_EULA=Y apt install mssql-tools unixodbc-dev
	
#### Ubuntu 18.04:	
    	####curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
	
	 #### curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
	
	 #### sudo apt update 
	
	 #### sudo ACCEPT_EULA=Y apt install mssql-tools unixodbc-dev
	
#### Ubuntu 16.04:	
      ####  curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

   	  ####curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
	
	 #### sudo apt update
	
	  ####sudo ACCEPT_EULA=Y apt install mssql-tools unixodbc-dev
    
### Step 7: Configure PATH for MS SQL binaries	
	
#### To make sqlcmd/bcp accessible from the bash shell for login sessions, modify your PATH in the ~/.bash_profile file with the following command:	
    ####echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
    ####source ~/.bash_profile
	
#### To make sqlcmd/bcp accessible from the bash shell for interactive/non-login sessions, modify the PATH in the ~/.bashrc file with the following command:
   #### echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
   #### source ~/.bashrc

#### Connect to MS SQL console:
    ####sqlcmd -S 127.0.0.1 -U ibos
	
    
### Enable the SQL Server Agent    

#### To enable SQL Server Agent, follow the steps right
    sudo /opt/mssql/bin/mssql-conf set sqlagent.enabled true
    sudo systemctl restart mssql-server
    systemctl restart mssql-server.service   
### Store procedure 
#<a href ='https://ola.hallengren.com/sql-server-backup.html' > Download MaintenanceSolution.sql and run from MSSM </a>  
    rm /home/finis/oneclickmssql -rf
    
